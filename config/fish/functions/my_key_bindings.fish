function my_key_bindings
# https://github.com/fish-shell/fish-shell/issues/1495
# https://github.com/fish-shell/fish-shell/pull/1218#issuecomment-44207288

    fish_vi_key_bindings

    bind \cl 'clear; commandline -f repaint'
    bind -M insert \cl 'clear; commandline -f repaint'
    bind \cv 'edit_cmd'
    bind -M insert \cv 'edit_cmd'
end

