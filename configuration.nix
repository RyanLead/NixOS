{ config, pkgs, ... }:

  {
  	imports =
    	  [ 
      	  ./hardware-configuration.nix
      	  ./packages.nix
    	];

  	boot.loader.grub.enable = true;
  	boot.loader.grub.device = "/dev/vda";
  	boot.loader.grub.useOSProber = true;
  	boot.kernelPackages = pkgs.linuxPackages_latest;

  	networking.hostName = "nixos";

  	networking.networkmanager.enable = true;

  	time.timeZone = "Europe/London";

  	hardware.graphics = {
  	  enable = true;
  	  enable32Bit = true;
  };
	services.openssh.enable = true;
	programs.steam.enable = true;	
	programs.coolercontrol.enable = true;
        programs.nix-ld.enable = true;


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
