# docker-ccaa
CCAA(https://github.com/helloxz/ccaa) Docker version

I forked and modified the bt-tracker updating script.

## Environment variables

* **`CADDYUSER`** - Caddy Username; default: `ccaa`
* **`CADDYPASS`** - Caddy Password; default: `ccaa`
* **`SECRET`** - Aria2 RPC Secret; default: `ccaa`

## Ports

* **6800** - Aria2 RPC
* **6080** - Caddy

## Data Storage
You can map this directory to the host : `/data/`

## RUN

```bash
docker run -d -p 6080:6080 -p6800:6800\
           --restart=always \ 
           -v:/data:/data \
           --env CADDYUSER=ccaa \ 
           --env CADDYPASS=ccaa \
           --env SECRET=ccaa \
           zemal/docker-ccaa
```
