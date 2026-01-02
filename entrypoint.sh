#!/bin/bash

echo "======================================"
echo " Kubernetes Container Security Handson"
echo "======================================"
echo ""

# Docker ソケットの確認
if [ -S /var/run/docker.sock ]; then
    echo "✅ Docker socket detected"
    
    # Docker グループが存在するか確認
    if getent group docker > /dev/null 2>&1; then
        # ユーザーをdockerグループに追加（すでに追加されていても問題ない）
        sudo usermod -aG docker handson 2>/dev/null || true
    fi
else
    echo "⚠️  Docker socket not found at /var/run/docker.sock"
    echo "   Please run with: -v /var/run/docker.sock:/var/run/docker.sock"
fi

echo ""
echo "📚 Book repository: /home/handson/workspace/book"
echo ""
echo "🚀 Quick Start:"
echo "   1. Start minikube:"
echo "      minikube start --driver=docker"
echo ""
echo "   2. Verify cluster:"
echo "      kubectl get nodes"
echo ""
echo "   3. Go to book samples:"
echo "      cd /home/handson/workspace/book"
echo ""
echo "======================================"
echo ""

# コマンド実行
exec "$@"
