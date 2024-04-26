local status, noice = pcall(require, "noice")
local colors = require("theme").base_30
if not status then
	return
end

noice.setup({
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	cmdline = {
		format = {
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
		},
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
	routes = {
		{
			filter = {
				event = "lsp",
			},
			opts = { skip = true },
		},
	},
})

vim.api.nvim_set_hl(0, "NoiceMini", { bg = colors.black, fg = colors.white })
vim.api.nvim_set_hl(0, "NoiceScrollbar", { bg = colors.pink, fg = colors.white })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = colors.darker_black })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { bg = colors.darker_black, fg = colors.white })
