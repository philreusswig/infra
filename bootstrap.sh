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

# Link Dotfiles
echo "🔗 Symlinking dotfiles..."

# Safe symlink function
symlink_file() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        rm -rf "$dest"
    fi
    ln -s "$src" "$dest"
    echo "   Linked: $dest -> $src"
}

# Link the core .bashrc
symlink_file "$(pwd)/dotfiles/bash/.bashrc" "$HOME/.bashrc"

# Recreate the target .bashrc.d directory safely
mkdir -p "$HOME/.bashrc.d"

# Deep-link each modular script inside .bashrc.d
for src_file in "$(pwd)/dotfiles/bash/.bashrc.d"/*.sh; do
    filename=$(basename "$src_file")
    symlink_file "$src_file" "$HOME/.bashrc.d/$filename"
done

# Link git
mkdir -p "$HOME/.config/git"
symlink_file "$(pwd)/dotfiles/git/config" "$HOME/.config/git/config"

# Link nvim
mkdir -p "$HOME/.config/nvim"
symlink_file "$(pwd)/dotfiles/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# Link tmux
mkdir -p "$HOME/.config/tmux"
symlink_file "$(pwd)/dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

echo "=================================================="
echo "✅ Bootstrap Complete successfully!"
echo "=================================================="
