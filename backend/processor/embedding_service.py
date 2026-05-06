from sentence_transformers import SentenceTransformer
from typing import List, Union
import numpy as np
import logging

# Cấu hình logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class EmbeddingService:
    _instance = None
    _model = None

    def __new__(cls, model_name: str = "keepitreal/vietnamese-sbert"):
        """
        Sử dụng Singleton pattern để đảm bảo model chỉ load 1 lần vào RAM.
        """
        if cls._instance is None:
            cls._instance = super(EmbeddingService, cls).__new__(cls)
            try:
                logger.info(f"🚀 Đang nạp model Embedding: {model_name}...")
                cls._model = SentenceTransformer(model_name)
                logger.info("✅ Nạp model thành công!")
            except Exception as e:
                logger.error(f"❌ Lỗi khi nạp model Embedding: {str(e)}")
                raise e
        return cls._instance

    def embed_text(self, text: str) -> List[float]:
        """
        Biến 1 đoạn văn bản thành vector (list of floats).
        """
        if not text:
            return []
        
        embedding = self._model.encode(text)
        return embedding.tolist()

    def embed_chunks(self, chunks: List[str]) -> List[List[float]]:
        """
        Biến danh sách các mảnh văn bản thành danh sách các vector.
        """
        if not chunks:
            return []
        
        logger.info(f"🔢 Đang tạo embedding cho {len(chunks)} mảnh văn bản...")
        embeddings = self._model.encode(chunks)
        logger.info("✅ Tạo embedding hoàn tất!")
        return embeddings.tolist()

    def compute_similarity(self, vec1: List[float], vec2: List[float]) -> float:
        """
        Tính độ tương đồng Cosine giữa 2 vector.
        Dùng để kiểm tra xem 2 đoạn văn bản có nghĩa giống nhau không.
        """
        v1 = np.array(vec1)
        v2 = np.array(vec2)
        return np.dot(v1, v2) / (np.linalg.norm(v1) * np.linalg.norm(v2))

# Demo nhanh
if __name__ == "__main__":
    service = EmbeddingService()
    text = "Chào mừng bạn đến với dự án DocuMind"
    vector = service.embed_text(text)
    print(f"Độ dài vector: {len(vector)}")
    print(f"5 giá trị đầu tiên: {vector[:5]}")
