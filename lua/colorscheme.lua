vim.cmd[[colorscheme nord]]
-- Example config in lua
vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = true

-- Load the colorscheme
require('nord').set()
