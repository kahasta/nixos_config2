{ pkgs, ... }:

{
  home.packages = with pkgs; [
    android-studio
    cmake
    flutter
    ninja
    pkg-config
  ];



}
