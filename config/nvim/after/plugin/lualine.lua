require('lualine').setup {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = { { 'filename', path = 1, shorting_target = 80 } },
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1, shorting_target = 80 } },
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  }
}
