# Ouroboros Scheduler
Run Ouroboros on a cron schedule instead of an interval

## How to Run
This image extends `circa10a/ouroboros`, so go here to learn all about how to use it: https://github.com/circa10a/ouroboros

There are two extra environment variables you can specify with this image:
- `CRON=15 5 * * *`: Specify the cron schedule you would like Ouroboros to run at.
- `TZ=America/Detroit`: Specify a timezone for easier cron scheduling.

The other difference with this image is that specifying options via command line arguments are not supported. Just specify them as environment variables instead and you'll be all set.

## Examples
Command line:
```
docker run -d --name ouroboros-scheduler \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e CRON="15 5 * * *" \
  -e TZ=America/Detroit \
  phasecorex/ouroboros-scheduler
```

Docker-compose:
```
version: "3"
services:
  ouroboros-scheduler:
    image: phasecorex/ouroboros-scheduler:latest
    restart: always
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    environment:
      - TZ=America/Detroit
      - CRON=15 5 * * *
      - CLEANUP=true
      - KEEPTAG=true
```
