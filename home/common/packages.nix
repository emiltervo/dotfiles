{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    eza
    fzf
    gh
    lazygit
    zoxide
  ];
}
