return  {
  { 'github/copilot.vim' },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    build = "make tiktoken",
    dependencies = {
      {'nvim-lua/plenary.nvim', branch = 'master'}
    },
    opts = {
    model = 'gpt-4.1'
    },
  }
}
