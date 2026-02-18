FROM postgres:16

COPY docker/postgres/init/ /docker-entrypoint-initdb.d/
COPY data/ /seed-data/
