vim.cmd("highlight clear")
vim.opt.background = "dark"
vim.g.colors_name = "termcolors"
vim.opt.termguicolors = false

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

BLACK = 0
RED = 1
GREEN = 2
YELLOW = 3
BLUE = 4
PURPLE = 5
CYAN = 6
GREY = 7
DARK_GREY = 8
LIGHT_RED = 9
LIGHT_GREEN = 10
LIGHT_YELLOW = 11
LIGHT_BLUE = 12
LIGHT_PURPLE = 13
LIGHT_CYAN = 14
WHITE = 15

-- Highlight groups reference:
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md

-- cursor line highlighting and line numbers
hl("CursorLine",            { ctermbg = BLACK })
hl("CursorLineNr",          { ctermbg = BLACK, ctermfg = WHITE })
hl("LineNr",                { ctermfg = DARK_GREY })
hl("EndOfBuffer",           { ctermfg = DARK_GREY })
-- functions
hl("Function",              { ctermfg = YELLOW })
hl("@function",             { ctermfg = YELLOW })
hl("@function.builtin",     { ctermfg = YELLOW })
hl("@function.call",        { ctermfg = YELLOW })
hl("@function.macro",       { ctermfg = YELLOW })
hl("@function.method",      { ctermfg = YELLOW })
hl("@function.method.call", { ctermfg = YELLOW })
hl("@constructor",          { ctermfg = YELLOW })
hl("@label",                { ctermfg = YELLOW })
-- variables
hl("Constant",              { ctermfg = WHITE })
hl("Identifier",            { ctermfg = WHITE })
hl("@variable",             { ctermfg = WHITE })
hl("@variable.builtin",     { ctermfg = WHITE })
hl("@variable.parameter",   { ctermfg = WHITE })
hl("@variable.parameter.builtin",{ ctermfg = WHITE })
hl("@variable.member",      { ctermfg = WHITE })
hl("@parameter",            { ctermfg = WHITE })
hl("@field",                { ctermfg = WHITE })
hl("@constant",             { ctermfg = CYAN })
hl("@constant.builtin",     { ctermfg = CYAN })
hl("@constant.macro",       { ctermfg = CYAN })
-- keywords
hl("Statement",             { ctermfg = PURPLE })
hl("Conditional",           { ctermfg = PURPLE })
hl("Repeat",                { ctermfg = PURPLE })
hl("Label",                 { ctermfg = PURPLE })
hl("Keyword",               { ctermfg = PURPLE })
hl("Exception",             { ctermfg = PURPLE })
hl("@keyword",              { ctermfg = PURPLE })
hl("@keyword.coroutine",    { ctermfg = PURPLE })
hl("@keyword.function",     { ctermfg = PURPLE })
hl("@keyword.operator",     { ctermfg = PURPLE })
hl("@keyword.import",       { ctermfg = PURPLE })
hl("@keyword.type",         { ctermfg = PURPLE })
hl("@keyword.modifier",     { ctermfg = PURPLE })
hl("@keyword.repeat",       { ctermfg = PURPLE })
hl("@keyword.debug",        { ctermfg = PURPLE })
hl("@keyword.exception",    { ctermfg = PURPLE })
hl("@keyword.conditional",  { ctermfg = PURPLE })
hl("@keyword.conditional.ternary",{ ctermfg = PURPLE })
hl("@keyword.directive",    { ctermfg = PURPLE })
hl("@keyword.directive.define",{ ctermfg = PURPLE })
-- literals
hl("Special",               { ctermfg = RED })
hl("SpecialChar",           { ctermfg = CYAN })
hl("Character",             { ctermfg = GREEN })
hl("String",                { ctermfg = GREEN })
hl("Number",                { ctermfg = WHITE })
hl("Boolean",               { ctermfg = WHITE })
hl("Float",                 { ctermfg = WHITE })
hl("@string",               { ctermfg = GREEN })
hl("@string.documentation", { ctermfg = GREY })
hl("@string.regexp",        { ctermfg = CYAN })
hl("@string.escape",        { ctermfg = CYAN })
hl("@string.special",       { ctermfg = CYAN })
hl("@string.special.symbol",{ ctermfg = GREEN })
hl("@string.special.url",   { ctermfg = BLUE })
hl("@string.special.path",  { ctermfg = GREEN })
hl("@character",            { ctermfg = GREEN })
hl("@character.special",    { ctermfg = GREEN })
hl("@number",               { ctermfg = WHITE })
hl("@number.float",         { ctermfg = WHITE })
hl("@boolean",              { ctermfg = WHITE })
-- comments
hl("TODO",                  { ctermfg = YELLOW })
hl("SpecialComment",        { ctermfg = WHITE })
hl("Comment",               { ctermfg = DARK_GREY, italic = true })
hl("@comment",              { ctermfg = DARK_GREY, italic = true })
hl("@comment.documentation",{ ctermfg = DARK_GREY, italic = true })
hl("@comment.error",        { ctermfg = RED, italic = true })
hl("@comment.warning",      { ctermfg = YELLOW, italic = true })
hl("@comment.todo",         { ctermfg = YELLOW, italic = true })
hl("@comment.note",         { ctermfg = DARK_GREY, italic = true })
-- types
hl("Type",                  { ctermfg = BLUE })
hl("StorageClass",          { ctermfg = BLUE })
hl("Structure",             { ctermfg = BLUE })
hl("TypeDef",               { ctermfg = BLUE })
hl("Type",                  { ctermfg = BLUE })
hl("@type",                 { ctermfg = BLUE })
hl("@type.builtin",         { ctermfg = BLUE })
hl("@type.definition",      { ctermfg = BLUE })
hl("@attribute",            { ctermfg = RED })
hl("@attribute.builtin",    { ctermfg = RED })
hl("@property",             { ctermfg = WHITE })
hl("@module",               { ctermfg = BLUE })
hl("@module.builtin",       { ctermfg = BLUE })
-- other
hl("Error",                 { ctermfg = RED })
hl("Operator",              { ctermfg = RED })
hl("Delimiter",             { ctermfg = RED })
hl("Debug",                 { ctermfg = RED })
hl("Underlined",            { ctermfg = BLUE })
hl("@operator",             { ctermfg = RED })
hl("@punctuation",          { ctermfg = RED })
hl("@punctuation.bracket",  { ctermfg = WHITE })
hl("@punctuation.special",  { ctermfg = RED })
-- preprocessor
hl("PreProc",               { ctermfg = PURPLE })
hl("Include",               { ctermfg = PURPLE })
hl("Define",                { ctermfg = PURPLE })
hl("Macro",                 { ctermfg = PURPLE })
hl("PreCondit",             { ctermfg = YELLOW })
-- diff
hl("Added",                 { ctermfg = GREEN })
hl("Changed",               { ctermfg = YELLOW })
hl("Removed",               { ctermfg = RED })
hl("@diff.plus",            { ctermfg = GREEN })
hl("@diff.delta",           { ctermfg = YELLOW })
hl("@diff.minus",           { ctermfg = RED })
-- markup
hl("@markup.strong",        { ctermfg = WHITE, bold = true })
hl("@markup.italic",        { ctermfg = WHITE, italic = true })
hl("@markup.strikethrough", { ctermfg = RED })
hl("@markup.underline",     { ctermfg = YELLOW })
hl("@markup.heading",       { ctermfg = BLUE })
hl("@markup.heading.1",     { ctermfg = BLUE, bold = true })
hl("@markup.heading.2",     { ctermfg = BLUE, bold = true })
hl("@markup.heading.3",     { ctermfg = WHITE, bold = true })
hl("@markup.quote",         { ctermfg = GREEN })
hl("@markup.math",          { ctermfg = PURPLE })
hl("@markup.link",          { ctermfg = BLUE })
hl("@markup.link.lable",    { ctermfg = BLUE })
hl("@markup.link.url",      { ctermfg = BLUE })
hl("@markup.raw",           { ctermfg = WHITE })
hl("@markup.raw.block",     { ctermfg = WHITE })
hl("@markup.list",          { ctermfg = WHITE, italic = true })
hl("@markup.list.checked",  { ctermfg = WHITE, italic = true })
hl("@markup.list.unchecked",{ ctermfg = WHITE, italic = true })
-- tags
hl("Tag",                   { ctermfg = RED })
hl("@tag",                  { ctermfg = RED })
hl("@tag.builtin",          { ctermfg = RED })
hl("@tag.attribute",        { ctermfg = YELLOW })
hl("@tag.delimiter",        { ctermfg = RED })
