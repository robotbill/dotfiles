function vi_mode_color --description 'Sets color based on the current mode'
  switch $fish_bind_mode
    case insert
      set_color 0C0
    case '*'
      set_color normal
  end
end
