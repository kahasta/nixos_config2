{ config, pkgs,  ... }:

{
  home.packages = with pkgs; [
  emacs	
	jetbrains-mono
  tabnine
  ];

  # programs.emacs.enable = true;
  home.file.".emacs.d".source = ./my-emacs.d;
}
