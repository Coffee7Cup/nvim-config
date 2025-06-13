return {
  -- Plugin repo and branch
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  -- Required dependencies for Neo-tree
  dependencies = {
    "nvim-lua/plenary.nvim",     -- Utility functions
    "nvim-tree/nvim-web-devicons", -- File icons (optional but recommended)
    "MunifTanjim/nui.nvim",      -- UI library used by Neo-tree
  },

  -- Plugin configuration function
  config = function()
    -- Neo-tree configuration with hidden files enabled
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false, -- Show hidden files (starting with ".")
          hide_gitignored = false, -- Show gitignored files
          never_show = {      -- Always hide these files
            ".DS_Store",
            "thumbs.db",
            "node_modules",
          },
        },
        follow_current_file = {
          enabled = true,          -- Auto-focus on current file
        },
        use_libuv_file_watcher = true, -- Better file watching
      },
      window = {
        mappings = {
          ["<leader>h"] = "toggle_hidden", -- Add shortcut to toggle hidden files
        },
      },
    })

    -- Smart toggle/focus keymap for <leader><Tab>
    vim.keymap.set("n", "<leader><Tab>", function()
      local neotree_win = nil

      -- Loop through all open windows to find if Neo-tree is already open
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
        -- Check if buffer name matches Neo-tree pattern
        if bufname:match("neo%-tree") then
          neotree_win = win
          break
        end
      end

      if neotree_win then
        -- If Neo-tree window is focused, close it
        if neotree_win == vim.api.nvim_get_current_win() then
          vim.cmd("Neotree close")
        else
          -- If Neo-tree is open but not focused, focus it
          vim.api.nvim_set_current_win(neotree_win)
        end
      else
        -- If Neo-tree isn't open, toggle it open
        vim.cmd("Neotree toggle")
      end
    end, { desc = "Smart Neo-tree Toggle/Focus" })

    -- Additional keymap to toggle hidden files specifically
    vim.keymap.set("n", "<leader>.", function()
      vim.cmd("Neotree toggle show_hidden=true")
    end, { desc = "Toggle Neo-tree with hidden files" })
  end,

  -- Ensure the plugin loads immediately at startup
  lazy = false,
}
