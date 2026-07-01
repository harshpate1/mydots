return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    filetypes = { '*' }, -- highlight all filetypes
    user_default_options = {
      RGB = true,
      RRGGBB = true,
      names = true,
      RRGGBBAA = false,
      AARRGGBB = false,

      css = true, -- enable css features
      css_fn = true, -- rgb(), hsl(), etc

      tailwind = 'both', -- useful if you ever use tailwind
      mode = 'background', -- background color highlight
      always_update = false,
    },
  },
}
