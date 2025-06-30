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
      # List packages installed in system profile.
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.zinit
        ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      security.pam.services.sudo_local.enable = false;

      # Enable alternative shell support in nix-darwin.
      programs.zsh.enable = true;

      # Set zsh as the default shell for the user
      users.users.pietervanderwerk = {
        name = "pietervanderwerk";
        home = "/Users/pietervanderwerk";
        shell = pkgs.zsh;
      };

      # Make sure Nix-installed binaries are in your PATH for Zinit
      environment.pathsInUserProfile = [
        "/Users/pietervanderwerk/.nix-profile/bin"
      ];

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."simple" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
