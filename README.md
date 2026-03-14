# PHP Nix Flake Templates

## Available Templates

### Default (Caddy + PHP-FPM)

```bash
nix flake init --template github:panakour/php-nix-flake-templates
```

Traditional setup using Caddy as a reverse proxy to PHP-FPM. Supports all PHP versions from [nix-phps](https://github.com/fossar/nix-phps).

### FrankenPHP

```bash
nix flake init --template github:panakour/php-nix-flake-templates#frankenphp
```

Modern setup using [FrankenPHP](https://frankenphp.dev) - a PHP app server built on Caddy with PHP embedded directly. No separate PHP-FPM process needed.

---

After initializing either template, choose your PHP version by editing `flake.nix`:

```nix
phpVersion = "84";  # Change to your desired version
```

Then enter the development environment:

```bash
nix develop
```


## Features

- **All PHP versions** supported by [nix-phps](https://github.com/fossar/nix-phps) with easy switching
- **Xdebug** pre-configured for debugging
- **Composer** for dependency management
- **Development-optimized** PHP configuration
- **Cross-platform** (Linux, macOS, WSL)


## Usage

### Caddy template (default)

1. **Enter the development environment**: `nix develop`
2. **Start the Caddy server**: `./nix/start-caddy.sh`
3. **Visit your site**: http://localhost:8000
4. **Stop services**: `pkill -f 'php-fpm|caddy'`

### FrankenPHP template

1. **Enter the development environment**: `nix develop`
2. **Start FrankenPHP**: `./nix/start-frankenphp.sh`
3. **Visit your site**: http://localhost:8000
4. **Stop services**: `pkill -f frankenphp`

> **Note**: FrankenPHP is built against the same PHP version and extensions from nix-phps, so the server and CLI use the same PHP. The first `nix develop` may take longer as FrankenPHP is compiled from source with your chosen PHP.


#### Legacy composer 1
By default, both templates use the latest Composer. If you need to use legacy Composer version 1 for compatibility with older projects, you can modify the `buildInputs` in your `flake.nix`:

```nix
buildInputs = [
  php
  php.packages.composer-1  # Use composer 1 instead
  # ...
];
```

Change `php.packages.composer` to `php.packages.composer-1` to use the legacy version.


## Requirements

- [Nix](https://nixos.org/download.html) with flakes enabled
- Optional: [direnv](https://direnv.net/) for automatic environment activation

## Contributing

Contributions are welcome! Feel free to submit issues and enhancement requests.

## License

MIT License - see LICENSE file for details.
