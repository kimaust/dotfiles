# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# source /home/k/Documents/simplerich-zsh-theme/zsh-git-prompt/zshrc.sh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?

# ZSH_CUSTOM=/path/to/new-custom-folder


# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# export MANPATH="/usr/local/man:$MANPATH"

# Antigen plugin manager
source "$HOME/antigen.zsh"

# Load the oh-my-zsh library for some bundles
antigen use oh-my-zsh

antigen bundle gitfast
antigen bundle command-not-found

# ZSH syntax highlighting bundle. It must be last.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply


# Enable command autocompletion
autoload -Uz compinit
compinit
# Enable cache for the completions
zstyle ':completion::complete:*' use-cache 1
# Tune completion styles
#zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Enable prompt theme system
autoload -Uz promptinit
promptinit

# Set history size and file
export HISTSIZE=1000
export HISTFILE="$HOME/.history"

# Auto cd to directory without cd
setopt autocd

# Classic rousell
prompt_mytheme_setup() {
    PS1="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%} "
}

prompt_themes+=( mytheme )
prompt mytheme

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export WINDOWS_USERNAME="k"

# Miscellaenous
# Disables folder highlight in WSL.
export LS_COLORS=$LS_COLORS:'ow=1;34:';
alias ls="ls -la --color"

# Vim settings
alias vi=nvim
alias vim=nvim
export XDG_CONFIG_HOME="$HOME/dotfiles"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Komorebi
alias komorebi="C:/Program\ Files/komorebi/bin/komorebic.exe start --whkd --config $HOME/dotfiles/komorebi/komorebi.json"
alias komorebiwsl="/mnt/c/Program\ Files/komorebi/bin/komorebic.exe start --whkd --config $HOME/dotfiles/komorebi/komorebi.json"


# Git
# Autocomplete only the name of branches and files locally.
__git_files () {
    _wanted files expl 'local files' _files
}
# Disable checkout completion of remote branches.
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1
# Disable checkout completion of remote branches for zsh.
zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# nnn
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"

        return
    }


    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)

    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn

    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias

    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

# Immersive
source $HOME/immersive.zsh > /dev/null 2>&1

alias git="C:/Program\ Files/Git/bin/git.exe"
alias emerge="emerge --ask --verbose"
# alias repeat="$HOME/dotfiles/windows/keyrate-tool/run.sh"
repeatrate() {
  (
      cd "$HOME/dotfiles/windows/keyrate-tool" || { echo "Error: Directory $HOME/def does not exist."; return 1; }
    ./run.sh "$@"
    )
}
alias oe="explorer.exe ."

# fzf
# FZF_DEFAULT_COMMAND="zsh"
# Set up fzf key bindings and fuzzy completion
export FZF_CTRL_T_COMMAND=""
export FZF_ALT_C_COMMAND=""
export FZF_DEFAULT_COMMAND="fd | cygpath -u -f -"
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1" | cygpath -u -f -
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1" | cygpath -u -f -
}
eval "$(fzf --zsh)"
# fzf on Windows
# function fzf() {
# 	cygpath -u $(command fzf)
# }

# Pip-related settings
alias pip="python -m pip"
# Since setuptools>=60.0.0 setuptools "includes a local, vendored copy of 
# distutils". Therefore the MSYS2 patched version of standard libary distutils 
# is not used unless you make it
export SETUPTOOLS_USE_DISTUTILS=stdlib

# 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# tmux
#
# TODO: 
# script -c tmux /dev/null
alias tmux_start="script -c 'tmux -u -T RGB' -qO /dev/null"
# tmux () {
#     TMUX="command tmux ${@}"
#     script -qO /dev/null -c "eval $TMUX";
# }
#
# test
