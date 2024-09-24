eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR=/usr/local/bin/vim
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

set completion-ignore-case off
set expand-tilde off
set convert-meta off
set input-meta on
set output-meta on
set show-all-if-ambiguous on
set visible-stats on
set enable-bracketed-paste off

alias rg="rg -S"
alias ls="gls --color=auto"
