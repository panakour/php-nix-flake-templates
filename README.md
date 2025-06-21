# PHP Nix Flake Templates

```bash
# Create a new PHP project
nix flake init --template github:panakour/php-nix-flake-templates

# Choose your PHP version by editing flake.nix:
# phpVersion = "84";  # Change to your desired version

# Enter the development environment
nix develop
```


## ✨ Features
- **All PHP versions** supported by [nix-phps](https://github.com/fossar/nix-phps) with easy switching
- **Xdebug** pre-configured for debugging
- **Composer** for dependency management
- **Development-optimized** PHP configuration
- **Cross-platform** (Linux, macOS, WSL)


## 📖 Usage
Once you've initialized a template:

1. **Enter the development environment**: `nix develop`
2. **Start the Caddy server**: `./nix/start-caddy.sh`
3. **Visit your site**: http://localhost:8000
4. **Stop services**: `pkill -f 'php-fpm|caddy'`


## 📋 Requirements

- [Nix](https://nixos.org/download.html) with flakes enabled
- Optional: [direnv](https://direnv.net/) for automatic environment activation

## 🤝 Contributing

Contributions are welcome! Feel free to submit issues and enhancement requests.

## 📄 License

MIT License - see LICENSE file for details.
