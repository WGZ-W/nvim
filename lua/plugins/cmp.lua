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
		luasnip.config.setup({})

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- Use <C-b/f> to scroll the docs
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- Use <CR>(Enter) to confirm selection
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm({ select = true }),
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
