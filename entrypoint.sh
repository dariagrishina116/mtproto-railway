#!/bin/sh

PORT="${PORT:-8443}"

cat > /tmp/mtg.toml <<EOF
secret = "${MTG_SECRET}"

[bind]
address = "0.0.0.0:${PORT}"
EOF

exec mtg run /tmp/mtg.toml
