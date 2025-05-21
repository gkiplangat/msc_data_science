import os
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch


# Use a BERT model PRE-FINETUNED for sentiment analysis
# BERT fine-tuned on SST-2 dataset
model_name = "textattack/bert-base-uncased-SST-2"

# Load model and tokenizer
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForSequenceClassification.from_pretrained(model_name)

# Device configuration
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model = model.to(device)


def analyze_sentiment(text):
    # Tokenize input
    inputs = tokenizer(text,
                       return_tensors="pt",
                       truncation=True,
                       padding=True,
                       max_length=512).to(device)

    # Get predictions
    with torch.no_grad():
        outputs = model(**inputs)
        probs = torch.softmax(outputs.logits, dim=1)

    # Process results
    labels = ["NEGATIVE", "POSITIVE"]
    confidence, pred_class = torch.max(probs, dim=1)

    return {
        "text": text,
        "prediction": labels[pred_class],
        "confidence": confidence.item(),
        "probabilities": dict(zip(labels, probs.tolist()[0]))
    }


# Example usage
text = "Hugging Face is amazing!"
result = analyze_sentiment(text)

print(f"\nInput: {result['text']}")
print(f"Model: {model_name}")
print(f"Prediction: {result['prediction']} ({result['confidence']:.2%})")
print("Probabilities:")
for label, prob in result['probabilities'].items():
    print(f"  {label}: {prob:.4f}")

# Additional tokenization info
print("\nTokenization details:")
tokens = tokenizer.tokenize(text)
print(f"Tokens: {tokens}")
print(f"Token IDs: {tokenizer.encode(text)}")
