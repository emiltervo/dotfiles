{ ... }:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    brews = [
      "mas"
      "postgresql@14"
    ];

    casks = [
      "bitwarden"
      "brave-browser"
      "chatgpt"
      "claude"
      "codex-app"
      "cursor"
      "discord"
      "docker-desktop"
      "google-chrome"
      "karabiner-elements"
      "mullvad-vpn"
      "obsidian"
      "postman"
      "raycast"
      "slack"
      "spotify"
      "steam"
      "visual-studio-code"
      "vlc"
      "warp"
      "zoom"
      "signal"
    ];

    masApps = {
      "Pages" = 409201541;
      "Tailscale" = 1475387142;
    };
  };
}
