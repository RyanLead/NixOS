{ config, pkgs, ...}:

{
   imports = [
     ./dotfiles/firefox/firefox.nix
     ./dotfiles/zsh/zsh.nix
     ./dotfiles/nvim/nvim.nix
   ];

   home.username = "ryan";
   home.homeDirectory = "/home/ryan";
   home.stateVersion = "26.05";
    
    programs.rofi.enable = true;
    programs.waybar.enable = true;
    services.hyprpolkitagent.enable = true;

    wayland.windowManager.hyprland = {
     enable = true;
     package = null;
     portalPackage = null;
    };
    
    xdg.configFile."hypr/hyprland.lua".source = ./dotfiles/hypr/hyprland.lua;
    
    xdg.configFile."kitty" = {
      source = ./dotfiles/kitty;
      recursive = true;

    };
    
    xdg.configFile."rofi" = {
      source = ./dotfiles/rofi;
      recursive = true;
    };

    xdg.configFile."waybar" = {
      source = ./dotfiles/waybar;
      recursive = true;
    };

    xdg.configFile."fastfetch" = {
      source = ./dotfiles/fastfetch;
      recursive = true;
    };
    
    programs.git = {
     enable = true;
     settings = {
       user.email = "ryanleadbitter@proton.me";
       user.name = "RyanLead";
       credential.helper = "store";
     };
    };

}

