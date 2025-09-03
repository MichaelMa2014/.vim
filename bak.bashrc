
export HISTSIZE=10000
export HISTFILESIZE=10000
if [ -n "$TMUX" ]; then
    session=$(tmux display-message -p '#S')
    window=$(tmux display-message -p '#I')
    pane=$(tmux display-message -p '#P')
    export HISTFILE=~/.bash_history_tmux_${session}_${window}_${pane}
fi
