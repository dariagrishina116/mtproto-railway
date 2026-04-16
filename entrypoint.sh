#!/bin/sh

if [ -z "${MTG_SECRET}" ]; then
  echo "ERROR: MTG_SECRET env variable is not set!"
  exit 1
fi

cat > /tmp/mtg.toml <<EOF
secret = "${MTG_SECRET}"

[bind]
address = "0.0.0.0:8443"
EOF

echo "Starting mtg on 0.0.0.0:8443"
exec mtg run /tmp/mtg.toml
