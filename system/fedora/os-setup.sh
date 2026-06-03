#!/usr/bin/env bash
set -e

echo "📦 [Fedora] Upgrading package list..."
sudo dnf check-update || true

echo "📦 [Fedora] Installing packages..."
grep -v '^#' system/fedora/packages.txt | grep -v '^$' | xargs sudo dnf install -y

echo "📦 [Fedora] Installing Rust and Cargo..."
curl https://sh.rustup.rs -sSf | sh
cargo install cargo-binstall --locked

echo "📦 [Fedora] Installing Jujutsu..."
cargo binstall --strategies crate-meta-data jj-cli

echo "📦 [Fedora] Installing Python packages..."
python3 -m pip install -r system/shared/python-packages.txt
