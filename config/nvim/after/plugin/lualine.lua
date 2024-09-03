local colors = {
  black        = '#000000',
  white        = '#fffaf1',
  red          = '#9b0901',
  green        = '#118800',
  blue         = '#2360ee',
  yellow       = '#b16404',
  gray         = '#e9e4da',
  darkgray     = '#4c422f',
  inactivegray = '#e9e4da',
}
jml_theme = {
  normal = {
    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
    b = {bg = colors.darkgray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.black}
  },
  insert = {
    a = {bg = colors.blue, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.yellow, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.green, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.gray, fg = colors.white, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.white},
    c = {bg = colors.gray, fg = colors.white}
  }
}
require('lualine').setup {
  options = {
    theme = jml_theme,
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
