return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
		"hrsh7th/cmp-buffer", -- buffer auto-completion
		"hrsh7th/cmp-path", -- path auto-completion
		"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	config = function()
		local luasnip = require("luasnip")
		local cmp = require("cmp")

		-- Set up lspconfig.
		-- Add additional capabilities supported by nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
		-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
		local servers = { "rust_analyzer", "ts_ls", "pylsp", "lua_ls" }
		for _, lsp in ipairs(servers) do
			require("lspconfig")[lsp].setup({
				-- on_attach = my_custom_on_attach,
				capabilities = capabilities,
			})
		end

		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
				["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
				-- C-b (back) C-f (forward) for snippet placeholder navigation.
				["<C-Space>"] = cmp.mapping.complete(),
				-- Use <CR>(Enter) to confirm selection
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			-- Set source precedence
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- For nvim-lsp
				{ name = "luasnip" }, -- For luasnip user
				{ name = "buffer" }, -- For buffer word completion
				{ name = "path" }, -- For path completion
			}),
		})
	end,
}
