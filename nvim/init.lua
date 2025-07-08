require("config.vim_options")
require("config.statusline")
require("config.cursorline")
require("config.markdown_fix")
require("config.no_newline_comment")

vim.cmd("colorscheme termcolors")

-- Set up lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end

vim.opt.rtp:prepend(lazypath)
-- Load lazy.nvim and install plugins
require("lazy").setup("plugins")
