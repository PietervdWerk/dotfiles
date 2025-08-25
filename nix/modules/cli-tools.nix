{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    zinit
    lazygit
    zoxide
    direnv
    devbox

    dua
    fzf
    bat
    air
  ];
}
