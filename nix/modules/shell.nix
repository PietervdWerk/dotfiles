{ pkgs, ... }:

{
  # Set zsh as the default shell for the user
  users.users.pietervanderwerk = {
    name = "pietervanderwerk";
    home = "/Users/pietervanderwerk";
    shell = pkgs.zsh;
  };

  # Install shell fonts for icons
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Install shell tools
  environment.systemPackages = with pkgs; [
    oh-my-posh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };
}