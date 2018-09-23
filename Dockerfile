FROM alpine:edge
MAINTAINER John Peel "john@dgby.org"

RUN apk add --no-cache perl \
  && apk add --no-cache --virtual .build-deps wget curl tar perl-dev perl-app-cpanminus build-base \
  && cpanm Data::Dumper Text::Iconv \
  && curl -fSL "http://prdownloads.sourceforge.net/pisg/pisg-0.73.tar.gz" -o "/tmp/pisg-0.73.tar.gz" \
  && tar zxvf /tmp/pisg-0.73.tar.gz -C /opt \
  && apk del .build-deps

VOLUME /config /output /logs /cache

CMD ["/opt/pisg-0.73/pisg", "-co", "/config/pisg.cfg"]
