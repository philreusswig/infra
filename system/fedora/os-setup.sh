#!/usr/bin/env bash
set -e

# ==========================================
# Package Installation
# ==========================================

echo "📦 [Fedora] Upgrading package list..."
sudo dnf check-update || true

echo "📦 [Fedora] Installing packages..."
grep -v '^#' system/fedora/packages.txt | grep -v '^$' | xargs sudo dnf install -y

echo "📦 [Fedora] Installing Rust and Cargo..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
cargo install cargo-binstall --locked

echo "📦 [Fedora] Installing Jujutsu..."
cargo binstall --strategies crate-meta-data jj-cli

echo "📦 [Fedora] Installing Python packages..."
python3 -m pip install -r system/shared/python-packages.txt

echo "📦 [Fedora] Installing Google Antigravity cli..."
curl -fsSL https://antigravity.google/cli/install.sh | bash

# ==========================================
# SSH Keys
# ==========================================

if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
	echo "🔑 Generating SSH key..."
	mkdir -p "$HOME/.ssh"
	chmod 700 "$HOME/.ssh"
	ssh-keygen -t ed25519 -C "phil.reusswig@gmail.com"
	echo "✅ SSH key generated successfully!"
else
	echo "✅ SSH key already exists (skipping)"
fi
