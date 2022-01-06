local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap('n', '<leader>tb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap('n', '<leader>tf', "<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>", opts)
keymap('n', '<leader>tl', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap('n', '<leader>sb', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", opts)
keymap('n', '<leader>th', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap('n', '<leader>tt', "<cmd>lua require('telescope.builtin').tags()<CR>", opts)
keymap('n', '<leader>td', "<cmd>lua require('telescope.builtin').grep_string()<CR>", opts)
keymap('n', '<leader>to', "<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>", opts)
keymap('n', '<leader>t?', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)

-- LSP check lsp/handlers.lua

-- NVim-DAP
keymap('n', '<F9>', ':lua require"dap".toggle_breakpoint()<CR>',opts)
keymap('n', '<F11>', ':lua require"dap".step_out()<CR>', opts)
keymap('n', '<F10>', ':lua require"dap".step_into()<CR>', opts)
keymap('n', '<F6>', ':lua require"dap".step_over()<CR>', opts)
keymap('n', '<F5>', ':lua require"dap".continue()<CR>', opts)
keymap('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap('n', '<leader>dn', ':lua require"dap".run_to_cursor()<CR>', opts)
keymap('n', '<leader>dk', ':lua require"dap".up()<CR>', opts)
keymap('n', '<leader>dj', ':lua require"dap".down()<CR>', opts)
keymap('n', '<leader>dc', ':lua require"dap".terminate()<CR>', opts)
keymap('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', opts)
keymap('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>', opts)
keymap('n', '<leader>da', ':lua require"debugHelper".attach()<CR>', opts)
keymap('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>', opts)
keymap('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>', opts)
keymap('n', '<leader>d?', ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>', opts)

--Nvim-Tree
keymap('n', '<leader>n', '<cmd>NvimTreeToggle<CR>', opts)

-- Commentary
keymap('n', '<leader>/', '<cmd>:Commentary<CR>', opts)
keymap('v', '<leader>/', '<cmd>:Commentary<CR>', opts)

