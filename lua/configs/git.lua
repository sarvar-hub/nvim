local status, git = pcall(require, "git")
if not status then
	return
end

git.setup({
	default_mappings = true,
	keymaps = {
		blame = "<leader>gb",
		quit_blame = "<Esc>",
	},
	winbar = false,
})
