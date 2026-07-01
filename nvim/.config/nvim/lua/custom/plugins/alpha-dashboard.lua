-- alpha dashboard
return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = {
    'MaximilianLloyd/ascii.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local ascii = require 'ascii'
    dashboard.section.header.val = ascii.art.text.neovim.sharp
    dashboard.section.header.opts = {
      position = 'center',
      hl = 'Type',
    }
    dashboard.section.buttons.val = {
      dashboard.button('f', '  Find File', ':Telescope find_files<CR>'),
      dashboard.button('n', '  New File', ':ene<CR>'),
      dashboard.button('r', '  Recent Files', ':Telescope oldfiles<CR>'),
      dashboard.button('s', '  Settings', ':Telescope find_files cwd=~/.config/nvim<CR>'),
      dashboard.button('q', '󰅚  Quit', ':qa<CR>'),
    }

    dashboard.section.footer.val = 'HyprVim Ready'

    alpha.setup(dashboard.config)
  end,
}
