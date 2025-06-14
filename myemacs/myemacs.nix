{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    jetbrains-mono
    emacsPackages.tabnine
    nixpkgs-fmt
    nil
  ];

  # programs.emacs.enable = true;
  home.file.".emacs.d".source = ./my-emacs.d;
}
