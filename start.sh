#!/bin/bash

# K8s Security Handson - Quick Start Script

set -e

echo "🐳 Starting Kubernetes Container Security Handson Environment..."
echo ""

# Dockerが動いているか確認
if ! docker info > /dev/null 2>&1; then
    echo "❌ Error: Docker is not running or accessible."
    echo "   Please start Docker Desktop or Docker Engine first."
    exit 1
fi

# ビルドと起動
echo "📦 Building and starting the container..."
docker compose up -d --build

echo ""
echo "✅ Environment is ready!"
echo ""
echo "📌 Next steps:"
echo "   1. Enter the container:"
echo "      docker compose exec handson bash"
echo ""
echo "   2. Inside the container, start minikube:"
echo "      minikube start --driver=docker"
echo ""
echo "   3. Start your handson!"
echo "      cd /home/handson/workspace/book"
echo ""
