local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"typescript",
		"javascript",
		"html",
		"css",
		"vue",
		"astro",
		"svelte",
		"gitcommit",
		"graphql",
		"json",
		"json5",
		"lua",
		"markdown",
		"prisma",
		"vim",
	},
	autotag = {
		enable = true,
	},
})
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" }
