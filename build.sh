#!/usr/bin/env bash
set -euo pipefail

ZOLA_VERSION=0.23.6
ARCHIVE="zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"

main() {
    curl -fsSLJO "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/${ARCHIVE}"
    tar -xzf "$ARCHIVE"

    git submodule update --init --recursive

    ./zola build
}

main "$@"
