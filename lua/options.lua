


-- Make line numbers default
vim.o.relativenumber = true
vim.o.number = true

-- Tab indent
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

-- Prevent wrap
vim.o.wrap = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true


-- vim.o.mouse:append("a")
-- vim.o.clipboard:append("unnamedplus")
