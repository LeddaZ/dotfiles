#!/bin/bash
COMMAND=${1:-up}
FLAGS=""
[ "$COMMAND" = "up" ] && FLAGS="-d"

find . -name "compose.yml" | sort | while read -r f; do
  dir=$(dirname "$f")
  echo "==> $dir"
  (cd "$dir" && docker compose $COMMAND $FLAGS)
done
