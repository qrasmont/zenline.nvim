-- Define some theme colors to be use to color the line
local theme_colors = {
    light = '#EBDBB2',
    dark = '#3C3836',
    black = '#1D2021',
    grey = '#504945',
    red = '#FB4934',
    green = '#B8BB26',
    orange = '#FE8019',
    blue = '#83A598',
}

-- Color to Highlight group table
local colors = {
    light        = "%#ZLineLight#",
    dark         = "%#ZLineDark#",
    mode_normal  = "%#ZLineModeNormal#",
    mode_insert  = "%#ZLineModeInsert#",
    mode_visual  = "%#ZLineModeVisual#",
    mode_cmd     = "%#ZLineModeCmd#",
    git          = "%#ZLineGit#",
    git_added    = "%#ZLineGitAdded#",
    git_changed  = "%#ZLineGitChanged#",
    git_removed  = "%#ZLineGitRemoved#",
    filename     = "%#ZLineFileName#",
    linecol      = "%#ZLineLinCol#",
}

-- Define highlights colors and style
local line_highlights = {
    {'ZLineLignt',{fg = theme_colors.dark, bg = theme_colors.light}},
    {'ZLineDark',{fg = theme_colors.light, bg = theme_colors.dark}},
    {'ZLineModeNormal',{fg = theme_colors.dark, bg = theme_colors.light, style = 'bold'}},
    {'ZLineModeInsert',{fg = theme_colors.dark, bg = theme_colors.blue, style = 'bold'}},
    {'ZLineModeVisual',{fg = theme_colors.dark, bg = theme_colors.orange, style = 'bold'}},
    {'ZLineModeCmd',{fg = theme_colors.dark, bg = theme_colors.green, style = 'bold'}},
    {'ZLineGit',{fg = theme_colors.light, bg = theme_colors.black, style = 'bold'}},
    {'ZLineGitAdded',{fg = theme_colors.green, bg = theme_colors.black, style = 'bold'}},
    {'ZLineGitChanged',{fg = theme_colors.orange, bg = theme_colors.black, style = 'bold'}},
    {'ZLineGitRemoved',{fg = theme_colors.red, bg = theme_colors.black, style = 'bold'}},
    {'ZLineLinCol',{fg = theme_colors.dark, bg = theme_colors.light, style = 'bold'}},
}

-- Set a highlight
local function set_highlight(hl_group, options)
    local fg  = 'guifg=' .. options.fg
    local bg  = 'guibg=' .. options.bg
    local style  = options.style == nil and '' or 'gui=' .. options.style

    vim.cmd(string.format('hi %s %s %s %s', hl_group, fg, bg, style))
end

-- Set all the defined highlights
local function set_line_highlights()
    for _, highlight in ipairs(line_highlights) do
        set_highlight(highlight[1], highlight[2])
    end
end

return {
    colors = colors,
    set_line_highlights = set_line_highlights,
}
