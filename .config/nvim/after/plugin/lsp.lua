--lsp
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	'lua_ls',
	--rust
	'rust_analyzer',
	--python
	'pyright',
	--c/c++
	'clangd',
	--typescript
	'tsserver',
	--golang
	--'gopl',
	},
  handlers = {
    lsp_zero.default_setup,
  },
})

--servers
lsp_zero.setup_servers({'lua_ls', 'rust_analyzer', 'pyright', 'clangd', 'tsserver'})
