#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/jcasser4/James-Casserly-Portfolio.git"
TARGET_DIR="James-Casserly-Portfolio"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$(dirname "$SCRIPT_DIR")"

if [ -d "$TARGET_DIR/.git" ]; then
  echo "Using existing $TARGET_DIR folder..."
  cd "$TARGET_DIR"
  git pull --rebase origin main || true
else
  echo "Cloning $REPO_URL..."
  git clone "$REPO_URL" "$TARGET_DIR"
  cd "$TARGET_DIR"
fi

# Copy site files, including hidden .nojekyll, but excluding this script if run from package.
rsync -av --delete \
  --exclude='.git' \
  --exclude='PUSH_TO_GITHUB.sh' \
  --exclude='PUSH_TO_GITHUB.ps1' \
  "$SCRIPT_DIR/" ./

git add .
if git diff --cached --quiet; then
  echo "No changes to commit."
else
  git commit -m "Add portfolio website"
fi

git branch -M main
git push -u origin main

echo "Done. Now open the repo Settings > Pages and publish from main / root."
echo "Expected Pages URL: https://jcasser4.github.io/James-Casserly-Portfolio/"
