return{
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- IMPORTANT: this is required for v3+
  opts = {
    indent = { char = "│" }, -- choose any char: "│", "┊", "¦", etc.
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
  },
  event = "BufReadPost", -- loads plugin when a file is opened
}

