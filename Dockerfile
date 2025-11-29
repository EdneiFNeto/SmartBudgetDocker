FROM postgres:16-alpine

# Set default environment variables
ENV POSTGRES_USER=marketplace_user
ENV POSTGRES_PASSWORD=marketplace_password
ENV POSTGRES_DB=marketplace_db

# Copy initialization scripts
COPY init-scripts/ /docker-entrypoint-initdb.d/

# Expose default PostgreSQL port
EXPOSE 5432
