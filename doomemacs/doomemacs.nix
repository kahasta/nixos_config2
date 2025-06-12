{ config, ... }:
{

  environment.etc."xdg/applications/emacs-doom.desktop".text = ''
    [Desktop Entry]
    Name=Emacs Doom
    Exec=emacs --user-emacs-directory=/home/kahasta/doomemacs
    Icon=emacs
    Type=Application
    Categories=Development;TextEditor;
  '';

    environment.pathsToLink."/home/kahasta/.local/bin".source = /home/kahasta/doomemacs/bin/doom;
}
