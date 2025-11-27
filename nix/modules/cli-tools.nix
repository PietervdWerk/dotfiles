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
    go-task

    dua
    fzf
    bat
    air
  ];
}
