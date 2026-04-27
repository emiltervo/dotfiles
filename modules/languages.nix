{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    clang-tools
    cmake
    gh
    go
    jdk
    nixd
    nixfmt
    nodejs_22
    pipx
    prettier
    python3
    rustup
    shfmt
    uv
    (direnv.overrideAttrs (_: {
      doCheck = false;
    }))
  ];
}
