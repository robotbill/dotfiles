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
