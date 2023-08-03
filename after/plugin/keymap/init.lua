local vim = vim

vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions <CR>zz")
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references <CR>zz")
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>zz")
vim.keymap.set("n", "<leader>o", "<cmd>Navbuddy<CR>")

vim.keymap.set("n", "<leader>s", "<cmd>TSJToggle<CR>")

vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>")

vim.keymap.set("n", "<leader>N", "<Cmd>set rnu!<CR>")
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/plugins/init.lua<CR>");
--LSP
vim.keymap.set("n", "<leader>pf", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<CR>")
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

vim.keymap.set("n", "<leader>g", "<cmd>Git<CR>")

vim.keymap.set("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
vim.keymap.set("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>")
vim.keymap.set("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")
vim.keymap.set("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--keybinds nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>di", "<Cmd>lua require('dapui').toggle()<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "gj", "<cmd>diffget //2<CR>zz")
vim.keymap.set("n", "gf", "<cmd>diffget //3<CR>zz")

