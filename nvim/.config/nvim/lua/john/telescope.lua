local Remap = require("john.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>ff", function()
    require('telescope.builtin').find_files()
end)

nnoremap("<leader>fg", function()
    require('telescope.builtin').live_grep()
end)
