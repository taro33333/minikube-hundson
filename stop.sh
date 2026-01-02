#!/bin/bash

# K8s Security Handson - Stop Script

echo "🛑 Stopping Kubernetes Container Security Handson Environment..."
echo ""

# コンテナ内のminikubeを停止
echo "⏹️  Stopping minikube (if running)..."
docker compose exec -T handson minikube stop 2>/dev/null || true

# コンテナを停止
echo "⏹️  Stopping container..."
docker compose stop

echo ""
echo "✅ Environment stopped."
echo ""
echo "📌 To restart: ./start.sh or docker compose start"
echo "📌 To remove completely: docker compose down -v"
