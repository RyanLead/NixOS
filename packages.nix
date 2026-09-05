{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
  # base
  wget
  git
  gcc


  # desktop
  kitty
  waybar
  adwaita-icon-theme
  awww


  # gaming
  protonup-qt
  prismlauncher
  gamemode
  gamescope

  # utilities
  fastfetch
  claude-code
  discord-ptb
  lm_sensors
  liquidctl
  lact
  spotify-player
];

}
