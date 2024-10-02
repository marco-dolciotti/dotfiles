-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- ctrl+c is the exact same as ESC
vim.keymap.set('n', '<C-c>', '<Esc>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- <C-c> is the same as Esc
vim.keymap.set('i', '<C-c>', '<Esc>', { silent = true })
vim.keymap.set('v', '<C-c>', '<Esc>', { silent = true })
vim.keymap.set('n', '<C-c>', '<Esc>', { silent = true })
vim.keymap.set('n', '<C-c>', '<Esc>', { silent = true })

-- resize the current window
vim.keymap.set('n', '<C-Up>', ':resize +5<CR>', { silent = true })
vim.keymap.set('n', '<C-Down>', ':resize -5<CR>', { silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -5<CR>', { silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +5<CR>', { silent = true })

-- " Map yank into clipboard
vim.keymap.set('n', '<leader>y', '"+y', {})
vim.keymap.set('v', '<leader>y', '"+y', {})
vim.keymap.set('n', '<leader>Y', '"+Y', {})
vim.keymap.set('v', '<leader>Y', '"+Y', {})

-- Map paste over selected text without overwriting the yank register
vim.keymap.set('n', '<leader>p', '"_dP', {})
vim.keymap.set('v', '<leader>p', '"_dP', {})

-- Map deletes without overwriting the yank register
vim.keymap.set('n', '<leader>d', '"_d', {})
vim.keymap.set('v', '<leader>d', '"_d', {})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Jump to previous diagnostic problem' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Jump to next diagnostic problem' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic floating quickfix list' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
