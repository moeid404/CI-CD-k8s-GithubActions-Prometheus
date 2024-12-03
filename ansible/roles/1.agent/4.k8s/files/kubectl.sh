#!/bin/bash

# Exit on any failure
set -e

# Download the latest stable version of kubectl
echo "Downloading kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Set permissions and move kubectl
echo "Setting permissions for kubectl..."
chmod +x kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Ensure ~/.local/bin directory exists
echo "Creating ~/.local/bin if not exists..."
mkdir -p ~/.local/bin

# Move kubectl to user's local bin
echo "Moving kubectl to ~/.local/bin..."
mv ./kubectl ~/.local/bin/kubectl

echo "kubectl installation complete!"
