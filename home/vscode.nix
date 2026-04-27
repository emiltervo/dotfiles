{ ... }:
{
  programs.vscode = {
    enable = true;
    package = null;
    pname = "vscode";

    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;

      userSettings = {
        "editor.fontLigatures" = true;
        "editor.formatOnSave" = true;
        "editor.inlineSuggest.enabled" = true;
        "editor.minimap.enabled" = false;
        "files.trimTrailingWhitespace" = true;
        "git.confirmSync" = false;
        "telemetry.telemetryLevel" = "off";
        "terminal.integrated.defaultProfile.osx" = "zsh";
        "terminal.integrated.profiles.osx" = {
          zsh = {
            path = "/run/current-system/sw/bin/zsh";
            args = [ "-i" ];
          };
        };
        "workbench.startupEditor" = "none";
      };

      extensions = [
        # Add packaged extensions here for reproducible installs across machines.
        #
        # Current local extension IDs observed on this Mac:
        # - beanarch.mdx07-templates
        # - dan-c-underwood.arm
        # - eclipse-cdt.peripheral-inspector
        # - formulahendry.code-runner
        # - github.copilot-chat
        # - marus25.cortex-debug
        # - mcu-debug.debug-tracker-vscode
        # - mcu-debug.memory-view
        # - mcu-debug.peripheral-viewer
        # - mcu-debug.rtos-views
        # - ms-azuretools.vscode-containers
        # - ms-azuretools.vscode-docker
        # - ms-python.debugpy
        # - ms-python.python
        # - ms-python.vscode-pylance
        # - ms-toolsai.jupyter
        # - ms-toolsai.jupyter-keymap
        # - ms-toolsai.jupyter-renderers
        # - ms-toolsai.vscode-jupyter-cell-tags
        # - ms-toolsai.vscode-jupyter-slideshow
        # - ms-vscode-remote.remote-containers
        # - ms-vscode-remote.remote-ssh
        # - ms-vscode-remote.remote-ssh-edit
        # - ms-vscode.cmake-tools
        # - ms-vscode.cpp-devtools
        # - ms-vscode.cpptools
        # - ms-vscode.cpptools-extension-pack
        # - ms-vscode.cpptools-themes
        # - ms-vscode.live-server
        # - ms-vscode.remote-explorer
        # - ms-vscode.vscode-serial-monitor
        # - ms-vsliveshare.vsliveshare
        # - rust-lang.rust-analyzer
        # - twxs.cmake
        # - usernamehw.errorlens
        # - webfreak.debug
        # - xaver.clang-format
        # - zhwu95.riscv
      ];
    };
  };
}
