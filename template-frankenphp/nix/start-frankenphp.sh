#!/usr/bin/env bash

pkill -f frankenphp 2>/dev/null || true

echo "Starting FrankenPHP on http://localhost:8000"
frankenphp run --config nix/Caddyfile --adapter caddyfile
