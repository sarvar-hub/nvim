local opt = vim.opt
local colors = require("theme").base_30
vim.cmd("autocmd!")

vim.colorschema = "neosolarized"

vim.scriptencoding = "utf-8"

vim.wo.number = true
vim.wo.signcolumn = "yes"
opt.encoding = "utf-8"
opt.autoread = true
opt.number = true
opt.fileencoding = "utf-8"
opt.background = "dark"
opt.smartindent = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.backup = false
opt.showcmd = false
opt.showmode = false
opt.shell = "zsh"
opt.title = true
opt.hlsearch = true
opt.autoindent = true
opt.backupskip = "/.local/*"
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.pumblend = 5
vim.g.mapleader = " "
opt.inccommand = "split"
opt.ignorecase = true
opt.wrap = false
opt.backspace = "start,eol,indent"
opt.wildignore:append({ "*/node_modules/*" })
opt.clipboard = "unnamed"
opt.cmdheight = 0
opt.mouse = "a"
opt.smartcase = true
opt.incsearch = false
opt.updatetime = 300
vim.g.transparency = false
vim.g.syntastic_auto_jump = 0
opt.clipboard:append({ "unnamedplus" }) -- For ubuntu require xclip for X11, for Wayland wl-copy, wl-paste

opt.sessionoptions = "buffers,curdir,tabpages,winsize,folds"
vim.keymap.set("n", "<leader>git", function()
	vim.cmd("LazyGit")
end)

vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format()
end, {})

vim.api.nvim_create_user_command("RestartLint", function()
	vim.fn.jobstart("eslint_d restart", {
		on_exit = function()
			print("Restart eslint_d success!")
		end,
	})
end, {})

vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = colors.lochmara, bg = colors.darker_black })
vim.api.nvim_set_hl(0, "LazyGitFloat", { bg = colors.darker_black })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			timeout = 250,
			higroup = "visual",
		})
	end,
})
