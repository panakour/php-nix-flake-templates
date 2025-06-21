{
  description = "PHP Caddy development environment with PHP, Xdebug, and Caddy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-phps.url = "github:fossar/nix-phps";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nix-phps,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        phps = nix-phps.packages.${system};
        
        # 🔧 Change this to switch PHP versions
        # See available versions at: https://github.com/fossar/nix-phps
        phpVersion = "84";
        
        php = phps."php${phpVersion}".buildEnv {
          extensions = (
            { enabled, all }:
            enabled
            ++ (with all; [
              xdebug
              redis
            ])
          );

          extraConfig = ''
            log_errors = On
            error_log = /tmp/php_errors.log
            display_errors = On
            display_startup_errors = On
            error_reporting = E_ALL
            memory_limit = 8192M
            max_execution_time = 0
            upload_max_filesize = 400M
            post_max_size = 600M
            expose_php = 1

            # Xdebug configuration
            xdebug.mode = debug
            xdebug.start_with_request = yes
            xdebug.discover_client_host = 0
            xdebug.client_host = 127.0.0.1
            xdebug.client_port = 9003
            xdebug.show_error_trace = 1
            xdebug.log_level = 0
          '';
        };

      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            php
            pkgs."php${phpVersion}Packages".composer
            pkgs.caddy
          ];

          shellHook = ''
            echo "PHP version: $(php --version | head -n 1)"
            echo ""
            echo "📋 Start servers:"
            echo "  Caddy:   ./nix/start-caddy.sh"
            echo "  Stop:    pkill -f 'php-fpm|caddy'"
          '';

        };

      }
    );
}
