---
sidebar_position: 2
title: Installation
---

Run Perga locally with Docker in two ways:

- Quick install with `install.sh` (recommended)
- Manual install with `docker compose`

## Download all install files in one command

```bash
mkdir -p perga-install && cd perga-install && \
  curl -fsSL \
    -O https://docs.getperga.me/installation/docker-compose.yml \
    -O https://docs.getperga.me/installation/.env.example \
    -O https://docs.getperga.me/installation/install.sh && \
  chmod +x install.sh
```

## Quick install (install.sh)

```bash
./install.sh
```

Notes:
- On first run, if `.env` is missing, the script creates it from `.env.example` and exits so you can edit it. Re-run `./install.sh` afterward.

Verify:
- Web UI: http://localhost:3000
- OpenAPI docs: http://localhost:8000/docs


## Manual install (docker compose)

1) Create and edit your env
```bash
cp .env.example .env
# open .env and set strong SECRET_KEY and DB creds
```
Env vars:
- `POSTGRES_*` — Postgres credentials and DB name
- `API_BASE_URL` — Web → API URL (default `http://127.0.0.1:8000/api/v1`)
- `CORS_ORIGINS`, `SECRET_KEY` — API security (use a strong random secret)
- `IS_SIGNUP_DISABLED` — set `true` to disable self‑signup

2) Start services
```bash
docker compose pull
docker compose up -d
```

Check status
```bash
docker compose ps
```

Access
- Web UI: http://localhost:3000
- OpenAPI docs: http://localhost:8000/docs



---

### Update to a newer version
```bash
docker compose pull
docker compose up -d
```

