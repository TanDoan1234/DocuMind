from typing import Any, List, Optional
from langchain_core.callbacks.manager import CallbackManagerForLLMRun
from langchain_core.language_models.chat_models import BaseChatModel
from langchain_core.messages import BaseMessage, ChatMessage, AIMessage
from langchain_core.outputs import ChatGeneration, ChatResult
from pydantic import Field

from open_notebook.ai.vi_models import vi_models

class VietnameseSummarizerChatModel(BaseChatModel):
    """
    A LangChain wrapper for ViT5 summarization model.
    It maps chat messages to the summarization task.
    """
    
    model_name: str = "vi-vit5"

    @property
    def _llm_type(self) -> str:
        return "vietnamese-summarizer"

    def _generate(
        self,
        messages: List[BaseMessage],
        stop: Optional[List[str]] = None,
        run_manager: Optional[CallbackManagerForLLMRun] = None,
        **kwargs: Any,
    ) -> ChatResult:
        # Extract the content from the messages (usually system + human)
        # For summarization, we usually just take the last human message or the context
        text_to_summarize = messages[-1].content
        
        # We use a trick: if it's a list (multimodal), we extract text
        if isinstance(text_to_summarize, list):
            text_to_summarize = " ".join([i.get("text", "") for i in text_to_summarize if i.get("type") == "text"])

        # Import and run the local model synchronously (since _generate is sync)
        import asyncio
        summary = asyncio.run(vi_models.summarize(str(text_to_summarize)))
        
        message = AIMessage(content=summary)
        generation = ChatGeneration(message=message)
        return ChatResult(generations=[generation])

class VietnameseQAChatModel(BaseChatModel):
    """
    A LangChain wrapper for PhoBERT/MRC QA model.
    """
    
    model_name: str = "vi-mrc-qa"

    @property
    def _llm_type(self) -> str:
        return "vietnamese-qa"

    def _generate(
        self,
        messages: List[BaseMessage],
        stop: Optional[List[str]] = None,
        run_manager: Optional[CallbackManagerForLLMRun] = None,
        **kwargs: Any,
    ) -> ChatResult:
        # Question Answering context extraction logic
        # Usually: System message has context, Human message has question
        context = ""
        question = ""
        
        for m in messages:
            if m.type == "system":
                context += m.content
            elif m.type == "human":
                question = m.content

        import asyncio
        answer = asyncio.run(vi_models.ask(str(question), str(context)))
        
        message = AIMessage(content=answer)
        generation = ChatGeneration(message=message)
        return ChatResult(generations=[generation])
