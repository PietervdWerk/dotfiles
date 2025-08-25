{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    php
  ];

  homebrew = {
    brews = [
      "composer"
    ]; 
  };
}
