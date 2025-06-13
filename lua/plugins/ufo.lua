return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		-- Add folding capability to LSP client
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- Optional: override default capabilities globally
		local lspconfig = require("lspconfig")
		local servers = { "ts_ls", "clangd", "gopls", "lua_ls" } -- list your LSPs here
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				-- other config
			})
		end

		-- Setup UFO
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})

		-- Keymaps
		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })

		vim.keymap.set("n", "zc", "zc", { noremap = true, silent = true, desc = "Close current fold" })
		vim.keymap.set("n", "zo", "zo", { noremap = true, silent = true, desc = "Open current fold" })
		-- More fine-grained control if needed
		vim.keymap.set("n", "z1", function()
			require("ufo").closeFolds(1)
		end, { desc = "Close folds level 1" })

		vim.keymap.set("n", "z2", function()
			require("ufo").closeFolds(2)
		end, { desc = "Close folds level 2" })

		vim.keymap.set("n", "z3", function()
			require("ufo").closeFolds(3)
		end, { desc = "Close folds level 3" })
	end,
}
