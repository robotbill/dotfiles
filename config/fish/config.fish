fish_vi_key_bindings

# set -x EDITOR nvim
set -x EDITOR vim
set -x KITTY_CONFIG_DIRECTORY $HOME/.config/kitty

# Use a light theme for FZF preview
set -x COLORTERM truecolor
set -x BAT_THEME 'gruvbox-light'

# alias vim nvim
alias weather 'curl wttr.in/ketchikan'
alias icat 'kitty +kitten icat'

set -gx PATH $PATH $HOME/bin $HOME/.jenv/bin $HOME/.local/bin

if functions --query 'machine_specific'
    machine_specific
end

eval "$(/opt/homebrew/bin/brew shellenv)"

set -x FZF_DEFAULT_COMMAND 'rg --files'
