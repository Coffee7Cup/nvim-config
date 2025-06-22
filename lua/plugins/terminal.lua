return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal

    toggleterm.setup({
      size = 10,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal", -- can be 'vertical' | 'horizontal' | 'float'
      close_on_exit = true,
      shell = vim.o.shell,
    })

    local terminals = {}
    local current_index = 1

    -- Add a new terminal with Ctrl+t
    vim.keymap.set({ "n", "t" }, "<C-t>", function()
      local term = Terminal:new({
        count = current_index,
        direction = "horizontal",
        hidden = true,
      })
      term:open()
      terminals[current_index] = term
      current_index = current_index + 1
    end, { desc = "Add new terminal", noremap = true, silent = true })

    vim.keymap.set({ "n", "t" }, "<leader>tt", function()
      for _, term in pairs(terminals) do
        if term:is_open() then
          term:close()
        else
          term:open()
        end
      end
    end, { desc = "Toggle all terminals", noremap = true, silent = true })

    -- Close the current terminal with <leader>tx
    vim.keymap.set({ "n", "t" }, "<leader>tx", function()
      local buf = vim.api.nvim_get_current_buf()
      for i, term in pairs(terminals) do
        if term.bufnr == buf then
          term:close()
          terminals[i] = nil
          return
        end
      end
      vim.cmd("bd!") -- fallback close if buffer is not tracked
    end, { desc = "Close current terminal" })

    -- Seamless window navigation from terminal mode
    vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { silent = true })
    vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { silent = true })
    vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { silent = true })
    vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { silent = true })

    -- Optional: Named floating terminals for tools (lazygit, node)
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    vim.keymap.set("n", "<leader>gg", function()
      lazygit:toggle()
    end, { desc = "Toggle Lazygit (float)" })

    local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
    vim.keymap.set("n", "<leader>tn", function()
      node:toggle()
    end, { desc = "Toggle Node REPL" })
  end,
}
