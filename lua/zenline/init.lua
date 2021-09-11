local modes = require('zenline.utils.modes').modes
local colors = require('zenline.utils.colors').colors
local git = require('zenline.utils.git')

-- Get current mode as string
local function get_current_colored_mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format("%s %s ", modes[current_mode][2],
                                   modes[current_mode][1])
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
    local mode = get_current_colored_mode()
    local line_col = colors.linecol .. get_line_col()
    local filename = colors.dark .. get_filepath()

    local git_status  = git.get_status()
    local git_status_fmt = ''
    if git_status ~= '' then
        git_status_fmt = string.format('%s  %s | %s+%s %s~%s %s-%s ',
            colors.git, git_status.head,
            colors.git_added, git_status.added,
            colors.git_changed, git_status.changed,
            colors.git_removed, git_status.removed
        )
    end

    return table.concat {
        mode,
        git_status_fmt,
        colors.dark,
        '%=',
        filename,
        '%=',
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
