# NIX darwin setup

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
