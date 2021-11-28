function fish_prompt --on-variable fish_bind_mode
    set_color yellow
    printf '%s' (prompt_pwd)
    set_color blue
    printf '%s' (__fish_git_prompt)
    set_color green
    printf '❯ '
    set_color normal
end
