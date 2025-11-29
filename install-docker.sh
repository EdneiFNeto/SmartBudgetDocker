#!/bin/bash

# Script to install Docker Desktop on macOS
# This script requires you to enter your administrator password

echo "🐳 Installing Docker Desktop..."
echo ""
echo "You will need to enter your administrator password."
echo ""

# Install Docker Desktop via Homebrew
brew install --cask docker

# After installation, start Docker Desktop
echo ""
echo "✅ Installation completed!"
echo "🚀 Starting Docker Desktop..."
open -a Docker

echo ""
echo "⏳ Wait a few seconds while Docker Desktop starts..."
echo "📋 You can check status with: docker info"
