# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zinit directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if its not there
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
#zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
#zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit
zinit cdreplay -q


export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
export LS_COLORS=$(vivid generate dracula)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

prompt_cr=true

# Keybindings
#bindkey '^F' autosuggest-accept
bindkey -e
bindkey '^F' forward-word
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
# Search fzf ^R
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Cargo
export PATH="/home/kahasta/.cargo/bin:$PATH"

# spoof-dpi
export PATH=$PATH:~/.spoof-dpi/bin

# Vcpkg
export VCPKG_ROOT=~/vcpkg
export PATH=$VCPKG_ROOT:$PATH


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# NNN
export NNN_PLUG='p:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo nnn
export PAGER="less -R"
source $HOME/.local/zsh/quitcd.zsh

# Qlot
export PATH="/home/kahasta/.qlot/bin:$PATH"

# Babashka
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb

export EDITOR=nvim
export VISUAL=$EDITOR

alias vi="nvim"
alias vim="nvim"
alias e="emacs --init-directory=~/.my-emacs.d/ -nw"
alias ls="lsd"
alias docker="podman"
alias ll="lsd -ll"
alias la="lsd -la"
alias sudoe="sudo -E"
alias cat="bat"
alias catp="bat --plain"
alias cd="z"
# alias du="dust"
alias df="duf"
alias ping="gping"
alias doom="~/.config/emacs/bin/doom"
alias nnn="nnn -Pp"

# opam configuration
[[ ! -r /home/kahasta/.opam/opam-init/init.zsh ]] || source /home/kahasta/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
