fish_vi_key_bindings

set -x EDITOR nvim

alias vim nvim
alias weather 'curl wttr.in/ketchikan'

set -gx PATH $PATH $HOME/bin $HOME/.jenv/bin

if functions --query 'machine_specific'
    machine_specific
end
