return{
  'akinsho/bufferline.nvim', 
  version = "*",
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = function()
    require("bufferline").setup{
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = "bdelete %d",
        right_mouse_command = "bdelete %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
        vim.keymap.set('n','<Tab>', '<Cmd>BufferLineCycleNext<CR>', {silent = true, noremap = true}),
        vim.keymap.set("n", "<S-Tab>", ":bdelete<CR>", { desc = "Delete current buffer" })
      }
    }
  end
}
