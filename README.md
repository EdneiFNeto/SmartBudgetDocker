# SmartBudgetDocker

Este projeto contém a configuração Docker para um banco de dados PostgreSQL.

## 📋 Pré-requisitos

- Docker instalado
- Docker Compose instalado

## 🚀 Como usar

### Opção 1: Usando Docker Compose (Recomendado)

1. **Clone o repositório ou navegue até o diretório do projeto**

2. **Copie o arquivo .env.example para .env (opcional)**
   ```bash
   cp .env.example .env
   ```
   
   Edite o arquivo `.env` para configurar suas credenciais se necessário.

3. **Construa e inicie o container**
   ```bash
   ./iniciar-banco.sh
   ```

4. **Verifique se o container está rodando**
   ```bash
   docker compose ps
   ```

5. **Conecte ao banco de dados**
   ```bash
   docker compose exec postgres psql -U marketplace_user -d marketplace_db
   ```

### Opção 2: Usando Docker diretamente

1. **Construa a imagem**
   ```bash
   docker build -t marketplace-postgres .
   ```

2. **Execute o container**
   ```bash
   docker run -d \
     --name marketplace-postgres \
     -e POSTGRES_USER=marketplace_user \
     -e POSTGRES_PASSWORD=marketplace_password \
     -e POSTGRES_DB=marketplace_db \
     -p 5432:5432 \
     marketplace-postgres
   ```

## 🔌 Conexão ao Banco de Dados

### String de Conexão

```
Host: localhost
Port: 5432
Database: marketplace_db
User: marketplace_user
Password: marketplace_password
```

### Exemplo de conexão (psql)

```bash
psql -h localhost -p 5432 -U marketplace_user -d marketplace_db
```

### Exemplo de conexão (Node.js/JavaScript)

```javascript
const { Client } = require('pg');

const client = new Client({
  host: 'localhost',
  port: 5432,
  database: 'marketplace_db',
  user: 'marketplace_user',
  password: 'marketplace_password',
});

client.connect();
```

## 📁 Estrutura do Projeto

```
SmartBudgetDocker/
├── Dockerfile                 # Configuração da imagem PostgreSQL
├── docker-compose.yml         # Orquestração dos containers
├── .dockerignore             # Arquivos ignorados no build
├── .env.example              # Exemplo de variáveis de ambiente
├── README.md                 # Este arquivo
└── init-scripts/             # Scripts SQL executados na inicialização
    └── 01-init.sql          # Script de criação de tabelas
```

## 🔧 Scripts SQL

Os scripts na pasta `init-scripts/` são executados automaticamente na primeira inicialização do banco de dados. Eles criam:

- Extensões PostgreSQL (uuid-ossp, pgcrypto)
- Schema `marketplace`
- Tabelas básicas (users, products, orders, order_items)
- Índices para otimização
- Triggers para atualização automática de timestamps

## 🛠️ Comandos Úteis

### Ver logs do container
```bash
docker compose logs -f postgres
```

### Parar o container
```bash
docker compose stop
```

### Iniciar o container (se já estiver criado)
```bash
docker compose start
```

### Remover o container e volumes
```bash
docker compose down -v
```

### Executar um comando SQL
```bash
docker compose exec postgres psql -U marketplace_user -d marketplace_db -c "SELECT * FROM marketplace.users;"
```

### Fazer backup do banco
```bash
docker compose exec postgres pg_dump -U marketplace_user marketplace_db > backup.sql
```

### Restaurar backup
```bash
docker compose exec -T postgres psql -U marketplace_user marketplace_db < backup.sql
```

## 🔒 Segurança

⚠️ **IMPORTANTE**: As senhas padrão são apenas para desenvolvimento. Para produção:

1. Use variáveis de ambiente seguras
2. Não commite arquivos `.env` no repositório
3. Use secrets management (Docker Secrets, AWS Secrets Manager, etc.)
4. Configure SSL/TLS para conexões
5. Implemente políticas de firewall adequadas

## 📝 Personalização

Você pode personalizar o banco de dados editando:

- `init-scripts/01-init.sql` - Adicione suas próprias tabelas e estruturas
- `docker-compose.yml` - Ajuste portas, volumes, e configurações
- `.env` - Configure variáveis de ambiente específicas

## 🐛 Troubleshooting

### Porta já em uso
Se a porta 5432 já estiver em uso, altere no `docker-compose.yml`:
```yaml
ports:
  - "5433:5432"  # Use outra porta no host
```

### Erro de permissão
Se houver problemas de permissão, verifique se o diretório de dados tem as permissões corretas:
```bash
sudo chown -R 999:999 postgres_data
```

## 📚 Recursos Adicionais

- [Documentação PostgreSQL](https://www.postgresql.org/docs/)
- [Docker PostgreSQL Image](https://hub.docker.com/_/postgres)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
