#!/usr/bin/env bash
set -e

# Ensure we run from the script's directory
CDPATH="" cd -- "$(dirname -- "$0")"

echo "=================================================="
echo "🚀 Starting Infrastructure Bootstrap Workflow"
echo "=================================================="

# Detect OS / Distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="mac"
else
    OS="unknown"
fi

echo "🖥️  Detected environment: $OS"

# Run OS-specific setup
if [ -f "system/$OS/os-setup.sh" ]; then
    echo "⚙️  Running system configurations for $OS..."
    chmod +x "system/$OS/os-setup.sh"
    ./system/"$OS"/os-setup.sh
else
    echo "⚠️  No system setup script found for target '$OS'. Skipping OS setup."
fi

echo "=================================================="
echo "✅ Bootstrap Complete successfully!"
echo "=================================================="
