#!/usr/bin/env bash
# Ouvre l'espace de travail à deux dossiers (starter + context-nexus), une seule fois par Codespace.
# Lancé par postAttachCommand : le client VS Code est alors attaché et la commande `code` est utilisable.
WS="$(dirname "$(pwd)")/hackathon.code-workspace"
MARK="$HOME/.hackathon-workspace-ouvert"
[ -f "$WS" ] && [ ! -f "$MARK" ] || exit 0
touch "$MARK"
code -r "$WS" || true
