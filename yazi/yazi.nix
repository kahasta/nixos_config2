{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs;[
    ffmpeg
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    imagemagick
    wl-clipboard
  ];
  programs.zsh.initContent = ''
    function y() {
    	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    	yazi "$@" --cwd-file="$tmp"
    	IFS= read -r -d \'\' cwd < "$tmp"
    	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    	rm -f -- "$tmp"
    }
  '';
  programs.yazi = {
    enableZshIntegration = true;
    enable = true;

  };
  xdg.configFile."yazi/yazi.toml".text = ''
    [opener]
    edit = [
    	{ run = '/etc/profiles/per-user/kahasta/bin/lvim "$@"', block = true, for = "unix" },
    ]
  '';
}
