/*
 * The module's test matrix through the wasm2c build, the way the suite
 * consumes it: one instance per decode, the file and its name placed in
 * the module's memory with its malloc, decode(data, len, name, name_len)
 * called as a C function, the answer read back and checked against the
 * memory's size, a trap ending the decode and the instance with it.
 *
 *   decode_test corpus-dir
 *
 * reads corpus-dir/cases.txt ("name file tolerance" per line, files
 * relative to corpus-dir, references in refs/<name>.rgba with the size in
 * refs/<name>.dim) and every file under corpus-dir/bad, which must fail
 * without taking the process down. Exit status is the number of failures.
 *
 * The runtime hands traps to decodeTrapHandler (WASM_RT_TRAP_HANDLER in
 * the recipe), the name the suite uses; there it throws, here it longjmps
 * out of the module's frames to the decode that was running.
 */

#include <setjmp.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "decode.h"

static jmp_buf trap_target;

void decodeTrapHandler(wasm_rt_trap_t code) {
    longjmp(trap_target, (int) code + 1);
}

static uint8_t *slurp(const char *path, size_t *size) {
    FILE *f = fopen(path, "rb");

    if (!f) {
        return NULL;
    }

    fseek(f, 0, SEEK_END);
    long n = ftell(f);
    rewind(f);

    uint8_t *buf = malloc(n > 0 ? (size_t) n : 1);

    if (n > 0 && fread(buf, 1, (size_t) n, f) != (size_t) n) {
        fclose(f);
        free(buf);
        return NULL;
    }

    fclose(f);
    *size = (size_t) n;
    return buf;
}

struct image {
    uint32_t width;
    uint32_t height;
    uint8_t *rgba;  // a copy, the instance is gone by the time it is used
};

/* One decode in a fresh instance. Returns 0 ok, 1 the module answered 0,
   2 the answer did not fit its memory, 3 a trap, 4 a host failure. */
static int decode_file(const uint8_t *data, size_t len, const char *name, struct image *out) {
    w2c_decode instance;
    volatile int rc = 4;

    wasm2c_decode_instantiate(&instance);

    // a trap inside the module lands in decodeTrapHandler and comes back here
    if (setjmp(trap_target) != 0) {
        rc = 3;
        goto done;
    }

    size_t name_len = strlen(name);

    if (len > 0xffffffffu - name_len) {
        goto done;
    }

    uint32_t total = (uint32_t) (len + name_len);
    uint32_t in = w2c_decode_malloc(&instance, total);
    wasm_rt_memory_t *memory = w2c_decode_memory(&instance);

    if (!in || (uint64_t) in + total > memory->size) {
        goto done;
    }

    memcpy(memory->data + in, data, len);
    memcpy(memory->data + in + len, name, name_len);

    uint32_t res = w2c_decode_decode(&instance, in, (uint32_t) len, in + (uint32_t) len, (uint32_t) name_len);

    w2c_decode_free(&instance, in);
    memory = w2c_decode_memory(&instance);

    if (!res) {
        rc = 1;
        goto done;
    }

    if ((uint64_t) res + 8 > memory->size) {
        rc = 2;
        goto done;
    }

    uint32_t header[2];
    memcpy(header, memory->data + res, sizeof(header));

    uint64_t bytes = (uint64_t) header[0] * header[1] * 4;

    if (!header[0] || !header[1] || bytes > 0xffffffffu || (uint64_t) res + 8 + bytes > memory->size) {
        rc = 2;
        goto done;
    }

    out->width = header[0];
    out->height = header[1];
    out->rgba = malloc((size_t) bytes);
    memcpy(out->rgba, memory->data + res + 8, (size_t) bytes);
    w2c_decode_free(&instance, res);
    rc = 0;

done:
    wasm2c_decode_free(&instance);
    return rc;
}

static const char *basename_of(const char *path) {
    const char *slash = strrchr(path, '/');

    return slash ? slash + 1 : path;
}

static int check_case(const char *dir, const char *name, const char *file, int tolerance) {
    char path[4096];
    size_t len, ref_len;

    snprintf(path, sizeof(path), "%s/%s", dir, file);
    uint8_t *data = slurp(path, &len);

    snprintf(path, sizeof(path), "%s/refs/%s.rgba", dir, name);
    uint8_t *ref = slurp(path, &ref_len);

    snprintf(path, sizeof(path), "%s/refs/%s.dim", dir, name);
    FILE *d = fopen(path, "r");
    unsigned width = 0, height = 0;

    if (!data || !ref || !d || fscanf(d, "%u %u", &width, &height) != 2) {
        printf("FAIL %s: corpus incomplete\n", name);
        return 1;
    }

    fclose(d);

    struct image img;
    int rc = decode_file(data, len, basename_of(file), &img);

    if (rc) {
        printf("FAIL %s: decode returned %d\n", name, rc);
        return 1;
    }

    if (img.width != width || img.height != height) {
        printf("FAIL %s: %ux%u, reference %ux%u\n", name, img.width, img.height, width, height);
        return 1;
    }

    size_t bytes = (size_t) width * height * 4;

    if (ref_len != bytes) {
        printf("FAIL %s: reference has %zu bytes, expected %zu\n", name, ref_len, bytes);
        return 1;
    }

    int worst = 0;
    size_t over = 0;

    for (size_t i = 0; i < bytes; i++) {
        int diff = abs((int) img.rgba[i] - (int) ref[i]);

        if (diff > worst) {
            worst = diff;
        }

        if (diff > tolerance) {
            over++;
        }
    }

    printf("%s %s: %ux%u max diff %d, %zu bytes over tolerance %d\n", over ? "FAIL" : "ok  ", name, width, height, worst, over, tolerance);
    free(img.rgba);
    free(data);
    free(ref);

    return over ? 1 : 0;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: decode_test corpus-dir\n");
        return 4;
    }

    const char *dir = argv[1];
    char path[4096];
    int failures = 0;

    wasm_rt_init();

    snprintf(path, sizeof(path), "%s/cases.txt", dir);
    FILE *cases = fopen(path, "r");

    if (!cases) {
        fprintf(stderr, "decode_test: no %s\n", path);
        return 4;
    }

    char name[256], file[1024];
    int tolerance;

    while (fscanf(cases, "%255s %1023s %d", name, file, &tolerance) == 3) {
        failures += check_case(dir, name, file, tolerance);
    }

    fclose(cases);

    // the broken files: anything but a clean failure of the decode is a bug
    snprintf(path, sizeof(path), "%s/bad.list", dir);
    FILE *bad = fopen(path, "r");

    if (bad) {
        while (fscanf(bad, "%1023s", file) == 1) {
            snprintf(path, sizeof(path), "%s/%s", dir, file);
            size_t len;
            uint8_t *data = slurp(path, &len);

            if (!data) {
                printf("FAIL %s: unreadable\n", file);
                failures++;
                continue;
            }

            struct image img;
            int rc = decode_file(data, len, basename_of(file), &img);

            if (rc == 0) {
                printf("ok   %s: decoded anyway, %ux%u\n", file, img.width, img.height);
                free(img.rgba);
            } else if (rc == 1 || rc == 3) {
                printf("ok   %s: rejected (%s)\n", file, rc == 3 ? "trap" : "null");
            } else {
                printf("FAIL %s: decode returned %d\n", file, rc);
                failures++;
            }

            free(data);
        }

        fclose(bad);
    }

    wasm_rt_free();

    return failures;
}
