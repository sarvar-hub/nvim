local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end
local colors = require("theme").base_30
bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "thick",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		max_prefix_length = 0,
		color_icons = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	offsets = {
		{
			filetype = "neo-tree",
			text = "Neo-tree",
			text_align = "left",
		},
	},
	},
	highlights = {

		diagnostic = {
			italic = false,
			bold = false,
		},
		-- diagnostic_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- diagnostic_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		-- hint = {
		--   fg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- hint_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- hint_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		-- hint_diagnostic = {
		--   fg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- hint_diagnostic_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- hint_diagnostic_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		-- info = {
		--   fg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- info_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- info_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		-- info_diagnostic = {
		--   fg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- info_diagnostic_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- info_diagnostic_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		warning = {
			bg = nil,
			bold = false,
			italic = false,
		},
		warning_visible = {
			fg = "red",
			bold = false,
			italic = false,
		},
		warning_selected = {
			-- fg = "<colour-value-here>",
			-- bg = "<colour-value-here>",
			-- sp = "<colour-value-here>",
		},
		-- warning_diagnostic = {
		--   fg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- warning_diagnostic_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		warning_diagnostic_selected = {
			-- fg = "<colour-value-here>",
			-- bg = "<colour-value-here>",
			-- sp = "<colour-value-here>",
			bold = false,
			italic = false,
		},
		-- error = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		-- },
		-- error_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- error_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		-- error_diagnostic = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		-- },
		-- error_diagnostic_visible = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		-- },
		-- error_diagnostic_selected = {
		--   fg = "<colour-value-here>",
		--   bg = "<colour-value-here>",
		--   sp = "<colour-value-here>",
		--   bold = true,
		--   italic = true,
		-- },
		separator = {
			fg = "#073642",
			bg = "#002b36",
		},
		separator_selected = {
			fg = "#073642",
		},
		background = {
			fg = "#657b83",
			bg = "#002b36",
		},
		buffer_selected = {
			fg = "#fdf6e3",
			italic = false,
		},
		fill = {
			bg = "#073642",
		},
		modified = {
			fg = colors.lightbg,
			bg = "#002b36",
		},
		modified_visible = {
			fg = colors.lightbg,
		},
		modified_selected = {
			fg = colors.lochmara,
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
