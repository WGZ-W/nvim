-- Configure LSP capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set default capabilities for all LSP servers
vim.lsp.config('*', {
	capabilities = capabilities,
})


-- Load server configurations
require('lsp.servers.python').setup()
require('lsp.servers.lua').setup()