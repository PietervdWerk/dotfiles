{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    vscode
    spotify
  ];
}
