require("Comment").setup()
	
local M = {
	n = {
		["<leader>/"] = function()
			require("Comment.api").toggle.linewise.current()
		end,
	},
	v = {
		["<leader>/"] = "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	},
}

mapBindings(M)
