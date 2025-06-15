return {
    "eandrju/cellular-automaton.nvim",

    config = function()
        vim.keymap.set("n", "mr", "<cmd>CellularAutomaton make_it_rain<CR>")
    end
}
