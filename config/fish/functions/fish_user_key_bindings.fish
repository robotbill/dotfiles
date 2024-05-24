function fish_user_key_bindings
    bind \cl 'clear; commandline -f repaint'
    bind -M insert \cl 'clear; commandline -f repaint'
end


fzf --fish | source
