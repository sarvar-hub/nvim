local status, ibl = pcall(require, "ibl")

if not status then
	return
end
local cb = require("colorbuddy.init")
local colors = require("theme").base_30

cb.Color.new("line", "#182d3e")
vim.api.nvim_set_hl(0, "IblScope", { fg = colors.lochmara })
cb.Group.new("IblIndent", cb.colors.line, cb.colors.none, cb.styles.NONE)

ibl.setup({
	indent = {
		char = "│",
	},
	scope = {
		enabled = false,
	},
})
