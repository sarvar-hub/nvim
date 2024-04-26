local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end
local capab = vim.lsp.protocol.make_client_capabilities()
capab.textDocument.completion.completionItem.snippetSupport = true
local protocol = require("vim.lsp.protocol")
local signs = { Error = "󰅚 ", Warning = " ", Hint = " ", Information = " " }

local on_attach = function(client, bufnr)
	print("Attaching")
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
			desc = "[lsp] format on save",
		})
	end
end

--TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
	cmd = { "typescript-language-server", "--stdio" },
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})
nvim_lsp.jsonls.setup({
	capabilities = capab,
})
nvim_lsp.cssls.setup({
	capabilities = capab,
})
nvim_lsp.tailwindcss.setup({
	capabilities = capab,
})

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
		},
	},
})

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
