# nix-darwin + NixOS setup

This repository contains:
- macOS (nix-darwin) config for `Emils-MacBook-Pro-2`
- NixOS config layered on top of the machine’s existing `/etc/nixos/configuration.nix`

## Structure

- `flake.nix`: flake inputs and host definitions
- `hosts/Emils-MacBook-Pro-2`: machine-specific settings
- `hosts/rapidash`: NixOS flake host (full NixOS config lives in this repo)
- `modules/base.nix`: shared macOS and Nix defaults
- `modules/languages.nix`: explicit language toolchains and formatters
- `modules/packages.nix`: system packages installed with Nix
- `modules/homebrew.nix`: Homebrew formulae, casks, and App Store apps
- `modules/nixos/apps-from-mac.nix`: Linux-available equivalents of macOS GUI apps + Docker/Steam toggles
- `home/emiltervo.nix`: user shell, git, and home-level packages via Home Manager
- `home/common.nix`: cross-platform Home Manager settings
- `home/darwin.nix`: macOS-only Home Manager settings
- `home/linux.nix`: Linux-only Home Manager settings
- `home/lovelace.nix`: NixOS user Home Manager entrypoint
- `MIGRATION.md`: inventory of apps found during the cleanup pass

## What goes where

- Put CLI tools in `modules/packages.nix` or `home/emiltervo.nix`
- Put GUI apps from Homebrew in `modules/homebrew.nix`
- Put App Store apps in `modules/homebrew.nix` under `masApps`
- Put macOS defaults and system-wide behavior in `modules/base.nix`
- Put Linux GUI apps / NixOS services in `modules/nixos/apps-from-mac.nix`
- Put cross-platform shell/git config in `home/common.nix`

## First activation

### macOS

```sh
sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2
```

### NixOS

```sh
sudo nixos-rebuild switch --flake path:/home/lovelace/dotfiles#rapidash
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
