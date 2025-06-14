return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function()
    -- load the tokyonight colorscheme first
      -- vim.cmd.colorscheme("tokyonight")
      vim.cmd.colorscheme("gruvbox")

    -- then set lualine to use that theme
      require('lualine').setup {
      options = {
        -- theme = 'tokyonight',
        theme = 'gruvbox',
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = '|',
      }
    }
  end,
}
