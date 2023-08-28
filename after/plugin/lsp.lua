local lsp = require("lsp-zero")
local luasnip = require("luasnip")

lsp.preset("recommended")

lsp.ensure_installed({ 'tsserver',
  'eslint',
  'rust_analyzer',
  'emmet_ls',
  'cssls',
  'html',
  'tailwindcss'
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-j>"] = cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    end
  end, {"i", "s"}),

  ["<C-k>"] = cmp.mapping(function(fallback)
    if luasnip.jumpable(1) then
      luasnip.jump(1)
    end
  end, {"i", "s"})
})


cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.set_preferences({
  sign_icons = {}
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  comparators = {

  }

})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  
  vim.keymap.set("n", "<leader>w", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
end)

require("typescript").setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
    },
    server = { -- pass options to lspconfig's setup method
        on_attach = ...,
    },
})

lsp.setup()

