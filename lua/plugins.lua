-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Set some keymap there
--
-- vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
-- Setup lazy.nvim
require("lazy").setup({
--	require("plugins.which-key"),
--	require("plugins.telescope"),
--	require("plugins.lspconfig"),
	require("plugins.colorscheme"),
--	require("plugins.autoformat"),
--	require("plugins.cmp"),
--	require("plugins.treesitter"),
--	require("plugins.lualine"),
--	require("plugins.nvim-tree"),
--	-- require("plugins.markdown-preview"),
--	require("plugins.autopairs"),
--	require("plugins.bufferline"),
	--	require("plugins.git"),
	--	require("plugins.mason"),
	--	require("plugins.gitsigns"),
})
