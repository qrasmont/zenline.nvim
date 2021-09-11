local colors = require('zenline.utils.colors').colors

-- Nvim modes
local modes = {
    ["n"]  = {"N", colors.mode_normal},
    ["no"] = {"N", colors.mode_normal},
    ["v"]  = {"V", colors.mode_visual},
    ["V"]  = {"V·LINE", colors.mode_visual},
    [""] = {"V·BLOCK", colors.mode_visual},
    ["s"]  = {"I", colors.mode_insert},
    ["S"]  = {"I", colors.mode_insert},
    [""] = {"I", colors.mode_insert},
    ["i"]  = {"I", colors.mode_insert},
    ["ic"] = {"I", colors.mode_insert},
    ["R"]  = {"R", colors.mode_visual},
    ["Rv"] = {"V·RPLC", colors.mode_visual},
    ["c"]  = {"C", colors.mode_cmd},
    ["cv"] = {"V·EX", colors.mode_visual},
    ["r"]  = {"ENT", colors.mode_cmd},
    ["rm"] = {"STDIN", colors.mode_cmd},
    ["r?"] = {"C", colors.mode_cmd},
    ["!"]  = {"SHELL", colors.mode_cmd},
    ["t"]  = {"TERM", colors.mode_cmd},
}

return {
    modes = modes
}
