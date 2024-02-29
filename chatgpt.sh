#!/bin/bash

MODEL="gpt-3.5-turbo"

check_commands() {
  for cmd in jq curl glow; do
    if ! command -v "$cmd" &>/dev/null; then
      echo "Error: $cmd is not installed. Please install it before running this script."
      exit 1
    fi
  done
}

if [[ -z "${OPENAI_API_KEY}" ]]; then
  echo "Error: OPENAI_API_KEY is not set."
  echo "Please set your OpenAI API key in the OPENAI_API_KEY environment variable."
  exit 1
fi

while getopts ":m:h" opt; do
  case $opt in
  m)
    MODEL="$OPTARG"
    ;;
  h)
    echo "Usage: $0 [-m model]"
    echo "Options:"
    echo "  -m model    Specify the OpenAI model to use (default: gpt-3.5-turbo)"
    exit 0
    ;;
  \?)
    echo "Invalid option: -$OPTARG" >&2
    exit 1
    ;;
  esac
done

API_URL="https://api.openai.com/v1/chat/completions"

check_commands

chat_with_gpt() {
  local message=$1
  response=$(
    curl -s -X POST "$API_URL" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer ${OPENAI_API_KEY}" \
      --data-binary @- <<DATA
{
  "model": "$MODEL",
  "messages": [
    {"role": "system", "content": "You are a helpful assistant."},
    {"role": "user", "content": "$message"}
  ]
}
DATA
  )

  if ! echo "$response" | jq . &>/dev/null; then
    echo "Failed to parse JSON response."
    return 1
  fi

  local reply=$(echo "$response" | jq -r '.choices[0].message.content')

  local readme_temp=$(mktemp)
  trap 'rm -f "$readme_temp"' EXIT
  echo "ChatGPT: $reply" >"$readme_temp"
  glow "$readme_temp"
}

echo "ChatGPT CLI - Model: $MODEL - Type 'exit' to end the chat."

while true; do
  echo -n "You: "
  read input

  if [[ $input == "exit" ]]; then
    exit 0
  fi

  chat_with_gpt "$input"
done
