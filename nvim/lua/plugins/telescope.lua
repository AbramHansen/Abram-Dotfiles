return {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>tc', builtin.git_bcommits, { desc = 'Telescope help tags' })
        vim.keymap.set('v', '<leader>ts', builtin.grep_string, { desc = 'Telescope string grep' })
        require('telescope').setup{
            defaults = {
                borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    hidden = true,
                },
                grep_string = {
                    hidden = true,
                },
            }
        }
    end,
}
