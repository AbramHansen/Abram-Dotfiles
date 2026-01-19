vim.cmd("highlight clear")
vim.opt.background = "dark"
vim.g.colors_name = "mono"
vim.opt.termguicolors = false

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Highlight groups reference:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

-- cursor line highlighting and line numbers
hl("CursorLine",            { underline = true })
hl("CursorLineNr",          {})
hl("LineNr",                { reverse = true })
hl("EndOfBuffer",           {})
-- functions
hl("Function",              { bold = true })
-- variables
hl("Constant",              {})
hl("Identifier",            {})
-- keywords
hl("Statement",             {})
hl("Conditional",           {})
hl("Repeat",                {})
hl("Label",                 {})
hl("Keyword",               {})
hl("Exception",             {})
-- literals
hl("Special",               {})
hl("SpecialChar",           {})
hl("Character",             {})
hl("String",                {})
hl("Number",                {})
hl("Boolean",               {})
hl("Float",                 {})
-- comments
hl("TODO",                  { italic = true })
hl("SpecialComment",        { italic = true })
hl("Comment",               { italic = true })
-- types
hl("Type",                  {})
hl("StorageClass",          {})
hl("Structure",             {})
hl("TypeDef",               {})
hl("Type",                  {})
-- preprocessor
hl("PreProc",               {})
hl("Include",               {})
hl("Define",                {})
hl("Macro",                 {})
hl("PreCondit",             {})
-- diff
hl("Added",                 {})
hl("Changed",               {})
hl("Removed",               {})
-- markup
hl("@markup.strong",        { bold = true})
hl("@markup.italic",        { italic = true })
hl("@markup.strikethrough", { strikethrough = true})
hl("@markup.underline",     { underline = true })
hl("@markup.heading",       { reverse = true })
hl("@markup.quote",         { italic = true })
hl("@markup.math",          { italic = true })
hl("@markup.link",          { italic = true })
hl("@markup.raw",           {})
hl("@markup.list",          {})
-- tags
hl("Tag",                   {})
-- diagnostic
hl("DiagnosticError",       { reverse = true })
hl("DiagnosticWarn",        { reverse = true })
hl("DiagnosticInfo",        { reverse = true })
hl("DiagnosticHint",        { reverse = true })
hl("DiagnosticOk",          { reverse = true })
-- other
hl("Error",                 { reverse = true})
hl("NonText",               {})
hl("Operator",              {})
hl("Delimiter",             {})
hl("Debug",                 {})
hl("Underlined",            { underline = true})
-- other UI
hl("ColorColumn",           {})
hl("Search",                {})
-- Man page
hl("manHeader",             { reverse = true })
hl("manBold",               { bold = true })
hl("manSectionHeading",     { reverse = true })
hl("manReference",          { italic = true })
-- custom
hl("searchStatus",          {})
-- tabs
hl("TabLine",               {})
hl("TabLineSel",            {})
hl("TabLineFill",           {})
-- gitsigns
hl("GitSignsAdd",           {})
hl("GitSignsChanged",       {})
hl("GitSignsDelete",        {})
hl("GitSignsTopdelete",     {})
hl("GitSignsChangedelete",  {})
hl("GitSignsUntracked",     {})
