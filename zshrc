# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================================================
# Plugins {{{
# ==========================================================================
# Load the Antibody plugin manager for zsh.
source <(antibody init)

# Setup required env var for oh-my-zsh plugins
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

antibody bundle robbyrussell/oh-my-zsh
antibody bundle robbyrussell/oh-my-zsh path:plugins/macos
antibody bundle robbyrussell/oh-my-zsh path:plugins/tmux
antibody bundle robbyrussell/oh-my-zsh path:plugins/tmuxinator
antibody bundle robbyrussell/oh-my-zsh path:plugins/autojump
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/git-extras
antibody bundle robbyrussell/oh-my-zsh path:plugins/npm
antibody bundle robbyrussell/oh-my-zsh path:plugins/node
antibody bundle robbyrussell/oh-my-zsh path:plugins/ssh-agent
antibody bundle robbyrussell/oh-my-zsh path:plugins/jump
antibody bundle robbyrussell/oh-my-zsh path:plugins/jsontools
antibody bundle robbyrussell/oh-my-zsh path:plugins/httpie
antibody bundle robbyrussell/oh-my-zsh path:plugins/docker
antibody bundle robbyrussell/oh-my-zsh path:plugins/docker-compose
antibody bundle robbyrussell/oh-my-zsh path:plugins/cp

# This needs to be the last bundle.
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions

# Load the theme
antibody bundle dracula/zsh
antibody bundle romkatv/powerlevel10k
# }}}


# ==========================================================================
# Configuration {{{
# ==========================================================================
bindkey -v
export GIT_EDITOR=nvim

#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='awesome-patched'
DEFAULT_USER=`whoami`
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

path=(
  /usr/local/bin
  $HOME/.local/bin
  $HOME/.bin
  $HOME/bin
  /opt/anaconda3/bin
  $HOME/.gem/bin
  $HOME/.go/bin
  #$(brew --prefix golang/libexec)
  $HOME/.cargo/bin
  $path
  )

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
  'local-directories named-directories'

export EDITOR='nvim'
export NVIM_LISTEN_ADDRESS='/tmp/nvimsocket'
export FZF_DEFAULT_COMMAND='ag -u -g ""'

unsetopt sharehistory
# }}}


# ==========================================================================
# Aliases & Functions {{{
# ==========================================================================
alias vim="nvim"
alias mux="tmuxinator"
alias copy="xclip -selection clipboard"
alias paste="xclip -o -selection clipboard"
alias cat="bat"
# }}}


# ==========================================================================
# Initialization {{{
# ==========================================================================
# Set up fuzzy searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# }}}

ZSH_TMUX_AUTOSTART='true'

# ==========================================================================
# Interactive shell startup scripts {{{
# ==========================================================================
if [[ $- == *i* && $0 == '/bin/zsh' ]]; then
  ~/.dotfiles/scripts/login.sh
fi
# }}}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
