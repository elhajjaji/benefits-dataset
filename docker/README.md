# Docker

## Composants

- `postgres`: image personnalisée à partir de `postgres:16`
- `pgadmin`: image `dpage/pgadmin4:9`

## Postgres custom

Le Dockerfile `docker/postgres/Dockerfile` copie:

- Les scripts d’initialisation vers `/docker-entrypoint-initdb.d/`
- Les CSV vers `/seed-data/`

Au premier démarrage, `01-init.sql`:

1. crée le schéma `src`
2. crée les 4 tables
3. importe les données CSV via `COPY`

## Ports exposés (hôte)

- PostgreSQL: `5433`
- pgAdmin: `5050`
