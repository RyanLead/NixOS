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

  # utilities
  fastfetch
  claude-code
  discord-ptb
];

}
