return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        -- Setup DAP UI
        dapui.setup({
            controls = { enabled = false },
            icons = {
                collapsed = "",
                current_frame = "->",
                expanded = ""
            },
            layouts = {{
                elements = {{
                        id = "scopes",
                        size = 0.40
                    },{
                        id = "breakpoints",
                        size = 0.20
                    },{
                        id = "stacks",
                        size = 0.20
                    },{
                        id = "watches",
                        size = 0.20
                    }},
                position = "left",
                size = 0.25 
            },{
                    elements = {{
                            id = "console",
                        }},
                    position = "right",
                    size = 0.25
                }
            },
        })

        -- Setup virtual text
        require('nvim-dap-virtual-text').setup({
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = false,
            only_first_definition = true,
            all_references = false,
            filter_references_pattern = '<module',
            virt_text_pos = 'eol',
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil
        })

        local dap = require('dap')
        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",

            -- On windows you may have to uncomment this:
            -- detached = false,
        }

        local dap = require('dap')
        dap.configurations.c = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
            {
                name = "Launch file with arguments",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                args = function()
                    local args_string = vim.fn.input('Arguments: ')
                    return vim.split(args_string, " +")
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
            {
                name = "Attach to process",
                type = "codelldb",
                request = "attach",
                pid = function()
                    local handle = io.popen("ps -eo pid,comm --no-headers | grep -E '\\.(out|exe)$|[^/]$' | head -20")
                    local result = handle:read("*a")
                    handle:close()

                    print("Available processes:")
                    print(result)

                    local pid = vim.fn.input("Process ID: ")
                    return tonumber(pid)
                end,
                stopOnEntry = false,
            },

        }

        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c

        -- Auto open/close DAP UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Keybindings
        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>B', function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, { desc = 'Debug: Set Conditional Breakpoint' })
        vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = 'Debug: Open REPL' })
        vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'Debug: Run Last' })
        vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Debug: Terminate' })

        -- DAP UI keybindings
        vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI' })
        vim.keymap.set('n', '<leader>de', dapui.eval, { desc = 'Debug: Evaluate Expression' })
        vim.keymap.set('v', '<leader>de', dapui.eval, { desc = 'Debug: Evaluate Selection' })

        -- Set breakpoint signs
        vim.fn.sign_define('DapBreakpoint', { text='B', texthl='Removed', linehl='', numhl='' })
        vim.fn.sign_define('DapBreakpointCondition', { text='C', texthl='Removed', linehl='', numhl='' })
        vim.fn.sign_define('DapLogPoint', { text='L', texthl='String', linehl='', numhl='' })
        vim.fn.sign_define('DapStopped', { text='>', texthl='Changed', linehl='', numhl='' })
        vim.fn.sign_define('DapBreakpointRejected', { text='X', texthl='Removed', linehl='', numhl='' })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "dapui_scopes",
                "dapui_breakpoints", 
                "dapui_stacks",
                "dapui_watches",
                "dapui_console",
            },
            callback = function()
                vim.opt_local.laststatus = 0
            end,
        })
    end,
}
