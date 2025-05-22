-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page up and center' })

vim.keymap.set('n', ']b', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<Leader>bn', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<Leader>bp', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<Leader>bb', '<Cmd>BufferLinePick<CR>', { desc = 'Pick buffer' })
vim.keymap.set('n', '<Leader>bc', '<Cmd>bdelete<CR>', { desc = 'close buffer' })
vim.keymap.set('n', '<Leader>bC', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'close buffer' })

vim.keymap.set('n', '<leader>cA', function()
  vim.lsp.buf.code_action {
    context = { only = { 'source' }, diagnostics = {} },
  }
end, { desc = 'Source Action' })

vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Show Line Diagnostics' })

vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, { desc = 'Find Document symbols' })
vim.keymap.set('n', '<leader>fS', require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc = 'Find Workspace symbols' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Find Keymaps' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>ft', require('telescope.builtin').builtin, { desc = 'Find Select Telescope' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = 'Find current Word' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Find by Grep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = ' Find existing buffers' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>.', require('telescope.builtin').resume, { desc = 'Browser' })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Browser' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>f/', function()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>fn', function()
  require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

vim.keymap.set('n', '<leader>gg', '<CMD>LazyGit<CR>', { desc = 'LazyGit' })
