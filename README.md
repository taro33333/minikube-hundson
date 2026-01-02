# Kubernetes Container Security Handson Environment

「リスクから学ぶ Kubernetesコンテナセキュリティ」のハンズオン用Docker環境です。

ローカル環境を汚さずにminikubeを使ったKubernetesハンズオンができます。
(本書ではGoogleCloudのComputeEngine内でハンズオンを実施)

## 📋 必要条件

- Docker Desktop または Docker Engine
- Docker Compose v2
- メモリ: 8GB以上推奨
- CPU: 2コア以上推奨

## 🚀 クイックスタート

### 1. 環境の構築と起動

```bash
# このディレクトリで実行
docker compose up -d --build

# コンテナに入る
docker compose exec handson bash
```

### 2. minikubeの起動

コンテナ内で以下を実行：

```bash
# minikubeを起動（初回は少し時間がかかります）
minikube start --driver=docker

# クラスタの確認
kubectl get nodes
```

### 3. ハンズオンの開始

```bash
# 書籍のサンプルコードディレクトリへ移動
cd /home/handson/workspace/book

# 各章のディレクトリを確認
ls -la
```

## 📁 ディレクトリ構成

```
/home/handson/
├── workspace/
│   ├── book/          # 書籍のサンプルコード（自動クローン済み）
│   └── my-work/       # 自分の作業用（永続化されます）
├── .minikube/         # minikubeデータ（永続化されます）
└── .kube/             # kubectl設定（永続化されます）
```

## 🛠️ 便利なコマンド

```bash
# エイリアス
k = kubectl

# minikube操作
minikube status          # ステータス確認
minikube stop            # 停止
minikube delete          # 削除（クリーンスタート）
minikube dashboard       # ダッシュボード起動

# kubectl基本操作
kubectl get pods -A      # 全namespaceのPod一覧
kubectl get nodes        # ノード一覧
kubectl get all          # リソース一覧
```

## 🔄 環境の操作

```bash
# コンテナを停止（minikubeは維持）
docker compose stop

# コンテナを再開
docker compose start
docker compose exec handson bash

# 完全に削除（データも消える）
docker compose down -v
```

## ⚠️ 注意事項

### macOS (Apple Silicon) の場合

M1/M2 Macの場合は、minikube起動時にアーキテクチャを指定：

```bash
minikube start --driver=docker --kubernetes-version=v1.28.0
```

### Windows (WSL2) の場合

Docker Desktopの設定で「Use the WSL 2 based engine」が有効になっていることを確認してください。

### リソース不足の場合

minikube起動時にリソースを調整できます：

```bash
minikube start --driver=docker --cpus=2 --memory=4096
```

## 🧹 クリーンアップ

```bash
# 環境を完全に削除
docker compose down -v

# Dockerイメージも削除
docker rmi k8s-security-handson:latest
```

## 📖 参考リンク

- [書籍公式リポジトリ](https://github.com/mochizuki875/kubernetes-container-security-book)
- [minikube公式ドキュメント](https://minikube.sigs.k8s.io/docs/)
- [Kubernetes公式ドキュメント](https://kubernetes.io/docs/)
