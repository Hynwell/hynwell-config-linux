set shell := ["zsh", "-uc"]

commands:
  just --list

start: 
  docker compose up -d

stop:
  docker compose down

update:
  docker compose up -d --force-recreate

logs:
  docker compose logs

logs-100:
  docker compose logs -f --tail=100

logs-all:
  docker ps -q | xargs -L 1 docker logs

ps:
  docker ps