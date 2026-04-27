{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    codex
    curl
    eza
    fd
    ffmpeg
    fzf
    git
    graphviz
    htop
    jq
    lazygit
    ripgrep
    sysbench
    tree
    vim
    wget
    zoxide
  ];
}
