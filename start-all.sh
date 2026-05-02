#!/bin/bash

# DocuMind - Khởi chạy toàn bộ dịch vụ

# Hàm để dọn dẹp khi nhấn Ctrl+C
cleanup() {
    echo ""
    echo "🛑 Đang dừng tất cả các dịch vụ DocuMind..."
    kill $API_PID $WORKER_PID 2>/dev/null
    docker compose stop surrealdb
    echo "✅ Đã dừng xong."
    exit
}

# Đăng ký hàm cleanup khi nhận tín hiệu kết thúc
trap cleanup INT TERM

echo "🚀 Đang khởi chạy DocuMind (Cơ sở dữ liệu + API + Worker + Frontend)..."

# 1. Khởi chạy SurrealDB qua Docker
echo "📊 Đang khởi chạy SurrealDB..."
docker compose up -d surrealdb

if [ $? -ne 0 ]; then
    echo "❌ Lỗi: Không thể khởi chạy Docker. Vui lòng kiểm tra Docker Desktop đang chạy."
    exit 1
fi

# Đợi CSDL sẵn sàng
echo "⏳ Đợi cơ sở dữ liệu (3s)..."
sleep 3

# 2. Khởi chạy API Backend
echo "🔧 Đang khởi chạy API backend..."
uv run run_api.py &
API_PID=$!

# Đợi API sẵn sàng
sleep 3

# 3. Khởi chạy Background Worker
echo "⚙️ Đang khởi chạy background worker..."
uv run --env-file .env surreal-commands-worker --import-modules commands &
WORKER_PID=$!

sleep 2

echo "✅ Tất cả các dịch vụ nền đã được khởi chạy!"
echo "------------------------------------------------"
echo "📱 Frontend: http://localhost:3000"
echo "🔗 API: http://localhost:5055"
echo "📚 API Docs: http://localhost:5055/docs"
echo "------------------------------------------------"
echo "💡 Nhấn Ctrl+C để dừng toàn bộ dịch vụ."

# 4. Khởi chạy Frontend (Next.js)
echo "🌐 Đang khởi chạy Next.js frontend..."
cd frontend && npm run dev
