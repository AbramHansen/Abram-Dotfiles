return {
    "nvim-tresitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").setup()
        require("nvim-treesitter").install({
            "c", "cpp", "python",
            "lua", "vim", "javascript",
            "html", "css", "bash",
            "markdown", "markdown_inline", "asm",
            "vimdoc"
        })
    end
}
