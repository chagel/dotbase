-- Key mappings for Neovim in init.lua
local map = vim.api.nvim_set_keymap

-- Insert mode mappings
map('i', 'jj', '<Esc>', {noremap = true, silent = true})

-- Normal mode mappings for window navigation
map('n', '<C-J>', '<C-W><C-J>', {noremap = true, silent = true})
map('n', '<C-K>', '<C-W><C-K>', {noremap = true, silent = true})
map('n', '<C-L>', '<C-W><C-L>', {noremap = true, silent = true})
map('n', '<C-H>', '<C-W><C-H>', {noremap = true, silent = true})

-- Tab navigation and other mappings using leader key
map('n', '<leader>0', ':tablast<CR>', {noremap = true, silent = true})
for i = 1, 9 do
    map('n', '<leader>'..i, ':tabn '..i..'<CR>', {noremap = true, silent = true})
end

map('n', '<leader>h', ':noh<CR>', {noremap = true, silent = true})
map('n', '<leader>z', ':ZenMode<CR>', {noremap = true, silent = true})
map('n', '<leader>p', ':bp<CR>', {noremap = true, silent = true})
map('n', '<leader>b', ':Git blame<CR>', {noremap = true, silent = true})
map('n', '<leader>a', 'za', {noremap = true, silent = true})
map('n', '<leader>s', ':w<CR>', {noremap = true, silent = true})
map('n', '<leader>q', ':q<CR>', {noremap = true, silent = true})
map('n', '<leader>w', ':NvimTreeFindFileToggle<CR>', {noremap = true, silent = true})
map('n', '_', ':NvimTreeResize -20<CR>', {noremap = true, silent = true})
map('n', '+', ':NvimTreeResize +20<CR>', {noremap = true, silent = true})

-- Resize mappings
map('n', '<C-down>', ':resize -10<CR>', {noremap = true, silent = true})
map('n', '<C-up>', ':resize +10<CR>', {noremap = true, silent = true})
map('n', '<C-right>', ':vertical resize +10<CR>', {noremap = true, silent = true})
map('n', '<C-left>', ':vertical resize -10<CR>', {noremap = true, silent = true})

-- Visual mode mappings
map('v', '<Enter>', '<Plug>(EasyAlign)', {})
map('n', 'ga', '<Plug>(EasyAlign)', {})
map('n', '-', '<Plug>(choosewin)', {})

-- telescope 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<leader>t', builtin.treesitter, {})
vim.keymap.set('n', '<leader>c', builtin.git_commits, {})


vim.keymap.set('n', '<leader>l', ':Lazy<CR>', {})
vim.keymap.set('n', '<leader>m', ':Mason<CR>', {})

