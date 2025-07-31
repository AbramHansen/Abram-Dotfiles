-- Custom suffix that shows number of lines folded
local handler = function(virtText, lnum, endLnum, width, truncate)
    local suffix = (' ... %d lines'):format(endLnum - lnum)
    table.insert(virtText, {suffix, 'Comment'})
    return virtText
end

return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        "nvim-treesitter/nvim-treesitter",
    },
    event = "BufReadPost",
    config = function()
        vim.o.foldenable = true
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldcolumn = "0"

        -- Fold only functions and methods
        vim.treesitter.query.set("cpp", "folds", [[
                (function_definition body: (compound_statement) @fold)
            ]])
        vim.treesitter.query.set("c", "folds", [[
                (function_definition body: (compound_statement) @fold)
            ]])
        vim.treesitter.query.set("python", "folds", [[
                (function_definition body: (compound_statement) @fold)
            ]])

        require("ufo").setup({
            provider_selector = function()
                return { "treesitter", "indent" }
            end,
            fold_virt_text_handler = handler
        })

        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    end,
}
