#!/bin/bash

# Script para iniciar o banco de dados PostgreSQL do Marketplace

echo "🐳 Verificando Docker..."
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker não está rodando!"
    echo "   Por favor, abra o Docker Desktop e aguarde alguns segundos."
    echo "   Depois execute este script novamente."
    exit 1
fi

echo "✅ Docker está funcionando!"
echo ""
echo "📦 Construindo e iniciando o banco de dados PostgreSQL..."
echo ""

# Navegar para o diretório do projeto
cd "$(dirname "$0")"

# Construir e iniciar os containers
docker compose up -d

echo ""
echo "⏳ Aguardando o banco de dados iniciar..."
sleep 5

# Verificar se o container está rodando
if docker compose ps | grep -q "Up"; then
    echo ""
    echo "✅ Banco de dados PostgreSQL está rodando!"
    echo ""
    echo "📋 Informações de conexão:"
    echo "   Host: localhost"
    echo "   Port: 5432"
    echo "   Database: marketplace_db"
    echo "   User: marketplace_user"
    echo "   Password: marketplace_password"
    echo ""
    echo "🔍 Para verificar o status: docker compose ps"
    echo "📊 Para ver os logs: docker compose logs -f"
    echo "🔌 Para conectar: docker compose exec postgres psql -U marketplace_user -d marketplace_db"
else
    echo "⚠️  Houve um problema ao iniciar o container."
    echo "   Verifique os logs com: docker compose logs"
fi

