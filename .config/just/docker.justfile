set dotenv-load := true
set shell := ["zsh", "-uc"]

commands:
  just --list

start: 
  docker compose up -d

stop:
  docker compose down

update:
  docker compose up -d --force-recreate

l:
  docker compose logs

l-100:
  docker logs -f --tail=100

l-all:
  docker ps -q | xargs -L 1 docker logs

ps:
  docker ps