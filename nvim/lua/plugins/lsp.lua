local function goto_definition_in_tmux(splitType)
    local params = vim.lsp.util.make_position_params(0, 'utf-16')

    vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
        if err or not result or vim.tbl_isempty(result) then
            vim.notify("Definition not found", vim.log.levels.WARN)
            return
        end

        local def = result[1]
        local uri = def.uri or def.targetUri
        local range = def.range or def.targetSelectionRange
        local filepath = vim.uri_to_fname(uri)
        local line = range.start.line + 1 -- 1-based indexing for Neovim

        -- Escape the file path for shell
        local escaped_path = vim.fn.shellescape(filepath)

        local cmd
        if splitType == 'h' then
            -- Launch in new horizontal tmux split
            cmd = string.format("tmux split-window -h 'nvim +%d %s'", line, escaped_path)
        end
        if splitType == 'v' then
            -- Launch in new vertical tmux split
            cmd = string.format("tmux split-window -v 'nvim +%d %s'", line, escaped_path)
        end
        if splitType == 'c' then
            -- Launch in new tmux window 
            cmd = string.format("tmux new-window 'nvim +%d %s'", line, escaped_path)
        end

        os.execute(cmd)
    end)
end

return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable("clangd")
        vim.lsp.config("clangd", { -- C/C++
            on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end,
        })
        vim.lsp.enable("pyright")
        vim.lsp.config("pyright", { -- Python
            on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end,
        })
        vim.lsp.enable("rust_analyzer")
        vim.lsp.config("rust_analyzer", { -- Rust
            on_attach = function(client, bufnr)
                vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
                if client.server_capabilities.documentSymbolProvider then
                    require("nvim-navic").attach(client, bufnr)
                end
            end,
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                    },
                    procMacro = {
                        enable = true
                    },
                }
            }
        })

        vim.diagnostic.config({
            virtual_text = { spacing = 4, prefix = "<--" },
            signs = false,
            underline = true,
            update_in_insert = false,
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
            end,
        })

        vim.keymap.set('n', 't%', function() goto_definition_in_tmux('h') end, { silent = true, noremap = true })
        vim.keymap.set('n', 't"', function() goto_definition_in_tmux('v') end, { silent = true, noremap = true })
        vim.keymap.set('n', 'tc', function() goto_definition_in_tmux('c') end, { silent = true, noremap = true })
        
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP Code Action' })

        -- function signature hints
        vim.keymap.set('i', 'C-s',
            function()
                vim.lsp.buf.signature_help()
            end
        )

    end
}
