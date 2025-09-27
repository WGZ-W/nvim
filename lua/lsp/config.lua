-- lua/lsp/config.lua
-- local function on_attach(_, bufnr)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })
-- end

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'python',
--   callback = function()
--     print("Starting pyright...")
--     require('lspconfig').pyright.setup {
--       cmd = { 'E:/Miniconda3/Scripts/pylsp.exe' },
--       on_attach = on_attach
--     }
--   end,
-- })







-- local lspconfig = require('lspconfig')
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- -- 获取该语言服务器的默认配置（现在是一个纯 table）
-- -- local config = require('lspconfig.configs')[server]

-- local function on_attach(client, bufnr)
--   local opts = { buffer = bufnr, silent = true }
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--   vim.keymap.set('n', '<space>f', function()
--     vim.lsp.buf.format()
--   end, opts)
-- end

-- -- 安全启动 LSP（避免未安装服务器时报错）
-- local function setup_lsp(server, opts)
--   print("🚀 Attempting to start LSP: " .. server)  -- 调试用
--   local ok, lspconfig = pcall(require, 'lspconfig')
--   if not ok then
--     print('Failed to load lspconfig')
--     return
--   end

--   opts = opts or {}
--   opts.capabilities = vim.tbl_deep_extend('force', capabilities, opts.capabilities or {})
--   opts.on_attach = opts.on_attach or on_attach

--   lspconfig[server].setup(opts)
-- end

-- -- 按文件类型自动启动
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'python',
--   callback = function()
--     setup_lsp('pyright')
--   end,
-- })


-- -- v3.0+
-- -- local function on_attach(client, bufnr)
-- --   local opts = { buffer = bufnr, silent = true }
-- --   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- --   vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- --   vim.keymap.set('n', '<space>f', function()
-- --     vim.lsp.buf.format { async = true }
-- --   end, opts)
-- -- end

-- -- ✅ 新方式：使用 util.get_config（v3.0+ 推荐）
-- -- local function setup_lsp(server_name)
-- --   local config = require('lspconfig.util').get_config(server_name, {
-- --     capabilities = capabilities,
-- --     on_attach = on_attach,
-- --   })
-- --   vim.lsp.start(config)
-- -- end

-- -- 按文件类型自动启动
-- -- vim.api.nvim_create_autocmd('FileType', {
-- --   pattern = 'python',
-- --   callback = function() setup_lsp('pyright') end,
-- -- })

-- -- vim.api.nvim_create_autocmd('FileType', {
-- --   pattern = 'javascript,javascriptreact,typescript,typescriptreact',
-- --   callback = function() setup_lsp('tsserver') end,
-- -- })

-- -- 其他语言...



-- -- 全局 LSP 设置
-- local opts = { noremap = true, silent = true }

-- -- 设置快捷键（可选）
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wl', function()
--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- end, opts)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
-- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('v', '<space>ca', vim.lsp.buf.code_action, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', '<space>f', function()
--   vim.lsp.buf.format { async = true }
-- end, opts)

-- -- 自动格式化（保存时）
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("LspFormat", { clear = true }),
--   callback = function(ev)
--     if vim.bo[ev.buf].buftype == "" then
--       vim.api.nvim_buf_create_user_command(ev.buf, "Format", function()
--         vim.lsp.buf.format()
--       end, {})
--     end
--   end,
-- })

