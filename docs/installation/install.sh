#!/bin/sh
set -e

echo "Installing Perga..."

if [ ! -f .env ]; then
  cp .env.example .env
  echo ".env created from .env.example"
  echo "Please review .env before continuing"
  exit 0
fi

docker compose pull
docker compose up -d

echo "Done!"
