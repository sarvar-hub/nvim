local status, tree = pcall(require, "neo-tree")
if not status then
	return
end
tree.setup({

	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			show_hidden_count = false,
			hide_gitignored = false,
			never_show = {
				".git",
				"node_modules",
			},
		},
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
	},
	popup_border_style = "rounded",
	source_selector = {
		statusbar = false,
	},
	hide_root_node = true,
	default_component_configs = {
		git_status = {
			symbols = {
				added = "A", -- "✚",
				modified = "M", -- "",
				deleted = "D", ---"✖",
				renamed = "R", --"󰁕",
				untracked = "U", --"",
				ignored = "I", --"",
				unstaged = "󰄱",
				staged = "S", --"",
				conflict = "C", --"",
			},
		},
	},
})
local colors = require("theme").base_30
local base = require("theme").base_16
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = colors.darker_black, fg = colors.darker_black })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = colors.darker_black, fg = colors.darker_black })
vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = colors.one_bg3 })
vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = colors.rolling_stone })
vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = colors.dark_purple, fg = colors.darker_black })
vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { bg = colors.pink, fg = colors.grey })
vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = colors.lochmara, italic = false })
vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { fg = colors.spring_green, italic = false })
vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = colors.spring_green })
vim.api.nvim_set_hl(0, "NeoTreeDimText", { fg = colors.one_bg })
vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = colors.lightbg })
vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = colors.lochmara, bg = NONE })
vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { fg = colors.white, bg = colors.darker_black })

vim.keymap.set("n", "<C-e>", function()
	vim.cmd("Neotree focus")
end)
vim.keymap.set("n", "<leader>e", function()
	vim.cmd("Neotree float buffers")
end)
vim.keymap.set("n", "<leader>gg", function()
	vim.cmd("Neotree float git_status")
end)
vim.keymap.set("n", "<C-n>", function()
	vim.cmd("Neotree toggle filesystem")
end)
