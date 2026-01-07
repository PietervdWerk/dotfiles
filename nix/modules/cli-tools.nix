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
    yazi

    dua
    fzf
    bat
    air
  ];
}
