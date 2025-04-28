-- lua/plugins/avante.lua
return {
  'yetone/avante.nvim',
  build = 'make', -- pulls the pre-built Rust binary or builds from source
  event = 'InsertEnter', -- load when you start typing
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    ------------------------------------------------------------------
    --  core provider settings – use Claude via the Anthropic API
    ------------------------------------------------------------------
    provider = 'claude', -- main provider
    auto_suggestions_provider = 'claude',
    claude = {
      endpoint = 'https://api.anthropic.com',
      model = 'claude-3-5-sonnet-20241022', -- or opus, haiku, etc.
      temperature = 0,
      max_tokens = 4096,
      -- disable_tools = true,         -- flip on if the model over-uses tools
    },

    ------------------------------------------------------------------
    --  behaviour: make it feel like Cursor
    ------------------------------------------------------------------
    behaviour = {
      enable_cursor_planning_mode = true, -- Cursor-style block edits
      enable_claude_text_editor_tool_mode = true, -- Claude 3.5 SONNET feature
    },

    ------------------------------------------------------------------
    --  Smart-Tab key-maps (accept / cycle / dismiss)
    ------------------------------------------------------------------
    mappings = {
      suggestion = {
        accept = '<Tab>',
        next = '<C-]>',
        prev = '<C-[>',
        dismiss = '<C-\\>',
      },
    },

    -- tiny quality-of-life tweak so suggestions arrive quickly
    suggestion = { debounce = 250 },
  },
}
