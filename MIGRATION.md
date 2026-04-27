# Migration Inventory

This file captures what was found on the machine during the initial cleanup pass.

## Declared in Nix now

- CLI packages are split between `modules/packages.nix` and `modules/homebrew.nix`.
- GUI applications with obvious Homebrew casks were added to `modules/homebrew.nix`.
- A few App Store applications were added to `masApps`.

## Apps detected in `/Applications` but not declared yet

These need manual review because they may be vendor installers, niche apps, or not worth codifying:

- `Antigravity.app`
- `ComfyUI.app`
- `CurseForge.app`
- `GarageBand.app`
- `Ghostery Privacy Ad Blocker.app`
- `IntelliJ IDEA.app`
- `Jellyfin.app`
- `Jellyfin Media Player.app`
- `Little Snitch Mini.app`
- `LlamaBarn.app`
- `MAMP PRO.app`
- `Microsoft Teams.app`
- `PerformanceTest.app`
- `Riot Client.app`
- `Svenska Spel Poker.app`
- `UHF.app`
- `Wappalyzer - Technology profiler.app`
- `Webull Desktop.app`

## Next cleanup step

After `darwin-rebuild switch`, remove overlapping manual installs one category at a time:

1. Homebrew CLI tools that are now managed by Nix.
2. GUI apps that are now managed as casks.
3. App Store apps that are now managed through `masApps`.

Do not remove manual installs until the declarative install path has been tested.
