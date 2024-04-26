require("nvterm").setup({
	terminals = {
		type_opts = {
			float = {
				relative = "editor",
				col = 0.1,
				row = 0.2,
				width = 0.8,
				height = 0.6,
			},
			horizontal = {
				location = "rightbelow",
				split_ratio = 0.2,
			},
		},
	},
})

vim.keymap.set({ "n", "t" }, "<A-i>", function()
	require("nvterm.terminal").toggle("float")
end)

vim.keymap.set({ "n", "t" }, "<A-v>", function()
	require("nvterm.terminal").toggle("vertical")
end)
vim.keymap.set({ "n", "t" }, "<A-h>", function()
	require("nvterm.terminal").toggle("horizontal")
end)
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#010f20" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#2d8bd2" })
