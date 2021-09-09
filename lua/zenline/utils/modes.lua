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

return {
    modes = modes
}
