return {
  'RedsXDD/neopywal.nvim',
  name = 'neopywal',
  lazy = false,
  priority = 1000,
  opts = {
    use_wallust = true,
    transparent_background = false,
    plugins = {
      alpha = true,
      lazy = true,
      blink_cmp = true,
      gitsigns = true,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
        scope_color = '',
      },
      mason = true,
      lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'bold', 'italic' },
          hints = { 'bold', 'italic' },
          information = { 'bold', 'italic' },
          ok = { 'bold', 'italic' },
          warnings = { 'bold', 'italic' },
          unnecessary = { 'bold', 'italic' },
        },
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          information = { 'undercurl' },
          ok = { 'undercurl' },
          warnings = { 'undercurl' },
        },
        inlay_hints = {
          background = true,
          style = { 'bold', 'italic' },
        },
      },
      nvimtree = true,
      treesitter = true,
      telescope = {
        enabled = true,
        -- style = "nvchad",
      },
      which_key = true,
    },
  },
}
