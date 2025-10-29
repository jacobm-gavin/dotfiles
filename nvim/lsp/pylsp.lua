---@type vim.lsp.Config
return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'setup.cfg',
        'setup.py',
        'Pipfile',
        'requirements.txt',
        '.python-version',
        '.git',
    },
    settings = {
        pylsp = {
            plugins = {
                -- Enable built-in linting stack (PEP 8, flake-style, cyclomatic complexity).
                pycodestyle = { enabled = true },
                pyflakes = { enabled = true },
                mccabe = { enabled = true },
                -- Keep pylsp's formatting optional; set to true if you want :Format to use autopep8/yapf.
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                -- Type checking can be noisy without strict setup; enable if/when needed.
                pylsp_mypy = { enabled = false },
                -- Keep import sorting handy.
                pyls_isort = { enabled = true },
                -- Jedi drives completion/hover/signature help.
                jedi_completion = { enabled = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true, all_scopes = true },
            },
        },
    },
}
