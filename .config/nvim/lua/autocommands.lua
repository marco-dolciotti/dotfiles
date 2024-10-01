-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto-save when changing text or switching buffers
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged", "BufLeave"}, {
    pattern = "*", -- This applies to all files
    callback = function()
        if vim.bo.modified then
            vim.cmd("silent! write")
        end
    end,
})

