{ ... }:
let
  commonAliases = {
    cat = "bat";
    ls = "eza";
    ll = "eza -la";
    cleanup = "nix-collect-garbage -d";
  };
in
{
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
}
