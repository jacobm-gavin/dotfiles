vim.g.mapleader = " "
vim.g.localleader = " "


local telescope_builtin = require('telescope.builtin')
local tmuxnav = require("nvim-tmux-navigation")

vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>rg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set('n', "<C-h>", tmuxnav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", tmuxnav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", tmuxnav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", tmuxnav.NvimTmuxNavigateRight)

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)



