#!/bin/bash

# Script para instalar Docker Desktop no macOS
# Este script requer que você insira sua senha de administrador

echo "🐳 Instalando Docker Desktop..."
echo ""
echo "Você precisará inserir sua senha de administrador."
echo ""

# Instalar Docker Desktop via Homebrew
brew install --cask docker

# Após a instalação, iniciar Docker Desktop
echo ""
echo "✅ Instalação concluída!"
echo "🚀 Iniciando Docker Desktop..."
open -a Docker

echo ""
echo "⏳ Aguarde alguns segundos enquanto o Docker Desktop inicia..."
echo "📋 Você pode verificar o status com: docker info"

