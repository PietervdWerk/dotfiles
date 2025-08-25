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
      "sst/tap/opencode"  # AI coding agent, built for the terminal - https://opencode.ai/
    ];

    casks = [
      "raycast"           # Launcher & productivity - https://raycast.com/
      "orbstack"          # Efficient Docker alternative - https://orbstack.dev/
      "slack"             # Team communication - https://slack.com/
      "1password"         # Secure password maanger - https://1password.com/
      "ghostty"           # Fast, feature-rich, and cross-platform terminal emulator - https://ghostty.org/ 
      "rectangle"         # MacOS Window resizer - https://rectangleapp.com/
      "zen"               # Firefox sidebar internet browser - https://zen-browser.app/
      "scroll-reverser"   # Allow linux and windows style scrolling - https://pilotmoon.com/scrollreverser/
      "lm-studio"         # Download and run AI models - https://lmstudio.ai/
      "dataflare"         # Simple tauri based database manager - https://dataflare.app/
      "superwhisper"      # Dictation tool including LLM reformatting - https://superwhisper.com/
      "tailscale"         # Mesh VPN built on WireGuard for secure networking - https://tailscale.com/
    ];
  };
}
