# Ouroboros Scheduler
Run Ouroboros on a cron schedule instead of an interval

## How to Run
This image extends `circa10a/ouroboros`, so go here to learn all about how to use it: https://github.com/circa10a/ouroboros

There are two extra environment variables you can specify with this image:
- `CRON=15 5 * * *`: Specify the cron schedule you would like Ouroboros to run at.
- `TZ=America/Detroit`: Specify a timezone for easier cron scheduling.

This image supports specifying Ouroboros arguments either via environment variables or via command arguments. The CRON and TZ will still need to be environment variables though.

## Examples
Command line (environment variables):
```
docker run -d --name ouroboros-scheduler \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e CRON="15 5 * * *" \
  -e TZ=America/Detroit \
  -e CLEANUP=true \
  -e KEEPTAG=true \
  phasecorex/ouroboros-scheduler
```
Command line (command arguments):
```
docker run -d --name ouroboros-scheduler \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e CRON="15 5 * * *" \
  -e TZ=America/Detroit \
  phasecorex/ouroboros-scheduler --cleanup --keeptag
```
Docker-compose (environment variables):
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
Docker-compose (command arguments):
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
    command: --cleanup --keeptag
```
