{ pkgs, programs, lib, ...}:
{
 home.packages = with pkgs; [
    curl
    wget
    git
    cargo
    unzip
    gnutar
    gzip
    lunarvim
  ];


programs.zsh.shellAliases = {
  vi = lib.mkForce "lvim";
  vim = lib.mkForce "lvim";
  nvim = lib.mkForce "lvim";
};
  # home.file."./.config/nvim/" = {
  #   source = ./nvim;
  #   recursive = true;
  # };
}
