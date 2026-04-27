# nix-darwin setup

This repository is the machine definition for `Emils-MacBook-Pro-2`.

## Structure

- `flake.nix`: flake inputs and host definitions
- `hosts/Emils-MacBook-Pro-2`: machine-specific settings
- `modules/base.nix`: shared macOS and Nix defaults
- `modules/languages.nix`: explicit language toolchains and formatters
- `modules/packages.nix`: system packages installed with Nix
- `modules/homebrew.nix`: Homebrew formulae, casks, and App Store apps
- `home/emiltervo.nix`: user shell, git, and home-level packages via Home Manager
- `MIGRATION.md`: inventory of apps found during the cleanup pass

## What goes where

- Put CLI tools in `modules/packages.nix` or `home/emiltervo.nix`
- Put GUI apps from Homebrew in `modules/homebrew.nix`
- Put App Store apps in `modules/homebrew.nix` under `masApps`
- Put macOS defaults and system-wide behavior in `modules/base.nix`

## First activation

Build and switch to this configuration with:

```sh
sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2
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
