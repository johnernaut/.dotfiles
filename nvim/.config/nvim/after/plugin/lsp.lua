local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
-- lsp.configure('lsp_lua', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    bind("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    bind("n", "<leader>vrr", vim.lsp.buf.references, opts)
    bind("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    bind("n", "<leader>vf", vim.lsp.buf.format, opts)
    bind("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
      completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

vim.diagnostic.config({
    virtual_text = true,
})
