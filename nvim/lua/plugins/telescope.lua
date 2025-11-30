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
                    get_selection_window = function ()
                        vim.cmd("tabnew")
                        return vim.api.nvim_get_current_win()
                    end,
                },
                live_grep = {
                    hidden = true,
                    get_selection_window = function ()
                        vim.cmd("tabnew")
                        return vim.api.nvim_get_current_win()
                    end,
                },
                grep_string = {
                    hidden = true,
                    get_selection_window = function ()
                        vim.cmd("tabnew")
                        return vim.api.nvim_get_current_win()
                    end,
                },
            }
        }
    end,
}
