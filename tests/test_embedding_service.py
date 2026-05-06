import sys
import os

# Thêm thư mục root vào sys.path
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from backend.processor.embedding_service import EmbeddingService

def test_semantic_similarity():
    service = EmbeddingService()

    s1 = "Tôi rất thích đọc sách khoa học viễn tưởng."
    s2 = "Niềm đam mê của tôi là những cuốn sách về viễn tưởng khoa học."
    s3 = "Trưa nay tôi định đi ăn bún chả ở gần công ty."

    print(f"1️⃣: {s1}")
    print(f"2️⃣: {s2}")
    print(f"3️⃣: {s3}")

    print("\n🔄 Đang tạo vector...")
    v1 = service.embed_text(s1)
    v2 = service.embed_text(s2)
    v3 = service.embed_text(s3)

    score_12 = service.compute_similarity(v1, v2)
    score_13 = service.compute_similarity(v1, v3)

    print("\n" + "="*50)
    print("KẾT QUẢ SO SÁNH NGỮ NGHĨA:")
    print("="*50)
    print(f"🔹 Độ tương đồng giữa (1) và (2): {score_12:.4f} (Kỳ vọng: Cao)")
    print(f"🔸 Độ tương đồng giữa (1) và (3): {score_13:.4f} (Kỳ vọng: Thấp)")
    print("="*50)

    if score_12 > score_13:
        print("✅ Thành công: Model đã nhận diện đúng sự tương đồng về nghĩa!")
    else:
        print("⚠️ Cảnh báo: Kết quả có vẻ chưa chính xác.")

if __name__ == "__main__":
    test_semantic_similarity()
