# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -U compinit colors vcs_info
colors
compinit

REPORTTIME=3
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt CORRECT_ALL
zstyle ':completion:*' completer _complete _correct _approximate

source ~/.zsh-autosuggestions.zsh

case $(tty) in 
    (/dev/tty[1-9]) 
        ;; 
    (*)
        source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
        ;; 
esac

source ~/.zsh-aliases
