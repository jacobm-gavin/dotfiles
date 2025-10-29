---@type vim.lsp.Config
return {
    -- Probe for the best available Ruff LSP entrypoint.
    cmd = (function()
        if vim.fn.executable('ruff-lsp') == 1 then
            return { 'ruff-lsp' }
        end

        if vim.fn.executable('ruff') == 1 then
            local help = table.concat(vim.fn.systemlist({ 'ruff', '--help' }), '\n')
            if help:find('\nlsp') then
                return { 'ruff', 'lsp' }
            end
        end

        local function python_with_module(bin, module)
            if vim.fn.executable(bin) ~= 1 then
                return false
            end
            local script = ('import importlib.util, sys; sys.exit(0 if importlib.util.find_spec(%q) else 1)')
                :format(module)
            vim.fn.system({ bin, '-c', script })
            return vim.v.shell_error == 0
        end

        if python_with_module('python3', 'ruff_lsp') then
            return { 'python3', '-m', 'ruff_lsp' }
        end
        if python_with_module('python', 'ruff_lsp') then
            return { 'python', '-m', 'ruff_lsp' }
        end

        -- As a last resort fall back to the standalone binary so users see a clear failure message.
        vim.schedule(function()
            vim.notify(
                '[ruff] no LSP entrypoint found; install `ruff-lsp` (pipx/pip) or upgrade Ruff to a build with `ruff lsp`',
                vim.log.levels.WARN
            )
        end)
        return { 'ruff-lsp' }
    end)(),
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'ruff.toml',
        '.ruff.toml',
        'setup.cfg',
        'setup.py',
        'Pipfile',
        'requirements.txt',
        '.git',
    },
    init_options = {
        settings = {
            lint = {
                enable = true,
            },
            format = {
                enable = false,
            },
        },
    },
}
