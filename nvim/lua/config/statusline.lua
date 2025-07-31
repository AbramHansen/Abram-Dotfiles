local signature_cache = ""
local last_update = 0

function function_signature()
    return signature_cache
end

-- Update signature asynchronously
local function update_signature()
    if vim.v.vim_did_enter == 0 or 
        not vim.lsp.get_clients() or 
        #vim.lsp.get_clients() == 0 or
        vim.bo.buftype ~= "" or
        not vim.bo.modifiable or
        vim.bo.readonly then
        signature_cache = ""
        return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({bufnr = bufnr})
    if #clients == 0 then
        signature_cache = ""
        return
    end

    vim.lsp.buf_request(0, "textDocument/signatureHelp", vim.lsp.util.make_position_params(0, "utf-8"), function(err, result)
        if err or not result or not result.signatures or not result.signatures[1] then
            signature_cache = ""
            return
        end

        local sig = result.signatures[1]
        signature_cache = sig.label:gsub("\n.*", "")
        vim.cmd.redrawstatus()
    end)
end

-- Update signature on cursor movement (throttled)
vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
    callback = function()
        local now = vim.loop.hrtime()
        if now - last_update > 100000000 then -- 100ms throttle
            last_update = now
            update_signature()
        end
    end
})

function errors()
    if vim.api.nvim_get_mode().mode == "n" then
        local errors = vim.tbl_count(vim.diagnostic.get(0, {"Error"}))
        if errors == 1 then
            return errors .. " ERROR  "
        elseif errors > 1 then
            return errors .. " ERRORS "
        else
            return ""
        end
    else
        return ""
    end
end

function navicLocation()
    local location = require'nvim-navic'.get_location()
    if location ~= "" then
        return " > " .. location
    else
        return ""
    end
end

local signature = "%{v:lua.function_signature()}"
local lspLocation = "%{%v:lua.navicLocation()%}"
local errors = "%#Special#%{v:lua.errors()}%#Normal#"
local fileInfo = "%m%r%t"
local fileLocation = "%4l:%02c %3p%%"

vim.opt.statusline = errors .. fileInfo .. lspLocation .. "%=" .. signature .. "%=" .. fileLocation
