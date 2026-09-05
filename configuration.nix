{ config, pkgs, ... }:

  {
  	imports =
    	  [
      	  ./hardware-configuration.nix
      	  ./packages.nix
    	];

  	  boot.loader.limine.enable = true;
      boot.loader.limine.secureBoot.enable = true;
      boot.loader.limine.enrollConfig = true;
      boot.loader.limine.panicOnChecksumMismatch = true;
      boot.loader.efi.canTouchEfiVariables = false;
      boot.loader.timeout = null;

      boot.kernelModules = [ "nct6775" ];
      boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];

  	programs.zsh.enable = true;

  	networking.hostName = "nixos";

  	networking.networkmanager.enable = true;

  	time.timeZone = "Europe/London";

  	hardware.graphics = {
  	  enable = true;
  	  enable32Bit = true;
  };
    
    environment.variables.AMD_VULKAN_ICD = "RADV";

    environment.systemPackages = with pkgs; [ lact ];
      systemd.packages = with pkgs; [ lact ];
      systemd.services.lactd.wantedBy = ["multi-user.target"];


	services.openssh.enable = true;
	programs.steam.enable = true;	
  programs.nix-ld.enable = true;
  programs.coolercontrol.enable = true;
  programs.gamemode.enable = true;

	services.greetd = {
   	  enable = true;
   	  settings = {
   	  default_session = {
   	  command = "${pkgs.hyprland}/bin/Hyprland";
   	  user = "ryan";
   	  };
	  };
  };

	security.rtkit.enable = true;
	services.pipewire = {
	  enable = true;
	  alsa.enable = true;
	  pulse.enable = true;
	};

  	users.users."ryan" = {
    	  isNormalUser = true;
    	  description = "ryan";
    	  extraGroups = [ "networkmanager" "wheel" ];
    	  packages = with pkgs; [];
    	  shell = pkgs.zsh;
  };

  	nixpkgs.config.allowUnfree = true;

	fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

 	programs.hyprland = {
    	  enable = true;
    	  xwayland.enable = true;
	
  };
  
  	nix.settings.experimental-features = [ "nix-command" "flakes" ];

  	system.stateVersion = "26.05";

}
