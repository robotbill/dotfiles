fish_vi_key_bindings

set -x EDITOR nvim
set -x KITTY_CONFIG_DIRECTORY $HOME/.config/kitty/kitty.conf

# Use a light theme for FZF preview
set -x COLORTERM truecolor
set -x BAT_THEME ansi

alias vim nvim
alias weather 'curl wttr.in/ketchikan'
alias icat 'kitty +kitten icat'

set -gx PATH $PATH $HOME/bin $HOME/.jenv/bin

if functions --query 'machine_specific'
    machine_specific
end
