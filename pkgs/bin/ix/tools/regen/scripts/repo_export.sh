#!/usr/bin/env sh

set -xue

IX_EXEC_KIND=fake IX_DUMP_REPO=1 IX_SEED=1 ./ix build set/ci | ix_repo | sort | uniq | ix_flt | sort | uniq > pkgs/die/scripts/dump.json
