FROM circa10a/ouroboros:latest

MAINTAINER Ryan Foster <phasecorex@gmail.com>

RUN apk add --no-cache tzdata

COPY entrypoint.sh /

STOPSIGNAL SIGKILL

ENTRYPOINT ["/entrypoint.sh"]
