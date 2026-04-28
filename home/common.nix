{ pkgs, ... }:
let
  commonAliases = {
    cat = "bat";
    ls = "eza";
    ll = "eza -la";
    cleanup = "nix-collect-garbage -d";
  };
in
{
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

  programs.bash = {
    enable = true;
    shellAliases = commonAliases;
  };

  programs.zsh = {
    enable = true;
    shellAliases = commonAliases;
    initContent = ''
      eval "$(zoxide init zsh)"
    '';
  };

  home.packages = with pkgs; [
    bat
    eza
    fzf
    lazygit
    zoxide
  ];
}
