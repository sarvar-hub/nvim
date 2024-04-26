local status, blame = pcall(require, "gitblame")
if not status then
	return
end
blame.setup()

vim.g.gitblame_highlight_group = "BlameLineVirtualText"
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_delay = 500
