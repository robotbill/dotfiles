fish_vi_key_bindings

set -x EDITOR nvim

set -x KITTY_CONFIG_DIRECTORY $HOME/.config/kitty/kitty.conf

alias vim nvim
alias weather 'curl wttr.in/ketchikan'
alias icat 'kitty +kitten icat'

set -gx PATH $PATH $HOME/bin $HOME/.jenv/bin

if functions --query 'machine_specific'
    machine_specific
end
