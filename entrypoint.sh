#!/bin/bash

# ボリュームの権限を修正
sudo chown -R handson:handson /home/handson/.minikube 2>/dev/null || true
sudo chown -R handson:handson /home/handson/.kube 2>/dev/null || true
sudo chown -R handson:handson /home/handson/workspace/my-work 2>/dev/null || true

echo "======================================"
echo " Kubernetes Container Security Handson"
echo "======================================"
echo ""

# Dockerソケットの権限を修正
if [ -S /var/run/docker.sock ]; then
    echo "✅ Docker socket detected"
    sudo chmod 666 /var/run/docker.sock 2>/dev/null || true
else
    echo "⚠️  Docker socket not found"
    echo "   Run with: -v /var/run/docker.sock:/var/run/docker.sock"
fi

echo ""
echo "📚 Book repository: /home/handson/workspace/book"
echo ""
echo "🚀 Quick Start:"
echo "   minikube start --driver=docker --cpus=4 --memory=4g --kubernetes-version=v1.30.0"
echo ""
echo "======================================"
echo ""

exec "$@"
