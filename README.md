# SmartBudgetDocker

This project contains Docker configuration for a PostgreSQL database.

## 🤖 About the Project

This project was created **100% using Artificial Intelligence (AI)**, without using no-code tools. All code, configurations, and documentation were generated through AI assistance, demonstrating the capabilities of AI-assisted programming.

## 📋 Prerequisites

- Docker installed
- Docker Compose installed

## 🚀 How to Use

### Option 1: Using Docker Compose (Recommended)

1. **Clone the repository or navigate to the project directory**

2. **Configure environment variables (optional)**
   
   Create a `.env` file in the project root or configure variables directly in `docker-compose.yml`:
   ```
   POSTGRES_USER=your_user
   POSTGRES_PASSWORD=your_secure_password
   POSTGRES_DB=database_name
   ```

3. **Build and start the container**
   ```bash
   ./start-db.sh
   ```

4. **Verify the container is running**
   ```bash
   docker compose ps
   ```

5. **Connect to the database**
   ```bash
   docker compose exec postgres psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}
   ```

### Option 2: Using Docker directly

1. **Build the image**
   ```bash
   docker build -t postgres-app .
   ```

2. **Run the container**
   ```bash
   docker run -d \
     --name postgres-container \
     -e POSTGRES_USER=${POSTGRES_USER} \
     -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
     -e POSTGRES_DB=${POSTGRES_DB} \
     -p 5432:5432 \
     postgres-app
   ```
   
   ⚠️ **Note**: Configure the environment variables `${POSTGRES_USER}`, `${POSTGRES_PASSWORD}` and `${POSTGRES_DB}` before running, or define them directly in the command.

## 🔌 Database Connection

### Connection String

Configure credentials in the `.env` file or environment variables:

```
Host: localhost
Port: 5432
Database: ${POSTGRES_DB}
User: ${POSTGRES_USER}
Password: ${POSTGRES_PASSWORD}
```

### Connection example (psql)

```bash
psql -h localhost -p 5432 -U ${POSTGRES_USER} -d ${POSTGRES_DB}
```

### Connection example (Node.js/JavaScript)

```javascript
const { Client } = require('pg');

const client = new Client({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
});

client.connect();
```

## 📁 Project Structure

```
SmartBudgetDocker/
├── Dockerfile                 # PostgreSQL image configuration
├── docker-compose.yml         # Container orchestration
├── .dockerignore             # Files ignored in build
├── .env                      # Environment variables (not versioned)
├── README.md                 # This file
└── init-scripts/             # SQL scripts executed on initialization
    └── 01-init.sql          # Table creation script
```

## 🔧 SQL Scripts

The scripts in the `init-scripts/` folder are executed automatically on the first database initialization. They can create:

- PostgreSQL extensions (uuid-ossp, pgcrypto, etc.)
- Custom schemas
- Tables as needed
- Indexes for optimization
- Custom triggers and functions

## 🛠️ Useful Commands

### View container logs
```bash
docker compose logs -f postgres
```

### Stop the container
```bash
docker compose stop
```

### Start the container (if already created)
```bash
docker compose start
```

### Remove container and volumes
```bash
docker compose down -v
```

### Execute a SQL command
```bash
docker compose exec postgres psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -c "SELECT * FROM your_table;"
```

### Backup the database
```bash
docker compose exec postgres pg_dump -U ${POSTGRES_USER} ${POSTGRES_DB} > backup.sql
```

### Restore backup
```bash
docker compose exec -T postgres psql -U ${POSTGRES_USER} ${POSTGRES_DB} < backup.sql
```

## 🔒 Security

⚠️ **IMPORTANT**: Default passwords are for development only. For production:

1. Use secure environment variables
2. Do not commit `.env` files to the repository
3. Use secrets management (Docker Secrets, AWS Secrets Manager, etc.)
4. Configure SSL/TLS for connections
5. Implement adequate firewall policies

## 📝 Customization

You can customize the database by editing:

- `init-scripts/01-init.sql` - Add your own tables and structures
- `docker-compose.yml` - Adjust ports, volumes, and configurations
- `.env` - Configure environment variables (user, password, database name, etc.)

⚠️ **Important**: Never commit the `.env` file to the repository. Use `.env.example` as a template and keep `.env` in `.gitignore`.

## 🐛 Troubleshooting

### Port already in use
If port 5432 is already in use, change it in `docker-compose.yml`:
```yaml
ports:
  - "5433:5432"  # Use another port on the host
```

### Permission error
If you have permission issues, verify that the data directory has the correct permissions:
```bash
sudo chown -R 999:999 postgres_data
```

## 📚 Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Docker PostgreSQL Image](https://hub.docker.com/_/postgres)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
