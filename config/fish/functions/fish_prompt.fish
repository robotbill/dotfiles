function fish_prompt
    set_color yellow
    printf '%s' (prompt_pwd)
    set_color blue
    printf '%s' (__fish_git_prompt)
    set_color green
    printf '\n❯ '
    set_color normal
end
