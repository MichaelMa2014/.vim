#!/usr/bin/env bash
# Fallback restore on first server start: continuum_restore.sh only waits 1s,
# which can lose the race when TPM is still loading plugins.

sleep 8

[[ -f "${HOME}/tmux_no_auto_restore" ]] && exit 0
[[ "$(tmux show-option -gqv @continuum-restore 2>/dev/null)" != "on" ]] && exit 0

restore_path="$(tmux show-option -gqv @resurrect-restore-script-path 2>/dev/null)"
[[ -z "${restore_path}" || ! -x "${restore_path}" ]] && exit 0

last_file="${HOME}/.tmux/resurrect/last"
[[ -e "${last_file}" ]] || exit 0

# Continuum restore already succeeded if we have more than the default single pane.
pane_count="$(tmux list-panes -a 2>/dev/null | wc -l | tr -d ' ')"
[[ "${pane_count}" -gt 1 ]] && exit 0

"${restore_path}"
