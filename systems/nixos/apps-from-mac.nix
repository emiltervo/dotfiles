{ pkgs, lib, ... }:
{
  # Apps brought over from `systems/darwin/homebrew.nix`,
  # filtered to things that exist on NixOS/nixpkgs.
  #
  # Not brought over (macOS-only / not found in nixpkgs channel here):
  # - claude
  # - codex-app
  # - docker-desktop (use NixOS `virtualisation.docker.*` instead)
  # - karabiner-elements
  # - mas (Mac App Store)
  # - raycast

  environment.systemPackages =
    let
      # nix attribute names with hyphens can’t be referenced bare inside `with pkgs; [ ... ]`.
      codeCursor = builtins.getAttr "code-cursor" pkgs;
      bitwardenDesktop = builtins.getAttr "bitwarden-desktop" pkgs;
      googleChrome = builtins.getAttr "google-chrome" pkgs;
      signalDesktop = builtins.getAttr "signal-desktop" pkgs;
      warpTerminal = builtins.getAttr "warp-terminal" pkgs;
      zoomUs = builtins.getAttr "zoom-us" pkgs;
      dockerCompose = builtins.getAttr "docker-compose" pkgs;

      maybePkg = pkg: if lib.meta.availableOn pkgs.stdenv.hostPlatform pkg then [ pkg ] else [ ];
    in
    with pkgs;
    [
      bitwardenDesktop
      brave
      codeCursor
      discord
      googleChrome
      obsidian
      postman
      signalDesktop
      slack
      spotify
      vlc
      vscode
      warpTerminal
      zoomUs

      # Homebrew: postgresql@14
      postgresql_14

      # Docker Desktop equivalent bits:
      docker
      dockerCompose
    ]
    # `chatgpt` is darwin-only in nixpkgs on some channels; include it only when available.
    ++ (maybePkg chatgpt);

  # Docker Desktop equivalent on NixOS.
  virtualisation.docker.enable = true;

  # Lets your user run `docker` without sudo (log out/in after switching).
  users.users.lovelace.extraGroups = [ "docker" ];

  # Prefer this over just installing `steam` as a package.
  programs.steam.enable = true;
}
