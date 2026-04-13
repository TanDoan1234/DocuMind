# HỆ THỐNG TÓM TẮT VÀ HỎI ĐÁP NỘI DUNG BÀI BÁO TIẾNG VIỆT SỬ DỤNG MÔ HÌNH TRANSFORMER

## (VietSumBot)

**Đồ án môn học: Deep Learning**

Kết hợp ViT5 (Summarization) + PhoBERT Multi-task (QA + NER/CRF)

---

## 1. TỔNG QUAN ĐỀ TÀI

### 1.1 Tên đề tài

**Hệ thống tóm tắt và hỏi đáp nội dung bài báo tiếng Việt sử dụng mô hình Transformer kết hợp nhận diện thực thể có tên (VietSumBot)**

### 1.2 Mô tả bài toán

Xây dựng một hệ thống web cho phép người dùng nhập/paste bài báo tiếng Việt, sau đó thực hiện 3 chức năng chính:

1. **Tóm tắt tự động (Abstractive Summarization):** Sinh bản tóm tắt mới bằng câu từ mới, có thể tùy chỉnh độ dài (ngắn/trung bình/dài)
2. **Hỏi đáp nội dung (Extractive Question Answering):** Người dùng đặt câu hỏi, hệ thống trích xuất đoạn text chứa câu trả lời từ bài gốc, kèm confidence score
3. **Nhận diện thực thể có tên (Named Entity Recognition):** Tự động nhận diện và highlight người, địa điểm, tổ chức trong bài, dùng CRF + BIEOS đảm bảo chuỗi nhãn hợp lệ

### 1.3 Tính mới so với các nghiên cứu trước

- Kết hợp 3 task NLP (Summarization + QA + NER) trong cùng 1 pipeline, bổ trợ lẫn nhau
- QA-guided Summarization: Dùng QA để kiểm tra tính chính xác (factuality) của bản tóm tắt
- Controllable Summarization: Người dùng tùy chỉnh độ dài tóm tắt qua prefix tokens
- Multi-task PhoBERT: 1 encoder chia sẻ, 2 heads (QA + NER/CRF) tiết kiệm tài nguyên
- Chuyên biệt cho tiếng Việt (low-resource language) với dataset chuẩn
- Triển khai web app thực tế, có giao diện thân thiện

### 1.4 Ứng dụng thực tế

- Giúp người đọc nhanh chóng nắm bài báo dài mà không cần đọc toàn bộ
- Tìm kiếm thông tin cụ thể trong bài qua chatbot hỏi đáp
- Hỗ trợ nhà báo, sinh viên, nhà nghiên cứu xử lý lượng lớn văn bản
- Tiền đề cho hệ thống giám sát truyền thông, phân tích tin tức

---

## 2. MÔ HÌNH SỬ DỤNG

### 2.1 Tổng quan kiến trúc

Hệ thống sử dụng 2 mô hình Transformer chính, mỗi mô hình có kiến trúc khác nhau phục vụ các nhiệm vụ khác nhau:

| Thành phần | Mô hình | Kiến trúc | Nhiệm vụ |
|------------|---------|-----------|----------|
| Model 1 | ViT5-base | Encoder-Decoder (T5) | Abstractive Summarization |
| Model 2a | PhoBERT-base | Encoder-only (RoBERTa) + QA Head | Extractive Question Answering |
| Model 2b | PhoBERT-base + CRF | Encoder-only + CRF Layer | Named Entity Recognition (BIEOS) |

### 2.2 Model 1: ViT5 cho Summarization

ViT5 là mô hình Transformer encoder-decoder pretrained trên 138GB text tiếng Việt (CC100), theo kiến trúc T5 của Google. ViT5 đạt SOTA trên Vietnamese Abstractive Text Summarization.

**Lý do chọn ViT5:**

- Kiến trúc Encoder-Decoder phù hợp cho text generation (sinh tóm tắt)
- Pretrained trên corpus tiếng Việt lớn nhất hiện có
- Có sẵn checkpoint trên HuggingFace, dễ fine-tune
- Hỗ trợ input dài lên đến 1024 tokens

**Tùy chỉnh Controllable Length:**

Thêm prefix token vào đầu input để điều khiển độ dài tóm tắt:

- `[SHORT] vietnews: <bài gốc>` → Tóm tắt 1 câu
- `[MEDIUM] vietnews: <bài gốc>` → Tóm tắt 2-3 câu
- `[LONG] vietnews: <bài gốc>` → Tóm tắt 4+ câu

**Pretrained model:**

- HuggingFace: https://huggingface.co/VietAI/vit5-base
- GitHub: https://github.com/vietai/ViT5

### 2.3 Model 2: PhoBERT Multi-task (QA + NER)

PhoBERT là mô hình RoBERTa pretrained cho tiếng Việt bởi VinAI Research. Trong đề tài này, PhoBERT được dùng theo kiến trúc Multi-task Learning với 1 encoder chia sẻ và 2 task heads:

**Head 1 — Question Answering:**

- Linear layer (768 → 2) cho start/end logits
- Predict vị trí bắt đầu và kết thúc của câu trả lời trong context
- Hỗ trợ câu hỏi unanswerable (trả lời: "Không tìm thấy")

**Head 2 — NER + CRF:**

- Linear layer (768 → 17 tags) + CRF layer
- Bộ nhãn BIEOS: B(Begin), I(Inside), E(End), O(Outside), S(Single)
- 4 loại entity: PER (người), LOC (địa điểm), ORG (tổ chức), MISC (khác)
- CRF đảm bảo chuỗi nhãn hợp lệ (VD: sau B-PER chỉ được I-PER hoặc E-PER)

**Pretrained model:**

- HuggingFace: https://huggingface.co/vinai/phobert-base

### 2.4 Lý do kết hợp 2 mô hình

| Tiêu chí | ViT5 (Enc-Dec) | PhoBERT (Enc-only) |
|----------|----------------|-------------------|
| Sinh text mới | Mạnh (có Decoder) | Không thể |
| Hiểu text / trích xuất | Trung bình | Rất mạnh |
| Xác định vị trí chính xác | Yếu | Rất mạnh |
| Tóm tắt abstractive | Tốt nhất | Không làm được |
| QA extractive | Làm được nhưng kém | Tốt nhất |
| NER sequence labeling | Không phù hợp | Rất phù hợp + CRF |

**Kết luận: Mỗi model mạnh ở 1 việc. Kết hợp lại phát huy tối đa thế mạnh của cả hai, thay vì ép 1 model làm tất cả.**

---

## 3. BỘ DỮ LIỆU

### 3.1 Dataset cho Summarization

| Dataset | Số lượng | Mô tả | Nguồn |
|---------|---------|-------|-------|
| **Vietnews (VNDS) ★** | ~150,000 bài | Dataset benchmark lớn nhất cho tóm tắt tiếng Việt, crawl từ báo Việt | https://github.com/ThanhChinhBK/vietnews |
| VietGPT News | N/A | Format sẵn content-summary trên HuggingFace | https://huggingface.co/datasets/vietgpt/news_summarization_vi |
| WikiLingua (VI) | N/A | Dataset đa ngôn ngữ từ WikiHow | https://huggingface.co/datasets/wiki_lingua |

> ★ **Khuyến nghị chính:** Dùng Vietnews (VNDS) vì lớn nhất, được dùng nhiều nhất trong nghiên cứu.

### 3.2 Dataset cho Question Answering

| Dataset | Số lượng | Mô tả | Nguồn |
|---------|---------|-------|-------|
| **UIT-ViQuAD 2.0 ★** | 35,000 câu hỏi | Mở rộng từ v1.0, gồm 12K câu unanswerable, format SQuAD | https://huggingface.co/datasets/taidng/UIT-ViQuAD2.0 |
| UIT-ViQuAD 1.0 | 23,000 cặp QA | 5,109 đoạn văn từ 174 bài Wikipedia tiếng Việt | https://nlp.uit.edu.vn/datasets |
| UIT-ViNewsQA | 22,077 cặp QA | QA trên 4,419 bài báo y tế tiếng Việt | https://nlp.uit.edu.vn/datasets |

> ★ **Khuyến nghị chính:** Dùng UIT-ViQuAD 2.0 (dễ download từ HuggingFace, có câu unanswerable).

### 3.3 Dataset cho NER

| Dataset | Số lượng | Loại entity | Nguồn |
|---------|---------|-------------|-------|
| **PhoNER_COVID19 ★** | 10K câu, 35K entity | Disease, Drug, Symptom, Organization, Location, Time | https://huggingface.co/datasets/vinai/PhoNER_COVID19 |
| VLSP 2016 NER | 16K câu | PER, LOC, ORG | https://vlsp.org.vn |
| VLSP 2018 NER | 20K câu | PER, LOC, ORG, MISC | https://vlsp.org.vn |

### 3.4 Tiền xử lý dữ liệu

1. Loại bài không có sapo/abstract rỗng
2. Loại bài body < 5 câu hoặc > 50 câu
3. Loại bài sapo < 10 từ hoặc > 100 từ
4. Loại bài trùng lặp (deduplicate)
5. Chuẩn hóa Unicode (NFKC), xóa URL, HTML tags
6. Chia train/val/test theo tỉ lệ 80/10/10
7. Đảm bảo không data leak giữa train và test

---

## 4. QUY TRÌNH FINE-TUNE

### 4.1 Fine-tune ViT5 cho Summarization

```python
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
model_name = "VietAI/vit5-base"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForSeq2SeqLM.from_pretrained(model_name)
```

| Tham số | Giá trị | Lý do |
|---------|---------|-------|
| max_input_length | 512-1024 tokens | 512 cho Colab free, 1024 nếu GPU tốt |
| max_target_length | 128-256 tokens | Sapo thường 1-3 câu |
| learning_rate | 3e-4 (warmup + decay) | LR cao ban đầu, giảm dần |
| batch_size | 4-8 | Tùy VRAM (T4: batch 4) |
| num_epochs | 5-10 | Dừng sớm nếu val loss không giảm |
| warmup_steps | 500 | Tránh model diverge lúc đầu |
| weight_decay | 0.01 | Regularization tránh overfit |
| label_smoothing | 0.1 | Giảm overfit, sinh text đa dạng hơn |
| fp16 | True | Tiết kiệm VRAM, tăng tốc 2x |
| gradient_accumulation | 4-8 | Giả lập batch lớn hơn |
| beam_search (inference) | num_beams = 4 | Sinh tóm tắt chất lượng hơn greedy |
| no_repeat_ngram_size | 3 | Tránh lặp cụm từ trong tóm tắt |

**Kỹ thuật tăng chất lượng:**

- Early Stopping (patience=3): Dừng nếu ROUGE trên val không tăng sau 3 lần eval
- Label Smoothing (0.1): Model không quá tự tin vào 1 token → sinh text đa dạng hơn
- Gradient Clipping (max_norm=1.0): Tránh gradient exploding

### 4.2 Fine-tune PhoBERT cho QA

```python
from transformers import AutoModelForQuestionAnswering
model = AutoModelForQuestionAnswering.from_pretrained("vinai/phobert-base")
```

| Tham số | Giá trị | Lý do |
|---------|---------|-------|
| max_length | 384 tokens | Chuẩn SQuAD, đủ cho hầu hết context |
| doc_stride | 128 tokens | Overlap giữa các windows khi context dài |
| learning_rate | 2e-5 - 3e-5 | LR nhỏ hơn ViT5 vì PhoBERT nhạy hơn |
| batch_size | 16 | PhoBERT nhẹ hơn, batch lớn hơn được |
| num_epochs | 3-5 | QA thường converge nhanh |
| warmup_ratio | 0.1 | 10% đầu warmup |
| max_answer_length | 50 tokens | Giới hạn độ dài câu trả lời |

**Xử lý câu hỏi Unanswerable (ViQuAD 2.0):**

Khi `null_score - best_span_score > threshold` → trả lời "Không tìm thấy câu trả lời trong bài viết."

### 4.3 Fine-tune PhoBERT + CRF cho NER

**Kiến trúc:** PhoBERT encoder → Dropout (0.1) → Linear (768 → 17 tags) → CRF Layer

```python
import torch.nn as nn
from transformers import AutoModel
from torchcrf import CRF

class PhoBERT_CRF_NER(nn.Module):
    def __init__(self, num_tags=17):
        super().__init__()
        self.phobert = AutoModel.from_pretrained("vinai/phobert-base")
        self.dropout = nn.Dropout(0.1)
        self.linear = nn.Linear(768, num_tags)
        self.crf = CRF(num_tags, batch_first=True)
```

**Bộ nhãn BIEOS (17 tags):**

```
O
B-PER, I-PER, E-PER, S-PER    (Người)
B-LOC, I-LOC, E-LOC, S-LOC    (Địa điểm)
B-ORG, I-ORG, E-ORG, S-ORG    (Tổ chức)
B-MISC, I-MISC, E-MISC, S-MISC (Khác)
```

**CRF transition rules:**

- Sau B-PER chỉ được I-PER hoặc E-PER (KHÔNG được B-LOC, I-ORG...)
- Sau E-PER hoặc S-PER chỉ được O, B-*, S-*
- CRF cải thiện F1 thêm 2-3% so với softmax độc lập

### 4.4 Multi-task Learning

Thay vì train 2 PhoBERT riêng biệt, sử dụng Multi-task Learning:

```python
class PhoBERT_MultiTask(nn.Module):
    def __init__(self, num_ner_tags=17):
        super().__init__()
        self.phobert = AutoModel.from_pretrained("vinai/phobert-base")  # Shared encoder
        self.qa_head = nn.Linear(768, 2)          # Head 1: QA (start/end)
        self.ner_head = nn.Linear(768, num_ner_tags)  # Head 2: NER
        self.crf = CRF(num_ner_tags, batch_first=True)
```

**Lợi ích:**

- Tiết kiệm VRAM (1 PhoBERT thay vì 2)
- NER và QA bổ trợ nhau — hiểu entity tốt hơn giúp trả lời chính xác hơn
- Train luân phiên giữa 2 task

---

## 5. CÁCH KẾT HỢP 2 MÔ HÌNH

### 5.1 QA-guided Summarization (QA hỗ trợ tóm tắt)

```
Bài gốc ──► PhoBERT (QA)
             │ Tự sinh câu hỏi: Ai? Cái gì? Khi nào? Ở đâu?
             │ Trả lời → xác định thông tin quan trọng nhất
             ▼
         ViT5 (Summarization)
             │ Input = bài gốc + thông tin quan trọng từ QA
             ▼
         Bản tóm tắt chất lượng cao (ít bịa, đúng trọng tâm)
```

**Kết quả:** Tóm tắt chính xác hơn (factually consistent), giảm hallucination.

### 5.2 Summarization hỗ trợ QA

Khi bài gốc quá dài (> 1024 tokens), ViT5 tóm tắt trước để rút gọn → PhoBERT QA hoạt động trên cả bài gốc và bản tóm tắt → so sánh kết quả để tăng confidence.

### 5.3 NER bổ trợ cả 2 task

- **Tóm tắt:** Ưu tiên giữ lại câu chứa entity quan trọng (PER, ORG)
- **QA:** Validate câu trả lời bằng entity type (hỏi "Ai?" → answer phải chứa PER)
- **UI:** Highlight entity trên giao diện web theo màu (PER=xanh, LOC=đỏ, ORG=cam)

### 5.4 QA-based Factuality Check

```
Bản tóm tắt (ViT5)
    │
    ▼
Tự sinh câu hỏi từ tóm tắt
    │
    ▼
PhoBERT (QA) trả lời dựa trên BÀI GỐC
    │
    ▼
So sánh câu trả lời vs nội dung tóm tắt
    │
    ├── Khớp → ✅ Tóm tắt chính xác
    └── Không khớp → ⚠️ Cảnh báo hallucination
```

### 5.5 Sơ đồ kiến trúc tổng thể

```
┌──────────────────────────────────────────────────────┐
│                  HỆ THỐNG VIETSUMBOT                  │
│                                                       │
│  Bài gốc                                             │
│    │                                                  │
│    ├──► ViT5 (Enc-Dec) ──► Bản tóm tắt              │
│    │    + Controllable length                         │
│    │    + QA-guided (ít bịa hơn)                     │
│    │                                                  │
│    └──► PhoBERT Multi-task (Enc-only)                │
│         ├── QA Head ──► Câu trả lời + confidence     │
│         └── NER/CRF Head ──► Entity highlight        │
│                                                       │
│    Factuality Check: PhoBERT QA kiểm tra ViT5        │
│    NER bổ trợ: highlight + validate cả 2 task        │
└──────────────────────────────────────────────────────┘
```

---

## 6. ĐÁNH GIÁ VÀ ĐẢM BẢO CHẤT LƯỢNG

### 6.1 Metrics đánh giá

| Task | Metric | Ý nghĩa | Ngưỡng tốt |
|------|--------|---------|------------|
| Summarization | ROUGE-1 | Overlap unigram | > 55% |
| Summarization | ROUGE-2 | Overlap bigram (đo sự mạch lạc) | > 25% |
| Summarization | ROUGE-L | Longest common subsequence | > 35% |
| Summarization | BERTScore | Semantic similarity dùng embedding | > 0.75 |
| Summarization | Factuality Score | Cosine similarity summary vs source | > 0.70 |
| QA | Exact Match (EM) | Câu trả lời khớp 100% | > 65% |
| QA | F1-score (token) | Overlap từ (cho phép khớp 1 phần) | > 78% |
| NER | F1-score (entity) | Precision/Recall trên entity level | > 90% |

### 6.2 Bảng thí nghiệm so sánh (dự kiến)

**Bảng A: So sánh Summarization**

| Model | ROUGE-1 | ROUGE-2 | ROUGE-L | Factuality |
|-------|---------|---------|---------|------------|
| Lead-3 (baseline) | ~42% | ~14% | ~26% | - |
| TextRank (baseline) | ~45% | ~16% | ~28% | - |
| ViT5 zero-shot | ~48% | ~18% | ~30% | 0.65 |
| ViT5 fine-tune | ~58% | ~25% | ~38% | 0.72 |
| **ViT5 + QA-guided (ours)** | **~61%** | **~28%** | **~41%** | **0.81** |

**Bảng B: So sánh Question Answering**

| Model | EM | F1 |
|-------|----|----|
| mBERT (baseline) | ~58% | ~70% |
| XLM-R (baseline) | ~62% | ~75% |
| PhoBERT fine-tune | ~68% | ~80% |
| **PhoBERT + chunk retrieval (ours)** | **~71%** | **~83%** |

**Bảng C: Ablation Study (chứng minh từng thành phần đều cần thiết)**

| Cấu hình | ROUGE-2 (Sum) | F1 (QA) | Factuality |
|-----------|--------------|---------|------------|
| Chỉ ViT5 | 25% | - | 0.72 |
| Chỉ PhoBERT | - | 80% | - |
| ViT5 + PhoBERT (song song) | 25% | 80% | 0.72 |
| ViT5 + PhoBERT (QA-guided) | 28% | 80% | 0.81 |
| **Full system + NER (ours)** | **28%** | **83%** | **0.81** |

### 6.3 Pipeline đảm bảo chất lượng

**Dữ liệu:**
- ✅ Lọc bài rác (quá ngắn/dài/trùng)
- ✅ Chuẩn hóa Unicode NFKC
- ✅ Chia train/val/test đúng tỉ lệ, không data leak

**Training:**
- ✅ Early stopping (patience=3)
- ✅ Label smoothing (0.1)
- ✅ Learning rate scheduler (warmup + decay)
- ✅ Gradient clipping (max_norm=1.0)
- ✅ Monitor val loss mỗi 1000 steps

**Inference:**
- ✅ Beam search (num_beams=4) cho summarization
- ✅ No repeat ngram (no_repeat_ngram_size=3)
- ✅ Length penalty (1.0-2.0) tránh output quá ngắn
- ✅ Confidence threshold cho QA

**Đánh giá:**
- ✅ ROUGE-1/2/L cho summarization
- ✅ EM + F1 cho QA
- ✅ BERTScore cho semantic similarity
- ✅ QA-based factuality check
- ✅ Human evaluation (50-100 mẫu)

---

## 7. STACK CÔNG NGHỆ

| Thành phần | Công nghệ | Ghi chú |
|------------|-----------|---------|
| Model Summarization | ViT5-base (PyTorch, HuggingFace Transformers) | `VietAI/vit5-base` |
| Model QA + NER | PhoBERT-base + CRF (PyTorch, torchcrf) | `vinai/phobert-base` |
| Tokenizer / Tách từ | SentencePiece (ViT5) + VnCoreNLP/underthesea | Tiền xử lý tiếng Việt |
| Backend API | FastAPI (Python) | Serve 2 model qua REST API |
| Frontend | React.js hoặc Streamlit | Giao diện 2 tab: Tóm tắt + QA |
| Training | Google Colab Pro / Kaggle GPU (T4/P100) | Free tier đủ dùng |
| Đánh giá | rouge-score, sklearn, BERTScore | Metrics tự động |
| Deploy | Docker + Render / HuggingFace Spaces | Cloud deployment |

### 7.1 Yêu cầu phần cứng

| Tài nguyên | Fine-tune ViT5 | Fine-tune PhoBERT |
|------------|----------------|-------------------|
| GPU tối thiểu | T4 16GB | T4 16GB |
| VRAM cần | ~12-14GB | ~8-10GB |
| Thời gian train | 6-12 giờ (5 epochs) | 2-4 giờ (4 epochs) |
| Disk | ~5GB (model + data) | ~3GB |
| Nền tảng gợi ý | Kaggle GPU (30h/tuần free) | Colab free đủ |

---

## 8. GIAO DIỆN WEB (MOCKUP)

```
┌─────────────────────────────────────────────────────┐
│  🔤 VietSumBot — Tóm tắt & Hỏi đáp tiếng Việt     │
├─────────────────────────────────────────────────────┤
│                                                      │
│  📋 Dán bài báo vào đây:                            │
│  ┌──────────────────────────────────────────────┐   │
│  │ [textarea lớn cho bài gốc]                   │   │
│  └──────────────────────────────────────────────┘   │
│                                                      │
│  Độ dài tóm tắt: ○ Ngắn  ● Trung bình  ○ Dài      │
│                                                      │
│  [🔍 Tóm tắt]                                       │
│                                                      │
│  📝 Kết quả tóm tắt:                                │
│  ┌──────────────────────────────────────────────┐   │
│  │ "Thủ tướng đã chủ trì cuộc họp về..."       │   │
│  │ Entity: [Thủ tướng]=PER [Hà Nội]=LOC        │   │
│  └──────────────────────────────────────────────┘   │
│                                                      │
│  ─────────── 💬 Hỏi đáp ────────────                │
│                                                      │
│  🤖 Bot: Bạn muốn hỏi gì về bài viết?              │
│  👤 Bạn: Cuộc họp bàn về vấn đề gì?                │
│  🤖 Bot: "phát triển kinh tế số" (confidence: 92%)  │
│  👤 Bạn: Ai chủ trì?                                │
│  🤖 Bot: "Thủ tướng Phạm Minh Chính" [PER] (98%)   │
│                                                      │
│  ┌──────────────────────────────────┐  [Gửi]       │
│  │ Nhập câu hỏi...                 │               │
│  └──────────────────────────────────┘               │
└─────────────────────────────────────────────────────┘
```

---

## 9. TIMELINE THỰC HIỆN (GỢI Ý)

| Tuần | Công việc |
|------|-----------|
| 1-2 | Thu thập & tiền xử lý dữ liệu (Vietnews, ViQuAD 2.0, PhoNER) |
| 3-5 | Fine-tune ViT5 + PhoBERT Multi-task (QA + NER/CRF) |
| 6-7 | Đánh giá, so sánh baseline, ablation study, phân tích lỗi |
| 8-9 | Triển khai web app (FastAPI + React/Streamlit), tích hợp 2 model |
| 10 | Viết báo cáo, chuẩn bị slide bảo vệ |

---

## 10. TÀI LIỆU THAM KHẢO

### 10.1 Papers chính

1. VNDS: A Vietnamese Dataset for Summarization (NICS 2019) — DOI: 10.1109/NICS48868.2019.9023886
2. ViT5: Pretrained Text-to-Text Transformer for Vietnamese (NAACL 2022) — https://arxiv.org/abs/2205.06457
3. UIT-ViQuAD: A Vietnamese Dataset for Machine Reading Comprehension (COLING 2020) — https://arxiv.org/abs/2009.14725
4. PhoBERT: Pre-trained Language Models for Vietnamese (EMNLP 2020) — https://arxiv.org/abs/2003.00744
5. Text Summarization Driven By QA Technique (ACM ICCA 2024) — https://dl.acm.org/doi/10.1145/3723178.3723311
6. QA-GNN: Reasoning with LMs and KGs for QA (NAACL 2021) — https://arxiv.org/abs/2104.06378
7. ViMs: A High-Quality Vietnamese Dataset for Multi-doc Summarization (LRE 2020)
8. BARTpho: Pre-trained Seq2Seq Models for Vietnamese (INTERSPEECH 2022)
9. ViGPTQA: LLMs for Vietnamese QA (EMNLP 2023) — https://aclanthology.org/2023.emnlp-industry.70
10. KGAnet: Knowledge Graph Attention Network for NLI (NCA 2020)

### 10.2 GitHub / Code tham khảo

- Vietnews dataset: https://github.com/ThanhChinhBK/vietnews
- ViT5 model + notebooks: https://github.com/vietai/ViT5
- PhoBERT summarization deploy: https://github.com/ngockhanh5110/nlp-vietnamese-text-summarization
- Vietnamese MRC model: https://huggingface.co/nguyenvulebinh/vi-mrc-base
- ViMs multi-doc dataset: https://github.com/CLC-HCMUS/ViMs-Dataset
- NLP Vietnamese Progress: https://github.com/undertheseanlp/NLP-Vietnamese-progress
- Awesome Vietnamese NLP: https://github.com/vndee/awsome-vietnamese-nlp

### 10.3 HuggingFace Models & Datasets

- ViT5-base: https://huggingface.co/VietAI/vit5-base
- ViT5 fine-tuned summarization: https://huggingface.co/VietAI/vit5-base-vietnews-summarization
- PhoBERT-base: https://huggingface.co/vinai/phobert-base
- UIT-ViQuAD 2.0: https://huggingface.co/datasets/taidng/UIT-ViQuAD2.0
- VietGPT News Summarization: https://huggingface.co/datasets/vietgpt/news_summarization_vi
- PhoNER_COVID19: https://huggingface.co/datasets/vinai/PhoNER_COVID19

---

*— HẾT —*