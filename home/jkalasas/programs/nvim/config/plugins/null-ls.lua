local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- formatters
		null_ls.builtins.formatting.alejandra,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,

		-- linters
		null_ls.builtins.code_actions.eslint_d,
	},
})

local M = {
	n = {
		-- formatter
		["<leader>fm"] = function()
			vim.lsp.buf.format({ async = true })
		end,
	},
}

mapBindings(M)
