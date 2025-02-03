# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================================================
# Plugins {{{
# ==========================================================================
# Load the antidote plugin manager for zsh.
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
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
  /usr/local/lib/ruby/gems/3.1.0/bin
  $HOME/.local/bin
  $HOME/.bin
  $HOME/bin
  /opt/anaconda3/bin
  $HOME/.gem/bin
  $HOME/.go/bin
  #$(brew --prefix golang/libexec)
  $HOME/.cargo/bin
  /usr/local/opt/ruby/bin
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

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
alias python="python3"
alias pip="pip3"
# }}}


# ==========================================================================
# Initialization {{{
# ==========================================================================
# Set up fuzzy searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

ZSH_TMUX_AUTOSTART='true'

# ==========================================================================
# Interactive shell startup scripts {{{
# ==========================================================================
#if [[ $- == *i* && $0 == '/bin/zsh' ]]; then
#fi
# }}}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

~/.dotfiles/scripts/login.sh
