{
  description = "PHP development templates with multiple web server options";

  outputs = { self }: {
    templates = {
      default = {
        path = ./template;
        description = "PHP development environment with Caddy server (configurable PHP version)";
        welcomeText = ''
          # PHP Nix Development Environment (Caddy)

          ## 🚀 Quick Setup

          1. **Choose your PHP version**: Edit `flake.nix` and change:
             ```nix
             phpVersion = "84";  # Change to your desired version
             ```

          2. **Available versions**: See https://github.com/fossar/nix-phps
             Examples: "81", "82", "83", "84" (recommended)
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
    };
  };
}
