#!/usr/bin/env bash

pkill -f 'php-fpm|caddy' 2>/dev/null || true
rm -f /tmp/php-fpm.sock

echo "Starting PHP-FPM..."
php-fpm --fpm-config nix/php-fpm.conf

sleep 2

if [ ! -S /tmp/php-fpm.sock ]; then
  echo "ERROR: PHP-FPM socket not created!"
  exit 1
fi

echo "Starting Caddy on http://localhost:8000"
caddy run --config nix/Caddyfile --adapter caddyfile
