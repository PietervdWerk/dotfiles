{
  description = "nix-darwin system flake";

  # Dependencies of the flake
  inputs = {
    # nixpkgs-unstable points to the most recent packages defined in the nixpkgs. 
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      system.primaryUser = "pietervanderwerk";

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      security.pam.services.sudo_local.enable = false;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      nixpkgs.config.allowUnfree = true;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        ./modules/configuration.nix

        # Tools
        ./modules/cli-tools.nix
        ./modules/shell.nix
        ./modules/homebrew.nix
        ./modules/apps.nix

        # Languages
        ./modules/languages/javascript.nix
        ./modules/languages/php.nix
        ./modules/languages/go.nix
      ];
    };
  };
}
