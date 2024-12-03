#!/bin/bash

# Exit on any failure
set -e

# Determine architecture
ARCH=$(uname -m)

# Download the appropriate binary
if [ "$ARCH" = "x86_64" ]; then
  echo "Downloading kind for x86_64..."
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-amd64
elif [ "$ARCH" = "aarch64" ]; then
  echo "Downloading kind for ARM64..."
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.25.0/kind-linux-arm64
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi

# Set permissions and move kind
echo "Setting permissions for kind..."
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

echo "kind installation complete!"
