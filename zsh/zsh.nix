{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    lsd
    bat
    fzf
    duf
    gping
    nnn
    carapace
    zsh-syntax-highlighting
  ];

  programs.carapace = {
    enable = true;
  };

  programs.fzf.enableZshIntegration = true;

  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;
    initContent = ''
      eval "$(zoxide init zsh)"
      export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
      zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
      source <(carapace _carapace)
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
      [ -f ${pkgs.fzf}/share/fzf/key-bindings.zsh ] && source ${pkgs.fzf}/share/fzf/key-bindings.zsh
      [ -f ${pkgs.fzf}/share/fzf/completion.zsh ] && source ${pkgs.fzf}/share/fzf/completion.zsh
    '';
    # With Oh-My-Zsh:
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git" # also requires `programs.git.enable = true;`
        # "zsh-syntax-highlighting"
        # "fzf-tab"
      ];
      theme = "af-magic";
    };


    # enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "lsd -ll";
      la = "lsd -la";
      cd = "z";
      ls = "lsd";
      vi = "nvim";
      vim = "nvim";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [ "rm *" "pkill *" "cp *" ];
  };

  #home.file.".zshrc".source = ./.zshrc;
}
