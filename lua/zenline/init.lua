local modes = require('zenline.utils.modes').modes
local colors = require('zenline.utils.colors').colors
local git = require('zenline.utils.git')

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
    local git_status = colors.mode .. git.get_status()

    return table.concat {
        mode,
        git_status,
        filename,
        "%=",
        line_col,
    }
end

-- Do the status line setup
local function setup()
    require('zenline.utils.colors').set_line_highlights()
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
