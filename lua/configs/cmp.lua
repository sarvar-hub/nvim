local cmp = require("cmp")

local cmp_ui = {
	icons = true,
	lspkind_text = true,
	style = "default",
	border_color = "grey_fg",
	selected_item_bg = "colored",
}

local cmp_style = cmp_ui["style"]
local field_arrangement = {
	atom = { "kind", "abbr", "menu" },
	default = { "kind", "abbr", "menu" },
}
local formatting_style = {

	fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

	format = function(_, item)
		local icons = require("icons")
		local icon = (cmp_ui.icons and icons[item.kind]) or ""
		if cmp_style == "atom" or cmp_style == "atom_colored" then
			icon = " " .. icon .. " "
			item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
			item.kind = icon
		else
			item.kind = icon
		end

		return item
	end,
}

local options = {
	completion = {
		completeopt = "menu,menuone",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	formatting = formatting_style,

	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "nvim_lua" },
		{ name = "path" },
	},
}
cmp.setup(options)
