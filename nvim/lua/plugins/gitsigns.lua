return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup {
            signs = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '-' },
                topdelete    = { text = '^' },
                changedelete = { text = '-' },
                untracked    = { text = 'U' },
            },
            signs_staged = {
                add          = { text = '+' },
                change       = { text = '~' },
                delete       = { text = '-' },
                topdelete    = { text = '^' },
                changedelete = { text = '-' },
                untracked    = { text = 'U' },
            },
            signs_staged_enable = true,
            signcolumn = false,
            numhl      = true,
            linehl     = false,
            word_diff  = false,
            watch_gitdir = {
                follow_files = true
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = false,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 40000,
            preview_config = {
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },

            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gh', require("gitsigns").preview_hunk_inline)
                vim.keymap.set('n', '<leader>gr', require("gitsigns").reset_hunk)
                vim.keymap.set('n', '<leader>gn', function()
                    require("gitsigns").nav_hunk('next')
                end)
                vim.keymap.set('n', '<leader>gN', function()
                    require("gitsigns").nav_hunk('prev')
                end)
                vim.keymap.set('n', '<leader>gb', require("gitsigns").toggle_current_line_blame)
            end,
        }
    end
}
