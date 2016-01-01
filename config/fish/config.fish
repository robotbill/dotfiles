fish_vi_mode

set -x EDITOR nvim

function gv
    mvim $argv
end

function vim
    nvim $argv
end

set -gx PATH $PATH $HOME/bin

set -g fish_key_bindings my_key_bindings

if functions --query 'machine_specific'
    machine_specific
end
