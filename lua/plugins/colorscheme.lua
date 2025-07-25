return {
	-- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    --
	-- "folke/tokyonight.nvim",
	"sainnhe/everforest",

    -- The plugin will load right now.
	lazy = false,
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		-- Load the colorscheme here.
		-- Like many other themes, this one has different styles, and you could load
		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
		vim.g.everforest_enable_italic = true
        -- vim.g.everforest_background = "hard" -- or "soft", default is "default"
        vim.g.everforest_background = "soft" -- or "soft", default is "default"
		vim.cmd([[colorscheme everforest]])

		-- You can configure highlights by doing something like:
		vim.cmd.hi("Comment gui=none")
	end,
}
