{ config, pkgs, ... }:

{
 home.packages = with pkgs; [
	waybar
	pavucontrol
	lm_sensors
	font-awesome
 ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
 xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
 xdg.configFile."waybar/style.css".source = ./style.css;

}
