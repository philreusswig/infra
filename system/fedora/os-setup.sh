echo "📦 Installing shared packages..."
# 1. grep -v '^#' removes lines starting with #
# 2. grep -v '^$' removes empty lines
grep -v '^#' system/shared/common-packages.txt | grep -v '^$' | xargs sudo dnf install -y

#!/usr/bin/env bash
set -e

echo "📦 [Fedora] Upgrading package list..."
sudo dnf check-update || true

echo "📦 [Fedora] Installing shared packages..."
grep -v '^#' system/fedora/packages.txt | grep -v '^$' | xargs sudo dnf install -y

echo "📦 [Fedora] Installing Rust and Cargo..."
curl https://sh.rustup.rs -sSf | sh
cargo install cargo-binstall --locked

echo "📦 [Fedora] Installing Jujutsu..."
cargo binstall --strategies crate-meta-data jj-cli
