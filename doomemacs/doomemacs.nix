{ config, inputs, ... }:
{

# xdg.desktopEntries = {
# doomEmacs = {
#   name="Emacs doom";
#   genericName="Emacs Doom";
#   exec="bash -c /home/kahasta/nix-doom-emacs-unstraightened/doom_start"; 
#   terminal=false;
# };

programs.doom-emacs = {
  enable = true;
  doomDir = inputs.doom-config;
};

}
