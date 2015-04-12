fish_vi_mode

set -x EDITOR nvim

function vim
    nvim $argv
end

function edit_cmd --description 'Input command in external editor'
    set -l f (mktemp /tmp/fish.cmd.XXXXXXXX)
    if test -n "$f"
        set -l p (commandline -C)
        commandline -b > $f
        nvim -c 'set ft=fish' $f
        commandline -r (more $f)
        commandline -C $p
        command rm $f
    end
end

# https://github.com/fish-shell/fish-shell/issues/1495
# https://github.com/fish-shell/fish-shell/pull/1218#issuecomment-44207288
function my_key_bindings
    fish_vi_key_bindings

    bind \cl clear force-repaint
    bind -M insert \cl clear force-repaint
    bind \cv 'edit_cmd'
    bind -M insert \cv 'edit_cmd'
end
set -g fish_key_bindings my_key_bindings

function vi_mode_color --description 'Sets color based on the current mode'
  switch $fish_bind_mode
    case insert
      set_color green
    case '*'
      set_color normal
  end
end

function fish_prompt
    set last_status $status
    set_color red
    printf '%s' (hostname|cut -d . -f 1)
    set_color green
    printf ' [%s]' (prompt_pwd)
    set_color blue
    printf '%s' (__fish_git_prompt)
    vi_mode_color
    printf '\n❯ '
    set_color normal
end
