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
vim.keymap.set("n", "<leader>pl", ":Lazy<CR>", { noremap = true })


-- Setup lazy.nvim
require("lazy").setup({
    require("plugins.autocomplete"),
    require("plugins.colorscheme"),
    require("plugins.git"),
    require("plugins.mason"),
    require("plugins.nvim-tree"),
    require("plugins.treesitter"),
    require("plugins.lualine"),
})



