#!/usr/bin/env bash
set -e

# instala o Bun
curl -fsSL https://bun.sh/install | bash

# adiciona bun ao PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# inicializa projeto caso não exista
if [ ! -f package.json ]; then
  exit
fi

# instala dependências básicas
bun install
