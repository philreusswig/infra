echo "📦 Installing shared packages..."
# 1. grep -v '^#' removes lines starting with #
# 2. grep -v '^$' removes empty lines
grep -v '^#' system/shared/common-packages.txt | grep -v '^$' | xargs sudo dnf install -y

#!/usr/bin/env bash
set -e

echo "📦 [Fedora] Upgrading package list..."
sudo dnf check-update || true

echo "📦 [Fedora] Installing shared packages..."
grep -v '^#' system/shared/common-packages.txt | grep -v '^$' | xargs sudo dnf install -y
