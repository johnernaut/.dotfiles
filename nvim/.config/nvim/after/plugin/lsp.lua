local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    bind("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    bind("n", "<leader>vrr", vim.lsp.buf.references, opts)
    bind("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    bind("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
