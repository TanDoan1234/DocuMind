#!/bin/bash

# DocuMind - Dừng toàn bộ dịch vụ

echo "🛑 Đang dừng toàn bộ dịch vụ DocuMind..."

# 1. Tắt các tiến trình Node.js (Frontend)
echo "🌐 Đang tắt Frontend..."
pkill -f "next dev" || true

# 2. Tắt Background Worker
echo "⚙️ Đang tắt Background Worker..."
pkill -f "surreal-commands-worker" || true

# 3. Tắt API Backend
echo "🔧 Đang tắt API..."
pkill -f "run_api.py" || true
pkill -f "uvicorn api.main:app" || true

# 4. Dừng container Docker (Cơ sở dữ liệu)
echo "📊 Đang dừng cơ sở dữ liệu Docker..."
docker compose stop

echo "------------------------------------------------"
echo "✅ Tất cả các dịch vụ đã được dừng an toàn!"
