FROM circa10a/ouroboros:latest

MAINTAINER Ryan Foster <phasecorex@gmail.com>

COPY entrypoint.sh /

STOPSIGNAL SIGKILL

ENTRYPOINT ["/entrypoint.sh"]
