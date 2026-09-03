{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    ripgrep
    fd
    fzf
    nodejs
    lua-language-server
    nil
    nixpkgs-fmt
  ];

  xdg.configFile."nvim" = {
    source = ./.;
    recursive = true;
  };
}
