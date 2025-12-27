if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx SUDO_EDITOR nvim
set -gx VISUAL nvim
set -gx EDITOR nvim

~/.local/bin/mise activate fish | source
zoxide init fish | source
