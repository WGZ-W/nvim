return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			config = function()
				require("nvim-web-devicons").setup({})
			end,
		},
	},

	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "everforest",
		}
  })
	end,
}
