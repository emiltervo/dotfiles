{ pkgs, ... }:
{
  imports = [
    ./vscode.nix
  ];

  home.stateVersion = "25.05";

  home.sessionPath = [
    "/opt/homebrew/bin"
    "/opt/homebrew/sbin"
    "$HOME/.local/bin"
  ];

  home.file.".zprofile".text = ''
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.local/bin:$PATH"
  '';

  home.packages = with pkgs; [
    htop
    fzf
    gh
    lazygit
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.zsh = {
    enable = true;

    shellAliases = {
      cat = "bat";
      codenix = "code /private/etc/nix-darwin";
      config-nix = "cd /private/etc/nix-darwin";
      build-nix = "darwin-rebuild build --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2";
      switch-nix = "sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2";
      ls = "eza";
      ll = "eza -la";
      rebuild = "sudo darwin-rebuild switch --flake /private/etc/nix-darwin#Emils-MacBook-Pro-2";
      cleanup = "nix-collect-garbage -d";
    };

    initContent = ''
      eval "$(zoxide init zsh)"
    '';
  };
}
