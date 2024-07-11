require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
})

local M = {
	n = {
		-- nvim-tree
		["<C-n>"] = "<cmd> NvimTreeToggle <CR>",
		["<leader>e"] = "<cmd> NvimTreeFocus <CR>",
	}
}

mapBindings(M)
