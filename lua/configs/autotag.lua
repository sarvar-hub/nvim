local status, tag = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

tag.setup({
	enable_close_on_slash = false,
})
