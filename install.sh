#!/bin/sh

set -e

REPO="fuegoers/flowgo"
VERSION=${VERSION:-latest}
BINARY_NAME="flowgo"
INSTALL_DIR="/usr/local/bin"

echo "📦 Installing $BINARY_NAME..."

# Detect OS/ARCH
OS=$(uname | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

# Map ARCH for GoReleaser output
if [ "$ARCH" = "x86_64" ]; then
  ARCH="amd64"
elif [ "$ARCH" = "arm64" ]; then
  ARCH="arm64"
else
  echo "❌ Unsupported architecture: $ARCH"
  exit 1
fi

# Get latest version tag
if [ "$VERSION" = "latest" ]; then
  VERSION=$(curl -s "https://api.github.com/repos/$REPO/releases/latest" | grep tag_name | cut -d '"' -f4)
fi

FILENAME="${BINARY_NAME}_${VERSION}_${OS}_${ARCH}.tar.gz"
URL="https://github.com/${REPO}/releases/download/${VERSION}/${FILENAME}"

echo "⬇️ Downloading $FILENAME..."
curl -sSL "$URL" | tar -xz -C /tmp

echo "🚚 Moving binary to $INSTALL_DIR..."
sudo mv "/tmp/$BINARY_NAME" "$INSTALL_DIR/$BINARY_NAME"
chmod +x "$INSTALL_DIR/$BINARY_NAME"

echo "✅ Installed $BINARY_NAME $VERSION to $INSTALL_DIR"
