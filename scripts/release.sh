#!/bin/bash
set -e

# ── Config ────────────────────────────────────────────────────────────────────
APP_NAME="mac7z"
VERSION=$(grep '^version:' pubspec.yaml | awk '{print $2}' | cut -d'+' -f1)
OUTPUT_DIR="release"

# ── Couleurs ──────────────────────────────────────────────────────────────────
GREEN='\033[0;32m'; BLUE='\033[0;34m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
step() { echo -e "\n${BLUE}▶ $1${NC}"; }
ok()   { echo -e "${GREEN}✓ $1${NC}"; }
warn() { echo -e "${YELLOW}⚠ $1${NC}"; }
err()  { echo -e "${RED}✗ $1${NC}"; exit 1; }

echo -e "${BLUE}╔══════════════════════════════════════╗"
echo -e "║      mac7z release builder v${VERSION}      ║"
echo -e "╚══════════════════════════════════════╝${NC}"

mkdir -p "$OUTPUT_DIR"

# ══════════════════════════════════════════════════════════════════════════════
# macOS
# ══════════════════════════════════════════════════════════════════════════════
release_macos() {
  local BUILD_DIR="build/macos/Build/Products/Release"
  local APP_PATH="$BUILD_DIR/$APP_NAME.app"
  local DMG_NAME="${APP_NAME}-${VERSION}-macos.dmg"
  local DMG_STAGING="/tmp/${APP_NAME}_dmg_staging"

  # 1. Build
  step "[macOS] Flutter build release..."
  flutter build macos --release
  ok "Build → $APP_PATH"

  # 2. Signature ad-hoc
  step "[macOS] Signature ad-hoc..."
  codesign --deep --force --sign - "$APP_PATH"
  codesign --verify --deep --strict "$APP_PATH" && ok "Signature valide" || warn "Vérification signature échouée"

  # 3. DMG
  step "[macOS] Création du DMG..."
  rm -rf "$DMG_STAGING"
  mkdir -p "$DMG_STAGING"
  cp -R "$APP_PATH" "$DMG_STAGING/"
  ln -s /Applications "$DMG_STAGING/Applications"
  rm -f "$OUTPUT_DIR/$DMG_NAME"
  hdiutil create \
    -volname "$APP_NAME" \
    -srcfolder "$DMG_STAGING" \
    -ov -format UDZO -fs HFS+ \
    "$OUTPUT_DIR/$DMG_NAME"
  rm -rf "$DMG_STAGING"
  ok "DMG → $OUTPUT_DIR/$DMG_NAME ($(du -sh "$OUTPUT_DIR/$DMG_NAME" | awk '{print $1}'))"

}

# ══════════════════════════════════════════════════════════════════════════════
# Linux (Debian / Ubuntu)  →  .tar.gz  +  .deb
# ══════════════════════════════════════════════════════════════════════════════
release_linux() {
  local BUNDLE="build/linux/x64/release/bundle"
  local TAR_NAME="${APP_NAME}-${VERSION}-linux-x64.tar.gz"
  local DEB_NAME="${APP_NAME}_${VERSION}_amd64.deb"
  local DEB_DIR="/tmp/${APP_NAME}_deb"

  # 1. Build
  step "[Linux] Flutter build release..."
  flutter build linux --release
  ok "Build → $BUNDLE"

  # 2. Archive tar.gz
  step "[Linux] Création du tar.gz..."
  rm -f "$OUTPUT_DIR/$TAR_NAME"
  tar -czf "$OUTPUT_DIR/$TAR_NAME" -C "build/linux/x64/release" bundle
  ok "tar.gz → $OUTPUT_DIR/$TAR_NAME ($(du -sh "$OUTPUT_DIR/$TAR_NAME" | awk '{print $1}'))"

  # 3. Paquet .deb
  step "[Linux] Création du paquet .deb..."
  rm -rf "$DEB_DIR"

  # Structure Debian
  mkdir -p "$DEB_DIR/DEBIAN"
  mkdir -p "$DEB_DIR/usr/bin"
  mkdir -p "$DEB_DIR/usr/lib/$APP_NAME"
  mkdir -p "$DEB_DIR/usr/share/applications"
  mkdir -p "$DEB_DIR/usr/share/icons/hicolor/256x256/apps"

  # Copie du bundle Flutter
  cp -R "$BUNDLE/." "$DEB_DIR/usr/lib/$APP_NAME/"

  # Wrapper de lancement
  cat > "$DEB_DIR/usr/bin/$APP_NAME" << EOF
#!/bin/bash
exec /usr/lib/$APP_NAME/$APP_NAME "\$@"
EOF
  chmod +x "$DEB_DIR/usr/bin/$APP_NAME"

  # Icône (copie depuis les assets Flutter si disponible, sinon placeholder)
  if [ -f "assets/icon.png" ]; then
    cp "assets/icon.png" "$DEB_DIR/usr/share/icons/hicolor/256x256/apps/$APP_NAME.png"
  fi

  # Fichier .desktop
  cat > "$DEB_DIR/usr/share/applications/$APP_NAME.desktop" << EOF
[Desktop Entry]
Name=mac7z
Comment=Archive manager powered by 7-Zip
Exec=/usr/bin/$APP_NAME %f
Icon=$APP_NAME
Terminal=false
Type=Application
Categories=Utility;Archiving;
MimeType=application/x-7z-compressed;application/zip;application/x-tar;application/gzip;application/x-bzip2;application/x-xz;application/x-rar;application/vnd.rar;
StartupNotify=true
EOF

  # Métadonnées Debian
  INSTALLED_SIZE=$(du -sk "$DEB_DIR/usr" | awk '{print $1}')
  cat > "$DEB_DIR/DEBIAN/control" << EOF
Package: $APP_NAME
Version: $VERSION
Section: utils
Priority: optional
Architecture: amd64
Installed-Size: $INSTALLED_SIZE
Depends: p7zip-full, libgtk-3-0, libblkid1, liblzma5
Maintainer: Romain Pelletant <romain.pelletant@gmail.com>
Description: Archive manager powered by 7-Zip
 mac7z is a cross-platform archive manager built with Flutter.
 It supports drag & drop, file preview, encrypted archives,
 split volumes, and all formats supported by 7-Zip.
Homepage: https://github.com/romainpelletant/mac7z
EOF

  # Post-install : mise à jour du cache des icônes et .desktop
  cat > "$DEB_DIR/DEBIAN/postinst" << 'EOF'
#!/bin/bash
set -e
if command -v update-desktop-database &>/dev/null; then
  update-desktop-database /usr/share/applications || true
fi
if command -v gtk-update-icon-cache &>/dev/null; then
  gtk-update-icon-cache /usr/share/icons/hicolor || true
fi
EOF
  chmod 755 "$DEB_DIR/DEBIAN/postinst"

  # Build du .deb
  dpkg-deb --build --root-owner-group "$DEB_DIR" "$OUTPUT_DIR/$DEB_NAME"
  rm -rf "$DEB_DIR"
  ok ".deb → $OUTPUT_DIR/$DEB_NAME ($(du -sh "$OUTPUT_DIR/$DEB_NAME" | awk '{print $1}'))"
}

# ══════════════════════════════════════════════════════════════════════════════
# Sélection de la plateforme
# ══════════════════════════════════════════════════════════════════════════════
case "$(uname -s)" in
  Darwin) release_macos ;;
  Linux)  release_linux ;;
  *)      err "Plateforme non supportée : $(uname -s)" ;;
esac

# ── Résumé ────────────────────────────────────────────────────────────────────
echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  ✅ Release v${VERSION} prête dans ./$OUTPUT_DIR/"
ls "$OUTPUT_DIR/" | while read f; do
  echo -e "  📦 $f"
done
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
