local lsp = require("lsp-zero")

-- lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  local bind = vim.keymap.set

  bind("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  -- bind("n", "<leader>vrr", vim.lsp.buf.references, opts)
  bind('n', '<leader>vrr', '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })
  bind("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  bind("n", "gd", vim.lsp.buf.definition, opts)
  bind("n", "go", vim.lsp.buf.type_definition, opts)
  bind("n", "<leader>vf", vim.lsp.buf.format, opts)
  bind("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  bind('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
  bind('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  bind('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

  lsp.buffer_autoformat()
end)

local null_ls = require('null-ls')

local null_opts = lsp.build_options('null-ls', {
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ name = 'null-ls' })")
    end
  end,
})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local action = null_ls.builtins.code_actions

null_ls.setup({
  on_attach = null_opts.on_attach,
  sources = {
    -- formatting
    formatting.black,         -- JavaScript / TypeScript
    formatting.prettier,      -- JavaScript / TypeScript
    formatting.terraform_fmt, -- Terraform
  },
})

-- lsp.format_on_save({
--   format_opts = {
--     async = false,
--     timeout_ms = 10000,
--   },
--   servers = {
--     ['rust_analyzer'] = {'rust'},
--     ['tsserver'] = {'javascript', 'typescript'},
--   }
-- })

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
  },
  handlers = { lsp.default_setup }
})


local cmp = require('cmp')

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }
})

vim.diagnostic.config({
  virtual_text = true,
})
