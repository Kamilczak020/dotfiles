local custom_everblush = require('lualine.themes.everblush')

custom_everblush.normal.a.fg = '#dadada'
custom_everblush.normal.a.bg = '#0c1418'
custom_everblush.normal.b.bg = '#0c1418'
custom_everblush.normal.c.bg = '#0c1418'

custom_everblush.insert.a.fg = '#dadada'
custom_everblush.insert.a.bg = '#0c1418'
custom_everblush.insert.b.bg = '#0c1418'

custom_everblush.visual.a.fg = '#dadada'
custom_everblush.visual.a.bg = '#0c1418'
custom_everblush.visual.b.bg = '#0c1418'

custom_everblush.replace.a.fg = '#dadada'
custom_everblush.replace.a.bg = '#0c1418'
custom_everblush.replace.b.bg = '#0c1418'

custom_everblush.command.a.fg = '#dadada'
custom_everblush.command.a.bg = '#0c1418'
custom_everblush.command.b.bg = '#0c1418'

custom_everblush.inactive.a.fg = '#dadada'
custom_everblush.inactive.a.bg = '#0c1418'
custom_everblush.inactive.b.bg = '#0c1418'
custom_everblush.inactive.c.bg = '#0c1418'

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = custom_everblush,
        component_separators = { left = ' ', right = ' '},
        section_separators = { left = ' ', right = ' '},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {'filename'},
    lualine_z = {'encoding'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
