return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		vim.g.everforest_enable_italic = true
		vim.cmd([[colorscheme everforest]])
	end,
}
