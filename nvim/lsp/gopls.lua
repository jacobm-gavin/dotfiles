---@type vim.lsp.Config
return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
                fieldalignment = false,
            },
            gofumpt = true,
            staticcheck = true,
            directoryFilters = {
                '-.git',
                '-node_modules',
                '-vendor',
            },
            usePlaceholders = true,
        },
    },
}
