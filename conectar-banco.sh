#!/bin/bash

# Script para conectar ao banco de dados PostgreSQL do Marketplace

echo "🔌 Conectando ao banco de dados PostgreSQL..."
echo ""
echo "📋 Informações de conexão:"
echo "   Database: marketplace_db"
echo "   User: marketplace_user"
echo ""
echo "💡 Dica: Use '\\q' para sair, '\\dt marketplace.*' para listar tabelas"
echo "   Use '\\d marketplace.nome_tabela' para ver a estrutura de uma tabela"
echo ""
echo "─────────────────────────────────────────────────────────"
echo ""

# Conectar ao banco de dados
docker compose exec postgres psql -U marketplace_user -d marketplace_db

