return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    branch = 'main',
    version = '*',
    { 'github/copilot.vim' },
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },
  build = 'make tiktoken', -- Only on MacOS or Linux
  opts = {
    debug = true, -- Enable debugging
    -- See Configuration section for rest
  },
  -- See Commands section for default commands if you want to lazy load on them
}
