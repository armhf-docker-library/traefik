FROM armhfbuild/alpine:3.3

RUN apk add --update ca-certificates \
 && rm /var/cache/apk -fR \
 && update-ca-certificates

ARG TRAEFIK_VERSION

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /usr/local/bin/traefik
RUN chmod u+x /usr/local/bin/traefik

ENTRYPOINT ["/usr/local/bin/traefik"]
