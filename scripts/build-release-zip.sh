#!/bin/sh
# Build dist/concise-deep-research.zip for a GitHub release.
# The zip holds the skill folder at its root, as Claude chat needs.
# Usage: scripts/build-release-zip.sh
set -eu

cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/concise-deep-research.zip
(cd skills && zip -rq ../dist/concise-deep-research.zip concise-deep-research \
  -x '*.DS_Store' '*__pycache__*' '*.pyc')

unzip -l dist/concise-deep-research.zip | grep -q ' concise-deep-research/SKILL.md$' \
  || { echo "Error: SKILL.md is not at concise-deep-research/SKILL.md in the zip" >&2; exit 1; }

echo "Built dist/concise-deep-research.zip"
echo "Attach it to a release: gh release create vX.Y.Z dist/concise-deep-research.zip"
