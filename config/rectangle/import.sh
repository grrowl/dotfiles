#!/bin/bash
# Restore Rectangle settings (shortcuts + behavior) on a new machine.
#
# Rectangle stores its config as a macOS preferences domain (a cached binary
# plist), so it can't be symlinked like a text config. We version a *cleaned*
# export (shortcuts + behavior only — no window-frame or Sparkle-updater noise)
# and import it here.
#
# NOTE: `defaults import` REPLACES the Rectangle domain. Any existing prefs are
# backed up to bak/ first. Safe on a fresh machine.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOMAIN="com.knollsoft.Rectangle"
SRC="$DIR/${DOMAIN}.plist"
BAK="$HOME/dotfiles/bak"

[ -f "$SRC" ] || { echo "missing $SRC" >&2; exit 1; }

mkdir -p "$BAK"
if defaults export "$DOMAIN" - >/dev/null 2>&1; then
  defaults export "$DOMAIN" "$BAK/${DOMAIN}.backup.plist" 2>/dev/null \
    && echo "Backed up existing Rectangle prefs to bak/${DOMAIN}.backup.plist"
fi

defaults import "$DOMAIN" "$SRC"
killall Rectangle 2>/dev/null || true
echo "Rectangle settings imported. Relaunch Rectangle to apply."
