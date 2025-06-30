# NIX

## Install

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

### Repair after macos update

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- repair
```

## Setup

```sh
nix flake init -t nix-darwin --extra-experimental-features "nix-command flakes"
```

```sh
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/nix#simple
```

Verify installation

```sh
which darwin-rebuild
```
