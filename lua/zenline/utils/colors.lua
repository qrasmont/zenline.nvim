-- Define some theme colors to be use to color the line
local theme_colors = {
    dark_background = '#3C3836',
    light_text = '#EBDBB2',
    light_background = '#EBDBB2',
    dark_text = '#3C3836'
}

-- Color to Highlight group table
local colors = {
    light        = "%#ZLineLight#",
    dark         = "%#ZLineDark#",
    mode         = "%#ZLineMode#",
    git          = "%#ZLineGit#",
    filename     = "%#ZLineFileName#",
    linecol     = "%#ZLineLinCol#",
}

-- Define highlights colors and style
local line_highlights = {
    {'ZLineLignt',{fg = theme_colors.dark_text, bg = theme_colors.light_background}},
    {'ZLineDark',{fg = theme_colors.light_text, bg = theme_colors.dark_background}},
    {'ZLineMode',{fg = theme_colors.dark_text, bg = theme_colors.light_background, style = 'bold'}},
    {'ZLineLinCol',{fg = theme_colors.dark_text, bg = theme_colors.light_background, style = 'bold'}},
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
