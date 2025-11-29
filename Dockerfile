FROM postgres:16-alpine

# Definir variáveis de ambiente padrão
ENV POSTGRES_USER=marketplace_user
ENV POSTGRES_PASSWORD=marketplace_password
ENV POSTGRES_DB=marketplace_db

# Copiar scripts de inicialização
COPY init-scripts/ /docker-entrypoint-initdb.d/

# Expor a porta padrão do PostgreSQL
EXPOSE 5432

