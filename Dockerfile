FROM alpine:edge
MAINTAINER John Peel "john@dgby.org"

RUN apk add --no-cache tini curl tar perl perl-dev perl-app-cpanminus \
  && cpanm Data::Dumper \
  && curl -fSL "http://prdownloads.sourceforge.net/pisg/pisg-0.73.tar.gz" -o "/tmp/pisg-0.73.tar.gz" \
  && tar zxvf /tmp/pisg-0.73.tar.gz -C /opt

VOLUME /config /output /logs /cache

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/opt/pisg-0.73/pisg", "-co", "/config/pisg.cfg"]
