return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter", -- Lazy-load on insert mode
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",        -- Accept suggestion
          accept_word = false,     -- disable word-level keymap
          accept_line = false,     -- disable line-level keymap
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          open = "<M-CR>",
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
        },
      },
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = true,
        gitrebase = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js runtime (>= 16.x required)
      server_opts_overrides = {},
    })
  end,
}

