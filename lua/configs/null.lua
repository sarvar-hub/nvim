local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = require("null-ls")
local opts = {
  debug = true,

  sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.prettierd.with({
      file_types = {
        "javascript",
        "typescript",
        "css",
        "scss",
        "html",
        "yaml",
        "json",
        "markdown",
        "graphql",
        "md",
        "txt",
        "cjs",
      },
    }),
  },
}
null_ls.setup(opts)

vim.api.nvim_exec(
  [[
  augroup RestoreCursorPos
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
  augroup END
]],
  false
)
