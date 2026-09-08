{% extends '//die/go/build.sh' %}

{% block go_tool %}
bin/go/lang/26
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/cloudflared
{% endblock %}

{% block patch %}
grep -q 'edgeConn, err := dialer.DialContext(dialCtx, "tcp", edgeTCPAddr.String())' ../../edgediscovery/dial.go
sed -i 's|edgeConn, err := dialer.DialContext(dialCtx, "tcp", edgeTCPAddr.String())|edgeConn, err := dialSocksOrDirect(dialCtx, \&dialer, edgeTCPAddr.String())|' ../../edgediscovery/dial.go

cat << 'GOEOF' > ../../edgediscovery/dial_socks.go
package edgediscovery

import (
	"context"
	"net"
	"os"

	"golang.org/x/net/proxy"
)

// dialSocksOrDirect routes the edge dial through the SOCKS5 proxy named
// by TUNNEL_EDGE_SOCKS5, falling back to the plain dialer without it.
func dialSocksOrDirect(ctx context.Context, direct *net.Dialer, addr string) (net.Conn, error) {
	socks := os.Getenv("TUNNEL_EDGE_SOCKS5")
	if socks == "" {
		return direct.DialContext(ctx, "tcp", addr)
	}

	sd, err := proxy.SOCKS5("tcp", socks, nil, direct)
	if err != nil {
		return nil, err
	}

	return sd.(proxy.ContextDialer).DialContext(ctx, "tcp", addr)
}
GOEOF
{% endblock %}

{% block go_url %}
https://github.com/cloudflare/cloudflared/archive/refs/tags/2026.8.3.tar.gz
{% endblock %}

{% block go_sha %}
0a62ee03b6a580a3c16e386d69c03becd392cd301b370a6c67d7ab6bb014ffa5
{% endblock %}

{% block go_bins %}
cloudflared
{% endblock %}
