{
  description = "PHP development templates with multiple web server options";

  outputs =
    { self }:
    {
      templates = {
        default = {
          path = ./template;
          description = "PHP development environment with Caddy server (configurable PHP version)";
          welcomeText = ''
            # PHP Nix Development Environment (Caddy)

            ## 🚀 Quick Setup

            1. **Choose your PHP version**: Edit `flake.nix` and change:
               ```nix
               phpVersion = "85";  # Change to your desired version
               ```

            2. **Available versions**: See https://github.com/fossar/nix-phps
               Examples: "81", "82", "83", "84", "85" (recommended)
               Legacy: "56", "70", "71", "72", "73", "74", "80"

            3. **Enter development environment**:
               ```bash
               nix develop
               ```

            4. **Start Caddy server**:
               ```bash
               ./nix/start-caddy.sh
               ```

            Visit: http://localhost:8000

            ## 📚 More Info
            - Template Repository: https://github.com/panakour/php-nix-flake-templates
            - Available PHP versions: https://github.com/fossar/nix-phps
          '';
        };

        frankenphp = {
          path = ./template-frankenphp;
          description = "PHP development environment with FrankenPHP (modern app server, no PHP-FPM needed)";
          welcomeText = ''
            # PHP Nix Development Environment (FrankenPHP)

            ## 🚀 Quick Setup

            1. **Enter development environment**:
               ```bash
               nix develop
               ```

            2. **Start FrankenPHP server**:
               ```bash
               ./nix/start-frankenphp.sh
               ```

            Visit: http://localhost:8000

            ## ℹ️ Notes
            - FrankenPHP embeds its own PHP for serving requests (no PHP-FPM needed)
            - CLI PHP (Composer, scripts) uses a separate nix-phps version
            - Edit `phpVersion` in `flake.nix` to change the CLI PHP version

            ## 📚 More Info
            - Template Repository: https://github.com/panakour/php-nix-flake-templates
            - FrankenPHP: https://frankenphp.dev
            - Available CLI PHP versions: https://github.com/fossar/nix-phps
          '';
        };
      };
    };
}
