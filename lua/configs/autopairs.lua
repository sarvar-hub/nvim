local status, pair = pcall(require, "nvim-autopairs")
if not status then
	return
end
pair.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
