-- local status, lint = pcall(require, "lint")
-- if not status then
--   return
-- end
--
-- lint.linters_by_ft = {
--   javascript = { "eslint" },
--   javascriptreact = { "eslint" },
--   typescript = { "eslint" },
--   typescriptreact = { "eslint" },
-- }
--
-- vim.api.nvim_create_autocmd({ "BufRead", "InsertLeave" }, {
--   callback = function()
--     lint.try_lint()
--   end,
-- })