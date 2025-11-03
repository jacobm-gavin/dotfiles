---@type vim.lsp.Config
return {

  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'typescript', 'typescriptreact', 'typescript.tsx',
    'javascript', 'javascriptreact', 'javascript.jsx',
  },
  root_markers = {
    'package.json',
    'tsconfig.json',
    'jsconfig.json',
    '.git',
  },
  init_options = {
    hostInfo = 'neovim',
    -- Uncomment to point at a specific TS version in your repo:
    -- tsserver = { path = 'node_modules/typescript/lib' },
  },
  settings = {
    typescript = {
      -- If you use prettier/eslint for formatting, just don't call :Format
      -- or handle it in your formatter setup. (tsserver has no simple "enable=false".)
      format = {
        convertTabsToSpaces = true,
        indentSize = 2,
        tabSize = 2,
        semicolons = 'insert', -- TS >= 5.1
      },
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      preferences = {
        importModuleSpecifierPreference = 'shortest', -- 'non-relative'/'relative' also valid
        includeCompletionsForModuleExports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsWithSnippetText = true,
        includeCompletionsWithInsertText = true,
        quotePreference = 'single',
      },
    },
    javascript = {
      format = {
        convertTabsToSpaces = true,
        indentSize = 2,
        tabSize = 2,
        semicolons = 'insert',
      },
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      preferences = {
        importModuleSpecifierPreference = 'shortest',
        includeCompletionsForModuleExports = true,
        includeAutomaticOptionalChainCompletions = true,
        includeCompletionsWithSnippetText = true,
        includeCompletionsWithInsertText = true,
        quotePreference = 'single',
      },
    },
  },
}

