# ChatGPT CLI

A simple command-line interface (CLI) for interacting with OpenAI's ChatGPT model.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have a Linux or macOS machine.
- You have installed `curl`, `jq`, and `glow`.
  - `curl` is used for making API requests.
  - `jq` is used for parsing JSON responses.
  - `glow` is used for rendering markdown content in the terminal.

## Installation

To use the ChatGPT CLI, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/chatgpt-cli.git
   ```

2. Navigate to the cloned directory:

   ```bash
   cd chatgpt-cli
   ```

3. Make the script executable:

   ```bash
   chmod +x chatgpt.sh
   ```

4. Set your OpenAI API key as an environment variable:

   ```bash
   export OPENAI_API_KEY='your-api-key'
   ```

## Usage

To start a chat session with ChatGPT, run the script:

```bash
./chatgpt.sh
```

You can specify the model to use with the -m option:

```bash
./chatgpt.sh -m gpt-3.5-turbo
```

Type your message and press Enter to send it. The response from ChatGPT will be displayed with the prefix **ChatGPT:**.

To exit the chat, type `exit` and press Enter.

## Contributing

Contributions are welcome! If you have a suggestion or improvement, please fork the repository and create a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
