fish_vi_key_bindings

set -x EDITOR nvim

function gv
    mvim $argv
end

function vim
    nvim $argv
end

#function grep
#    ggrep $argv
#end

function weather
    curl wttr.in/pdx
end

set -gx PATH $PATH $HOME/bin $HOME/.jenv/bin

if functions --query 'machine_specific'
    machine_specific
end
