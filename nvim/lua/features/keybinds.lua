vim.g.mapleader = " "
vim.g.localleader = " "


local telescope_builtin = require('telescope.builtin')
local tmuxnav = require("nvim-tmux-navigation")

vim.keymap.set('n', '<leader>pf', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>rg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>xx', telescope_builtin.diagnostics, { desc = 'Telescope Diagnostics' })
vim.keymap.set('n', '<leader>gs', telescope_builtin.git_status, { desc = 'Telescope git status' })
vim.keymap.set("n", "<leader>cs", telescope_builtin.colorscheme)

vim.keymap.set('n', "<C-h>", tmuxnav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", tmuxnav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", tmuxnav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", tmuxnav.NvimTmuxNavigateRight)

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("v", "<C-c>", '"+y' )

vim.keymap.set("n", "<C-a>", function() require("neomarks").mark_file() end)
vim.keymap.set("n", "<leader>h", function() require("neomarks").menu_toggle() end)

vim.keymap.set("n", "<leader>|", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>")

vim.keymap.set("n", "<leader>n", "<cmd>Notifications<CR>")

vim.keymap.set("n", "<leader>cli", function() require("sidekick.cli").toggle({name="codex"}) end)
vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>")
vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<CR>")


-- LSP --

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, { desc = 'Telescope references' })
