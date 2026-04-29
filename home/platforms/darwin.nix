{ ... }:
{
  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "$HOME/.local/bin"
  ];

  home.file.".zprofile".text = ''
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$PATH"
  '';

  programs.zsh.shellAliases = {
    codenix = "code /private/etc/nix-darwin";
    config-nix = "cd /private/etc/nix-darwin";
    build-nix = "darwin-rebuild build --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2";
    switch-nix = "sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2";
    rebuild = "sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2";
  };
}
