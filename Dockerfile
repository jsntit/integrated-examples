FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy=github.com/klzgrad/forwardproxy@naive \
    --with github.com/imgk/caddy-trojan \
    --with github.com/mholt/caddy-webdav \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/xcaddyplugins/caddy-trusted-cloudfront \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/tencentcloud \
    --with github.com/mholt/caddy-events-exec \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddyserver/jsonc-adapter \
    --with github.com/tailscale/caddy-tailscale \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
