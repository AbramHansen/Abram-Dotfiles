-- fix for markdown files created by Github having capital extentions
vim.filetype.add({
        extension = {
            MD = "markdown",
            MARKDOWN = "markdown",
        }
})
