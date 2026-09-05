{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      btw = "echo it fucking works btw";
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      spotify = "spotify_player";
    };

    initContent = ''
      autoload -Uz compinit
      if [[ -n ''${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
        compinit
      else
        compinit -C
      fi

      fastfetch

      # Shift+Left / Shift+Right jump by word
      bindkey '^[[1;2D' backward-word
      bindkey '^[[1;2C' forward-word
    '';

    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VNTR" = 1 ]; then
        exec hyprland
      fi
    '';
  };
}
