# nix-darwin + NixOS setup

This repository contains:
- macOS (nix-darwin) config for `Emils-MacBook-Pro-2`
- NixOS config layered on top of the machine’s existing `/etc/nixos/configuration.nix`

## Structure

- `flake.nix`: flake inputs and host definitions
- `hosts/<name>`: machine-specific host entrypoints and hardware files
- `systems/darwin`: darwin system modules grouped by concern
- `systems/nixos`: NixOS-only system modules grouped by concern
- `home/common`: shared Home Manager modules split by feature
- `home/platforms`: platform-specific Home Manager modules
- `home/programs`: program-specific Home Manager modules
- `home/users`: per-user Home Manager entrypoints
- `MIGRATION.md`: inventory of apps found during the cleanup pass

## What goes where

- Put darwin system defaults in `systems/darwin/base.nix`
- Put darwin package sets in `systems/darwin/packages.nix` and `systems/darwin/languages.nix`
- Put Homebrew formulae, casks, and App Store apps in `systems/darwin/homebrew.nix`
- Put Linux GUI apps and related NixOS service toggles in `systems/nixos/apps-from-mac.nix`
- Put shared shell, git, and package config in `home/common/`
- Put per-platform Home Manager behavior in `home/platforms/`
- Keep `hosts/` thin and host-specific

## First activation

### macOS

```sh
sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2
```

### NixOS

```sh
sudo nixos-rebuild switch --flake path:/home/lovelace/dotfiles#nixos
```

## Suggested cleanup path

1. Move CLI tools from ad hoc installs into Nix packages.
2. Move GUI apps into `homebrew.casks` or `masApps`.
3. Remove tools from manual Homebrew installs once they are declared here.
4. Commit this directory to GitHub once secrets and machine-only values are reviewed.

## Notes

- `masApps` requires you to be signed in to the Mac App Store.
- Some applications are still better managed outside Nix if they are highly stateful or vendor-specific.
- Keep secrets out of this repository unless you add a proper secret management solution.
