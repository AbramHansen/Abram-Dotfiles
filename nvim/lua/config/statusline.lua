function signature_statusline()
    -- Don't run during startup or if LSP isn't ready
    if vim.v.vim_did_enter == 0 or not vim.lsp.get_clients() or #vim.lsp.get_clients() == 0 then
        return ""
    end
    
    local ok, result = pcall(vim.lsp.buf_request_sync, 0, "textDocument/signatureHelp", vim.lsp.util.make_position_params(0, "utf-8"), 100)
    if not ok or not result then return "" end
    for _, res in pairs(result) do
        if res and res.result and res.result.signatures and res.result.signatures[1] then
            local sig = res.result.signatures[1]
            local label = sig.label:gsub("\n.*", "") -- only the first line
            return label
        end
    end
    return ""
end

vim.opt.statusline = "%t%m%r%=%{v:lua.signature_statusline()} %= %{%v:lua.require'nvim-navic'.get_location()%} %l:%c %p%%"
