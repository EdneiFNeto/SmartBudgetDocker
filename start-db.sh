#!/bin/bash

# Script to start the PostgreSQL database

echo "🐳 Checking Docker..."
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running!"
    echo "   Please open Docker Desktop and wait a few seconds."
    echo "   Then run this script again."
    exit 1
fi

echo "✅ Docker is working!"
echo ""
echo "📦 Building and starting PostgreSQL database..."
echo ""

# Navigate to project directory
cd "$(dirname "$0")"

# Build and start containers
docker compose up -d

echo ""
echo "⏳ Waiting for database to start..."
sleep 5

# Check if container is running
if docker compose ps | grep -q "Up"; then
    echo ""
    echo "✅ PostgreSQL database is running!"
    echo ""
    echo "📋 Connection information:"
    echo "   Host: localhost"
    echo "   Port: 5432"
    echo "   Database: ${POSTGRES_DB:-database_name}"
    echo "   User: ${POSTGRES_USER:-database_user}"
    echo "   Password: ${POSTGRES_PASSWORD:-database_password}"
    echo ""
    echo "🔍 To check status: docker compose ps"
    echo "📊 To view logs: docker compose logs -f"
    echo "🔌 To connect: docker compose exec postgres psql -U ${POSTGRES_USER:-database_user} -d ${POSTGRES_DB:-database_name}"
else
    echo "⚠️  There was a problem starting the container."
    echo "   Check logs with: docker compose logs"
fi

