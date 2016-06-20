function fish_user_key_bindings
    bind \cl 'clear; commandline -f repaint'
    bind -M insert \cl 'clear; commandline -f repaint'
    bind \cv 'edit_cmd'
    bind -M insert \cv 'edit_cmd'
end

