vim.o.tabline = "%!v:lua.Tabline()"

for i = 1, 9 do
  vim.keymap.set('n', 'g' .. i, i .. 'gt', { desc = 'Go to tab ' .. i })
end

function Tabline()
    local line = ""
    local tabs = vim.api.nvim_list_tabpages()
    local current = vim.api.nvim_get_current_tabpage()

    local tabFill = "%#TabLineFill#"

    for _, tab in ipairs(tabs) do
        local tab_number = vim.api.nvim_tabpage_get_number(tab)
        local hl = (tab == current) and "%#TabLineSel#" or "%#TabLine#"

        local win = vim.api.nvim_tabpage_get_win(tab)
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
        if name == "" then name = "[New File]" end

        local modified = ""
        if vim.api.nvim_buf_get_option(buf, 'modified') then
            modified = "[+]"
        end

        local seperator = " │ "

        line = line .. hl .. tab_number .. ":" .. modified .. name ..tabFill .. seperator 
    end

    return line .. tabFill
end
