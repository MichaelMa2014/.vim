export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=10000
export HISTFILESIZE=10000
if [ -n "$TMUX" ]; then
    session=$(tmux display-message -p '#S')
    window=$(tmux display-message -p '#I')
    pane=$(tmux display-message -p '#P')
    new_histfile=~/.bash_history_tmux_${session}_${window}_${pane}
    if [ -n "$HISTFILE" ] && [ -f "$HISTFILE" ]; then
        cp "$HISTFILE" "$new_histfile"
    elif [ -f ~/.bash_history ]; then
        cp ~/.bash_history "$new_histfile"
    fi
    export HISTFILE="$new_histfile"
    history -r
fi
alias cdd="cd ~/Snowflake/trunk"
export CLAUDE_CODE_MAX_OUTPUT_TOKENS=40960
export SF_PRECOMMIT_AUTOFIX=true
