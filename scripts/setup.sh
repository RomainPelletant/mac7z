#!/bin/bash
set -e

# ── Config ────────────────────────────────────────────────────────────────────
# Version of 7-Zip to download (check on https://7-zip.org)
SEVENZIP_VERSION="2600"

# Resolve path relative to this script, regardless of where it is called from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [[ "$(uname -s)" == "Darwin" ]]; then
  SEVENZIP_URL="https://7-zip.org/a/7z${SEVENZIP_VERSION}-mac.tar.xz"
  DEST="$SCRIPT_DIR/../macos/Resources/7zz"
else
  ARCH="$(uname -m)"
  if [[ "$ARCH" == "x86_64" ]]; then
    SEVENZIP_URL="https://7-zip.org/a/7z${SEVENZIP_VERSION}-linux-x64.tar.xz"
  elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
    SEVENZIP_URL="https://7-zip.org/a/7z${SEVENZIP_VERSION}-linux-arm64.tar.xz"
  else
    echo "Unsupported architecture: $ARCH" && exit 1
  fi
  DEST="$SCRIPT_DIR/../linux/Resources/7zz"
fi

GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[1;33m'; NC='\033[0m'
step() { echo -e "\n${BLUE}▶ $1${NC}"; }
ok()   { echo -e "${GREEN}✓ $1${NC}"; }
warn() { echo -e "${YELLOW}⚠ $1${NC}"; }

echo -e "${BLUE}╔═══════════════════════════════╗"
echo -e "║   mac7z setup — 7zz binary   ║"
echo -e "╚═══════════════════════════════╝${NC}"


# ── Already exists? ────────────────────────────────────────────────────────────
if [[ -f "$DEST" ]]; then
  CURRENT=$("$DEST" i 2>/dev/null | grep "7-Zip" | head -1 || echo "inconnu")
  ok "7zz already exists : $CURRENT"
  echo "  To force re-install : rm $DEST && ./setup.sh"
  exit 0
fi

# ── Download ────────────────────────────────────────────────────────────
step "Download 7-Zip ${SEVENZIP_VERSION}..."
echo "  Source : $SEVENZIP_URL"

TMPDIR_WORK=$(mktemp -d)
trap "rm -rf $TMPDIR_WORK" EXIT

if command -v curl &>/dev/null; then
  curl -L --progress-bar "$SEVENZIP_URL" -o "$TMPDIR_WORK/7z.tar.xz"
elif command -v wget &>/dev/null; then
  wget -q --show-progress "$SEVENZIP_URL" -O "$TMPDIR_WORK/7z.tar.xz"
else
  echo "✗ curl ou wget requis" && exit 1
fi

# ── Extraction ────────────────────────────────────────────────────────────────
step "Extraction..."
tar -xf "$TMPDIR_WORK/7z.tar.xz" -C "$TMPDIR_WORK"

BINARY=$(find "$TMPDIR_WORK" -name "7zz" -type f | head -1)
if [[ -z "$BINARY" ]]; then
  echo "✗ 7zz binary not found in archive" && exit 1
fi

# ── Installation ──────────────────────────────────────────────────────────────
step "Installation in $DEST..."
mkdir -p "$(dirname "$DEST")"
cp "$BINARY" "$DEST"
chmod +x "$DEST"

# ── Final check ─────────────────────────────────────────────────────────────
VERSION_STR=$("$DEST" i 2>/dev/null | grep "7-Zip" | head -1)
ok "7zz installed : $VERSION_STR"

echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  ✅ Setup finished !"
if [[ "$(uname -s)" == "Darwin" ]]; then
  echo -e "  Launch app : flutter run -d macos"
else
  echo -e "  Launch app : flutter run -d linux"
fi
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
