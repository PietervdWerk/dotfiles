{ pkgs, ...}:

{
  # Enable Touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      show-process-indicators = true;
    };
  };
}