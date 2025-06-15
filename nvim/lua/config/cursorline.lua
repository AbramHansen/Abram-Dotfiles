-- only enable cursorline when neovim has the focus
local cursorline_group = vim.api.nvim_create_augroup("Enable cursorline only when Nvim has focus", { clear = true })
vim.api.nvim_create_autocmd(
    { 'VimEnter', 'WinEnter', 'BufWinEnter', 'FocusGained' },
    { group = cursorline_group, command = "set cursorline" }
)
vim.api.nvim_create_autocmd(
    { 'WinLeave', 'FocusLost' },
    { group = cursorline_group, command = "set nocursorline" }
)

