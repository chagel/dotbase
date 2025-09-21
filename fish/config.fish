if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    # Commands to run in login sessions can go here
end

source $HOME/.config/fish/aliases.fish
source $HOME/.config/fish/user.fish
mise activate fish | source

if set -q TMUX
  set -e GEM_HOME
end

set -gx EDITOR nvim
set -gx GPG_TTY (tty)

set -U fish_greeting ""
