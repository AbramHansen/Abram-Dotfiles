return {
    "nvim-tresitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "c", "cpp", "python",
                "lua", "vim", "javascript",
                "html", "css", "bash",
                "markdown", "markdown_inline", "asm"
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
