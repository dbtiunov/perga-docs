#!/bin/sh
set -e

echo "Installing Perga..."

# Ensure nginx config exists (required by docker-compose volume mount)
mkdir -p nginx
if [ ! -f nginx/nginx.conf ]; then
  echo "Fetching default nginx.conf..."
  curl -fsSL -o nginx/nginx.conf https://docs.getperga.me/installation/nginx/nginx.conf
  echo "nginx/nginx.conf downloaded. You can customize it if needed."
fi

if [ ! -f .env ]; then
  cp .env.example .env
  echo ".env created from .env.example. You can customize it if needed."
fi

docker compose pull
docker compose up -d

echo "Done! You can access Perga now:"
echo "Web UI: http://localhost:3000"
echo "API docs: http://localhost:8000/docs"
