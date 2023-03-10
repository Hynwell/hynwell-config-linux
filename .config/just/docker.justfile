set dotenv-load := true
set shell := ["zsh", "-uc"]

commands:
  just --list

start:
  docker compose down 
  docker compose up -d

stop:
  docker compose down

logs:
  docker ps -q | xargs -L 1 docker logs

prom_apply:
  docker compose up -d --force-recreate
