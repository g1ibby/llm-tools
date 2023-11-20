# LLM Tools

This repository contains useful tools for working with Large Language Models (LLM). These tools are designed to help you manage and interact with large datasets and models more efficiently.

## dlf.sh

The `dlf.sh` script is a utility for downloading specific files from a Git LFS repository without cloning the entire repository. It's useful when you want to download a single large file without having to clone and pull the whole repository.

This script first checks if Git LFS is installed on your machine, and if not, it will install it. Then, it clones the repository without downloading the LFS objects. After that, it pulls the specific LFS file you specified. Finally, it cleans up by removing the cloned repository, leaving only the file you wanted in your current directory.

### Usage

You can run the `dlf.sh` script with a single command using `curl` or `wget`. Here are examples for both:

Using `curl`:

```bash
bash <(curl -s https://raw.githubusercontent.com/g1ibby/llm-tools/main/dlf.sh) <URL_TO_FILE>
```

Replace `<URL_TO_FILE>` with the full URL to the file you want to download. The file will be downloaded to your current directory.

### Example

To download the `mistral-7b-finetuned-orca-dpo-v2.Q4_0.gguf` file from the `TheBloke/mistral-7B-finetuned-orca-dpo-v2-GGUF` repository, you would run:

```bash
bash <(curl -s https://raw.githubusercontent.com/g1ibby/llm-tools/main/dlf.sh) https://huggingface.co/TheBloke/mistral-7B-finetuned-orca-dpo-v2-GGUF/blob/main/mistral-7b-finetuned-orca-dpo-v2.Q4_0.gguf
```

This will download the `mistral-7b-finetuned-orca-dpo-v2.Q4_0.gguf` file to your current directory.

