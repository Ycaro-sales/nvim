local vim = vim

vim.notify = require("notify")
local notify = vim.notify

vim.notify = function(msg, ...)

  if msg:match("warning: multiple different client offset_encodings") then
    return
  end
    notify(msg, ...)
end

--vim.opt.guicursor = ""
-- vim.opt.clipboard = "unnamedplus"

-- vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.foldlevelstart = 1
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.list = true

vim.opt.smartindent = true
vim.opt.scrolloff = 8

vim.opt.updatetime = 50


vim.opt.wrap = false

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250


-- require("indent_blankline").setup {
--   -- for example, context is off by default, use this to turn it on
--   show_current_context = false,
--   show_current_context_start = false,
--   show_end_of_line = false,
-- }

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

require("everforest").setup({
  -- Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
  -- Default is "medium".
  background = "hard",
  -- How much of the background should be transparent. Options are 0, 1 or 2.
  -- Default is 0.
  --
  -- 2 will have more UI components be transparent (e.g. status line
  -- background).
  transparent_background_level = 0,
})
