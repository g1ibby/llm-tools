#!/bin/bash

# Check if git-lfs is installed
if ! git lfs version >/dev/null 2>&1; then
    echo "git-lfs is not installed. Installing..."
    # Detect the OS
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux
        sudo apt-get install git-lfs
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        brew install git-lfs
    else
        echo "Unsupported OS. Please install git-lfs manually."
        exit 1
    fi
    # Initialize git-lfs
    git lfs install
else
    echo "git-lfs is already installed."
fi

# The first argument is the full URL to the file
FULL_URL=$1

# Extract the base Git URL, repo name and file path
BASE_URL=$(echo $FULL_URL | cut -d'/' -f-5)
REPO_NAME=$(echo $FULL_URL | cut -d'/' -f5)
FILE_PATH=$(echo $FULL_URL | cut -d'/' -f8-)

# Clone the repo without downloading LFS objects
GIT_LFS_SKIP_SMUDGE=1 git clone $BASE_URL

# Navigate to the cloned repo
cd $REPO_NAME

# Pull the specific LFS file
git lfs pull --include="$FILE_PATH"

# Move the file to the parent directory
mv $FILE_PATH ../

# Navigate back to the parent directory
cd ..

# Remove the cloned repo
rm -rf $REPO_NAME
