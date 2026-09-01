{ config, pkgs, ...}:

{
   home.username = "ryan";
   home.homeDirectory = "/home/ryan";
   home.stateVersion = "26.05";

    programs.rofi.enable = true;
    programs.firefox.enable = true;
    programs.waybar.enable = true;
    services.hyprpolkitagent.enable = true;

    wayland.windowManager.hyprland = {
     enable = true;
     package = null;
     portalPackage = null;
    };

    xdg.configFile."hypr/hyprland.lua".source = ./dotfiles/hypr/hyprland.lua;
    xdg.configFile."kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;
    
    xdg.configFile."rofi" = {
      source = ./dotfiles/rofi;
      recursive = true;
    };
    
    xdg.configFile."waybar" = {
      source = ./dotfiles/waybar;
      recursive = true;
    };
    
    xdg.configFile."nvim" = {
      source = ./dotfiles/nvim;
      recursive = true;
    };

    programs.git = {
     enable = true;
     settings = {
       user.email = "ryanleadbitter@proton.me";
       user.name = "RyanLead";
     };
    };

    programs.bash = {
     enable = true;
     enableCompletion = true;
     shellAliases = {
     btw = "echo it fucking works btw";
    };
    profileExtra = ''
     if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VNTR" = 1 ]; then
     exec hyprland
     fi
    '';
  };
}

