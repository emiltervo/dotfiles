{ pkgs, ... }:
let
  linuxAliases = {
    codenix = "sudo code $HOME/dotfiles";
    config-nix = "cd $HOME/dotfiles";
    build-nix = "nixos-rebuild build --flake path:$HOME/dotfiles#nixos";
    switch-nix = "sudo nixos-rebuild switch --flake path:$HOME/dotfiles#nixos";
    rebuild = "sudo nixos-rebuild switch --flake path:$HOME/dotfiles#nixos";
    rs = "sudo nixos-rebuild switch --flake path:$HOME/dotfiles#nixos";
  };
in
{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = with pkgs; [
    ulauncher
  ];

  programs.bash.shellAliases = linuxAliases;
  programs.zsh.shellAliases = linuxAliases;

  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [ ];
      switch-input-source-backward = [ ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = ":minimize,maximize,close";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ulauncher/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/ulauncher" = {
      binding = "<Super>space";
      command = "${pkgs.ulauncher}/bin/ulauncher-toggle";
      name = "Ulauncher";
    };
  };

  xdg.configFile."autostart/ulauncher.desktop".source =
    "${pkgs.ulauncher}/share/applications/ulauncher.desktop";
}
