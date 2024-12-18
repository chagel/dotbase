if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-login
    # Commands to run in login sessions can go here
end

fish_add_path $HOME/Dotmac/scripts
fish_add_path $HOME/.local/bin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/Caskroom/miniconda/base/bin

source $HOME/.config/fish/aliases.fish

set -gx EDITOR vim
set -gx GPG_TTY (tty)
set -gx OPENAI_API_KEY (pass show keys/openai_api_key)

set -U nvm_default_version lts/iron
set -U fish_greeting ""
