require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
			find_cmd = "fd",
		},
	},
})

require("telescope").load_extension("fzf")

local M = {
	n = {
		-- telescope
		["<leader>ff"] = "<cmd> Telescope find_files <CR>",
		["<leader>fa"] = "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>",
		["<leader>fw"] = "<cmd> Telescope live_grep <CR>",
		["<leader>fb"] = "<cmd> Telescope buffers <CR>",
		["<leader>mf"] = "<cmd> Telescope media_files <CR>",
	}
}

mapBindings(M)
