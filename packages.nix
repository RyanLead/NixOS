{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
neovim
vim
wget
kitty
git
discord
gcc
waybar
fastfetch
protonup-qt

];

}
