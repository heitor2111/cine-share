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

# configura o pre-commit hook com o PATH correto do bun
if [ -f .husky/pre-commit ]; then
  sed -i '2a\\n# Adiciona o caminho do bun ao PATH\nexport PATH="/home/node/.bun/bin:$PATH"\n' .husky/pre-commit
fi
