# Dotfiles

This repository contains all my dotfiles for all my terminal tools configuration.

To initialize the dotfiles on a new machine use

```bash
stow .
```

## Nix-Darwin

```bash
sudo darwin-rebuild switch --flake ~/dotfiles/nix#simple
```

After which you probably need to

```bash
chsh -s /run/current-system/sw/bin/zsh
```
