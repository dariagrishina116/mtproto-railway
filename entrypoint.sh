#!/bin/sh

PORT="${PORT:-8443}"

if [ -z "${MTG_SECRET}" ]; then
  echo "ERROR: MTG_SECRET env variable is not set!"
  echo "Set it in Railway Variables tab."
  exit 1
fi

echo "Starting mtg on port ${PORT}..."
echo "Secret length: ${#MTG_SECRET}"

cat > /tmp/mtg.toml <<EOF
secret = "${MTG_SECRET}"

[bind]
address = "0.0.0.0:${PORT}"
EOF

cat /tmp/mtg.toml

exec mtg run /tmp/mtg.toml
