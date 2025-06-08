return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function()
    -- load the tokyonight colorscheme first
      vim.cmd.colorscheme("tokyonight")

    -- then set lualine to use that theme
      require('lualine').setup {
      options = {
        theme = 'tokyonight',
        icons_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = '|',
      }
    }
  end,
}
