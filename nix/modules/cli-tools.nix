{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    zinit

    fzf
    bat
  ];
}