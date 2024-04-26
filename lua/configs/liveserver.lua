local status, liveserver = pcall(require, "live_server")

if not status then
	return
end
liveserver.setup({})
vim.keymap.set("n", "<A-l>o", "<cmd>LiveServerStart<CR>")
vim.keymap.set("n", "<A-l>c", "<cmd>LiveServerStop<CR>")
