#!/usr/bin/env sh
set -e

if [ ! -z ${TZ+x} ]; then
    if [ -f "/usr/share/zoneinfo/$TZ" ]; then
        cp /usr/share/zoneinfo/$TZ /etc/localtime
        echo "$TZ" > /etc/timezone
        echo "Timezone set to $TZ"
    else
        echo "Environment variable TZ ($TZ) is invalid, ignoring..."
    fi
fi

if [ ! -z ${CRON+x} ]; then
    echo "${CRON} ouroboros $@ --interval 1 --runonce" | crontab -
    echo "Cron schedule set to $CRON"
else
    echo "Please set the environment variable CRON to your desired update schedule."
    exit 1
fi

exec crond -f
