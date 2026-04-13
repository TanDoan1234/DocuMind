import torch
from transformers import (
    AutoModelForSeq2SeqLM, 
    AutoTokenizer, 
    AutoModelForQuestionAnswering, 
    pipeline
)
from loguru import logger
import os

class VietnameseModelService:
    """
    Service for managing local Vietnamese NLP models (ViT5, PhoBERT)
    """
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(VietnameseModelService, cls).__new__(cls)
            cls._instance._initialized = False
        return cls._instance

    def __init__(self):
        if self._initialized:
            return
        
        # Determine device (CPU, CUDA, or MPS for Apple Silicon)
        if torch.cuda.is_available():
            self.device = torch.device("cuda")
            logger.info("Using NVIDIA GPU (CUDA)")
        elif torch.backends.mps.is_available():
            self.device = torch.device("mps")
            logger.info("Using Apple Silicon GPU (MPS)")
        else:
            self.device = torch.device("cpu")
            logger.info("Using CPU")

        # Model Paths (HuggingFace names or local paths)
        self.vit5_name = "VietAI/vit5-base-vietnews-summarization"
        self.phobert_qa_name = "VinAI/phobert-base" # This is a base, for QA we usually need a fine-tuned head
        
        # Placeholders for models
        self.summarizer_model = None
        self.summarizer_tokenizer = None
        self.qa_pipeline = None
        
        self._initialized = True

    def load_summarizer(self):
        """Load ViT5 summarization model"""
        if self.summarizer_model is None:
            logger.info(f"Loading ViT5 summarizer: {self.vit5_name}")
            self.summarizer_tokenizer = AutoTokenizer.from_pretrained(self.vit5_name)
            self.summarizer_model = AutoModelForSeq2SeqLM.from_pretrained(self.vit5_name).to(self.device)
            logger.info("ViT5 summarizer loaded successfully")

    async def summarize(self, text: str, max_length: int = 150) -> str:
        """Generate summary for Vietnamese text using ViT5"""
        if self.summarizer_model is None:
            self.load_summarizer()

        # Pre-processing (Vietnamese typically doesn't need much for ViT5 as it uses its own tokenizer)
        inputs = self.summarizer_tokenizer(
            "vietnews: " + text, 
            return_tensors="pt", 
            padding=True, 
            truncation=True, 
            max_length=1024
        ).to(self.device)

        with torch.no_grad():
            outputs = self.summarizer_model.generate(
                inputs["input_ids"], 
                max_length=max_length, 
                num_beams=4, 
                early_stopping=True
            )

        summary = self.summarizer_tokenizer.decode(outputs[0], skip_special_tokens=True)
        return summary

    def load_qa(self, model_name: str = "nguyenvulebinh/vi-mrc-base"):
        """
        Load a Vietnamese QA model. 
        Note: PhoBERT base requires a QA head. Using a fine-tuned MRC model for better results.
        """
        if self.qa_pipeline is None:
            logger.info(f"Loading Vietnamese QA model: {model_name}")
            # Use 'nguyenvulebinh/vi-mrc-base' which is a popular Vietnamese QA model
            self.qa_pipeline = pipeline(
                "question-answering", 
                model=model_name, 
                tokenizer=model_name,
                device=0 if self.device.type == "cuda" else (-1 if self.device.type == "cpu" else "mps")
            )
            logger.info("QA model loaded successfully")

    async def ask(self, question: str, context: str) -> str:
        """Answer a question based on context using Vietnamese model"""
        if self.qa_pipeline is None:
            self.load_qa()

        result = self.qa_pipeline(question=question, context=context)
        return result["answer"]

# Global instance for easy access
vi_models = VietnameseModelService()
