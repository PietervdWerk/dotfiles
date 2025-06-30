{ pkgs, ... }:


{
  # I'd rather not have telemetry on my package manager.
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  # Install homebrew - https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
  homebrew = {
    enable = true;

    # User owning the Homebrew prefix
    user = "pietervanderwerk";

    onActivation = {
      autoUpdate = true;
      # When set to "none" (the default), formulae not present in the generated Brewfile are left installed.
      cleanup = "none";
      upgrade = true;
    };

    brews = [
    ];

    casks = [
      "raycast"           # Launcher & productivity - https://raycast.com/
      "orbstack"          # Efficient Docker alternative - https://orbstack.dev/
      "slack"             # Team communication - https://slack.com/
    ];
  };
}