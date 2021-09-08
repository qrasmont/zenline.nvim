-- Set the highlight groups for the status line
-- TODO Create a theme config (match gruvbox theme colors)
vim.cmd(string.format('hi %s %s %s %s', 'ZLineLignt', 'guifg=#3C3836', 'guibg=#EBDBB2', ''))
vim.cmd(string.format('hi %s %s %s %s', 'ZLineDark', 'guifg=#EBDBB2', 'guibg=#3C3836', ''))
vim.cmd(string.format('hi %s %s %s %s', 'ZLineMode', 'guifg=#1D2021', 'guibg=#928374', 'gui=bold'))
vim.cmd(string.format('hi %s %s %s %s', 'ZLineLinCol', 'guifg=#1D2021', 'guibg=#928374', 'gui=bold'))


-- Highlight groups
local colors = {
    light        = "%#ZLineLight#",
    dark         = "%#ZLineDark#",
    mode         = "%#ZLineMode#",
    git          = "%#ZLineGit#",
    filename     = "%#ZLineFileName#",
    linecol     = "%#ZLineLinCol#",
}

-- Nvim modes
local modes = {
    ["n"]  = "N",
    ["no"] = "N",
    ["v"]  = "V",
    ["V"]  = "V·LINE",
    [""] = "V·BLOCK",
    ["s"]  = "I",
    ["S"]  = "I",
    [""] = "I",
    ["i"]  = "I",
    ["ic"] = "I",
    ["R"]  = "R",
    ["Rv"] = "V·RPLC",
    ["c"]  = "C",
    ["cv"] = "V·EX",
    ["r"]  = "ENT",
    ["rm"] = "STDIN",
    ["r?"] = "C",
    ["!"]  = "SHELL",
    ["t"]  = "TERM",
}

-- Get current mode as string
local function get_current_mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(" %s ", modes[current_mode]):upper()
end

-- Get current line & column
local function get_line_col()
    return " %l:%c "
end

-- Get the absolute filepath for the current file
local function get_filepath()
    return vim.fn.fnamemodify(vim.fn.expand('%'), ':p')
end

-- Draw status line
local function statusline()
    local mode = colors.mode .. get_current_mode()
    local line_col = colors.linecol .. get_line_col()
    local filename = colors.dark .. get_filepath()

    return table.concat {
        colors.light,
        mode,
        filename,
        "%=",
        line_col,
    }
end

-- Do the status line setup
local function setup()
    vim.o.statusline = '%!v:lua.require\'zenline\'.statusline()'
    vim.api.nvim_exec([[
      augroup ZenLine
        autocmd!
        autocmd WinLeave,BufLeave * lua vim.wo.statusline=require'zenline'.statusline()
        autocmd BufWinEnter,WinEnter,BufEnter * set statusline<
        autocmd VimResized * redrawstatus
      augroup END
    ]], false)
end

-- Expose needed functions
return {
    setup = setup,
    statusline = statusline
}
