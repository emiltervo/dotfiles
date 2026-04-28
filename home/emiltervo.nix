{ pkgs, ... }:
{
  imports = [
    ./vscode.nix
    ./common.nix
    ./darwin.nix
  ];

  home.stateVersion = "25.05";

  # macOS-only extras
  home.packages = with pkgs; [
    gh
    htop
  ];
}
