vim.pack.add({
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
    { src = "https://github.com/ellisonleao/gruvbox.nvim"},
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine"},
    { src = "https://github.com/shaunsingh/nord.nvim"},
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim"},
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim"},
    { src = "https://github.com/nvim-lualine/lualine.nvim"},
    { src = "https://github.com/nvim-tree/nvim-web-devicons"},
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/saccarosium/neomarks" },
    { src = "https://github.com/folke/noice.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua"},
    { src = "https://github.com/nvim-tree/nvim-web-devicons"},
    { src = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim"},
    { src = "https://github.com/nvim-lua/plenary.nvim"},
    { src = "https://github.com/alexghergh/nvim-tmux-navigation"},
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    { src = "https://github.com/folke/sidekick.nvim" },
    { src = "https://github.com/github/copilot.vim" },
})



require("sidekick").setup{}
require("rainbow-delimiters.setup").setup{}
require("nvim-tree").setup()
require("neomarks").setup({})
require("mason").setup({})
require("lualine").setup()
require("gitsigns").setup{}
require("tiny-inline-diagnostic").setup()
require("gruvbox").setup({ transparent_mode = true })
require("nvim-autopairs").setup{}
require("telescope").setup{
    pickers = {
        lsp_references = {
            theme = "cursor"
        }
    }
}
require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space>"] = {},
        ["<C-p>"] = {},
        --["<Tab>"] = { "accept", "fallback" },
        --["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-Return>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
        -- ["<C-e>"] = { "hide" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },


    sources = { default = { "lsp" } }
})


require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

require('notify').setup({
    background_colour = "#000000"
})
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}


