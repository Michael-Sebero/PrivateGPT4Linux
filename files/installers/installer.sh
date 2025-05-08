#!/bin/bash

# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Clone the private-gpt repository
git clone https://github.com/zylon-ai/private-gpt
cd private-gpt

# Extract model names from settings-ollama-pg.yaml
if [ -f "settings-ollama-pg.yaml" ]; then
    LLM_MODEL=$(grep -E "^llm_model:" settings-ollama-pg.yaml | sed 's/llm_model: *//')
    EMBEDDING_MODEL=$(grep -E "^embedding_model:" settings-ollama-pg.yaml | sed 's/embedding_model: *//')
fi

# Start Ollama server in the background
ollama serve &
OLLAMA_PID=$!

# Give Ollama some time to start up
sleep 5

# Pull the required models
ollama pull $LLM_MODEL
ollama pull $EMBEDDING_MODEL

# Download Pyenv
curl https://pyenv.run | bash
export PATH="/home/user/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

pyenv install 3.11
pyenv local 3.11

# Download Poetry
curl -sSL https://install.python-poetry.org | python3.11 -

# Install the Python dependencies
poetry install --extras "ui llms-ollama embeddings-ollama vector-stores-qdrant"

# Run the application
PGPT_PROFILES=ollama make run

# If PGPT_PROFILES=ollama make run exits, we should also kill the Ollama server
kill $OLLAMA_PID
