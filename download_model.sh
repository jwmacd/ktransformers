#!/bin/bash

# Script to download Deepseek-V3 model for KTransformers
# Usage: ./download_model.sh

set -e

MODEL_DIR="./models/DeepSeek-V3"
GGUF_DIR="./models/DeepSeek-V3-GGUF"
TEMP_DIR="./tmp"
HUGGINGFACE_MODEL="deepseek-ai/deepseek-v3-7b"

# Create directories
mkdir -p $MODEL_DIR
mkdir -p $GGUF_DIR
mkdir -p $TEMP_DIR

echo "======================================"
echo "Downloading Deepseek-V3 model files..."
echo "======================================"

# Use HF CLI if available, otherwise use wget
if command -v huggingface-cli &> /dev/null; then
    huggingface-cli download $HUGGINGFACE_MODEL --local-dir $MODEL_DIR
else
    echo "Huggingface CLI not found, installing it..."
    pip install -U "huggingface_hub[cli]"
    huggingface-cli download $HUGGINGFACE_MODEL --local-dir $MODEL_DIR
fi

echo "=================================="
echo "Model download complete!"
echo "=================================="
echo "Model files are in: $MODEL_DIR"
echo
echo "Important: GGUF files will be automatically generated on first run"
echo "or you can run the conversion manually using the KTransformers utilities."
echo
echo "Next steps:"
echo "1. Make sure Docker and Docker Compose are installed"
echo "2. Run 'docker-compose up -d' to start the container"
echo "3. Check logs with 'docker logs ktransformers'"
echo "==================================" 