-- harpoon clone
vim.pack.add({
    {
        src = "https://github.com/saccarosium/neomarks"
    }
})

require("neomarks").setup({})

vim.keymap.set("n", "<C-a>", function() require("neomarks").mark_file() end)
vim.keymap.set("n", "<leader>h", function() require("neomarks").menu_toggle() end)


