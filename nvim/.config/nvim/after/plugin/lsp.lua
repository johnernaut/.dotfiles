local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    local bind = vim.keymap.set

    bind("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    bind("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)
