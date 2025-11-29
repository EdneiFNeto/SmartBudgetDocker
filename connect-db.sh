#!/bin/bash

# Script to connect to the PostgreSQL database

echo "🔌 Connecting to PostgreSQL database..."
echo ""
echo "📋 Connection information:"
echo "   Database: ${POSTGRES_DB:-database_name}"
echo "   User: ${POSTGRES_USER:-database_user}"
echo ""
echo "💡 Tip: Use '\\q' to exit, '\\dt schema.*' to list tables"
echo "   Use '\\d schema.table_name' to see table structure"
echo ""
echo "─────────────────────────────────────────────────────────"
echo ""

# Connect to database
docker compose exec postgres psql -U ${POSTGRES_USER:-database_user} -d ${POSTGRES_DB:-database_name}

