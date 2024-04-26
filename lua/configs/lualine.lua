local status, lualine = pcall(require, "lualine")
if not status then
	return
end
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "solarized_dark",
		section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		ignore_focus = { "TelescopePrompt", "neo-tree" },
		disabled_filetypes = { "TelescopePrompt", "neo-tree" },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(mode)
					return " " .. mode
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				fmt = function(str)
					return " " .. str
				end,
				icons_enabled = false,
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
			},
			"encoding",
			"filetype",
		},
		lualine_y = { {
			"progress",
			fmt = function()
				return " Ubuntu"
			end,
		} },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
	draw_empty = false,
})
