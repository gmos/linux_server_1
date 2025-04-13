FROM mariadb:lts-noble

# Copy the database initialization scripts
COPY initdb.sh /docker-entrypoint-initdb.d

USER "${UID}:${GID}"
