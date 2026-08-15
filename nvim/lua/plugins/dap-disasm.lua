return {
    "Jorenar/nvim-dap-disasm",
    config = function()
        local disasm = require("dap-disasm")
        disasm.setup({
            -- Add disassembly view to elements of nvim-dap-ui
            dapui_register = true,

            -- The sign to use for instruction the exectution is stopped at
            sign = "DapStopped",

            -- Number of instructions to show before the memory reference
            ins_before_memref = 16,

            -- Number of instructions to show after the memory reference
            ins_after_memref = 16,

            -- Columns to display in the disassembly view
            columns = {
                "address",
                "instruction",
            },
        })

        vim.keymap.set("n", "<F1>", disasm.step_over, {
            desc = "DAP Step Instruction Over",
        })

        vim.keymap.set("n", "<F2>", disasm.step_into, {
            desc = "DAP Step Instruction Into",
        })

        vim.keymap.set("n", "<F3>", disasm.step_back, {
            desc = "DAP Step Instruction Back",
        })

        local dapui = require("dapui")

        local function toggle_disassembly()
            local layouts = dapui.elements
            local util = require("dapui.util")

            -- check if element is currently open
            local wins = util.find_element("disassembly")

            if wins and #wins > 0 then
                dapui.close_element("disassembly")
            else
                dapui.open_element("disassembly")
            end
        end

        vim.keymap.set("n", "<f4>", toggle_disassembly, {
            desc = "Toggle DAP disassembly (dapui)",
        })

    end
}
