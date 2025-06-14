{ config, pkgs, osConfig, lib, ... }:

{
  home.username = "kahasta";
  home.homeDirectory = "/home/kahasta";
  home.stateVersion = "25.05";


  imports = [
    ./nvim/nvim.nix
    ./yazi/yazi.nix
    ./niri/niri.nix
    ./kitty/kitty.nix
    ./zsh/zsh.nix
    ./waybar/waybar.nix
    ./myemacs/myemacs.nix
    # ./doomemacs/doomemacs.nix
  ];

  home.packages = with pkgs; [
    git
    cmake
    gcc
    ninja
    rPackages.pkgconfig
    gnumake
    zlib
    libtool
    libvterm
    ripgrep
    fd
    htop
    telegram-desktop
    xfce.thunar
    nekoray
    blueman
    xwayland-satellite
    kitty
    python3Full
    nixfmt-classic
  ];


  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "kahasta";
    userEmail = "kahastacold@gmail.com";
  };
  xdg.enable = true;


  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
  };
}


