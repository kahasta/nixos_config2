{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
	niri
 	mako
	fuzzel
	waybar
	swaybg
];

  services = {
	polkit-gnome.enable = true;
	mako.enable = true;
  };
 # programs.niriswitcher.settings = (builtins.readFile ./dotfiles/niri/config.kdl);
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
 #   home.file.".config/niri/config.kdl".source = ./config.kdl;
} 
