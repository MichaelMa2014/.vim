export EDITOR=/opt/homebrew/bin/vim

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^U" backward-kill-line
bindkey "^W" backward-kill-word
bindkey "^[[1;3A" history-search-backward  # Option+Up
bindkey "^[[1;3B" history-search-forward   # Option+Down
bindkey "^[[1;3C" forward-word             # Option+Right
bindkey "^[[1;3D" backward-word            # Option+Left

set completion-ignore-case off
set expand-tilde on
set convert-meta off
set input-meta on
set output-meta on
set show-all-if-ambiguous on
set visible-stats on
set enable-bracketed-paste off

alias rg="rg -S"
