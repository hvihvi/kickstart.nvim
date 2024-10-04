return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'

    mc.setup()

    -- Add or skip cursor above/below the main cursor.
    -- set({ 'n', 'v' }, '<up>', function()
    -- mc.lineAddCursor(-1)
    -- end)
    -- set({ 'n', 'v' }, '<down>', function()
    -- mc.lineAddCursor(1)
    -- end)
    -- set({ 'n', 'v' }, '<leader><up>', function()
    -- mc.lineSkipCursor(-1)
    -- end)
    -- set({ 'n', 'v' }, '<leader><down>', function()
    -- mc.lineSkipCursor(1)
    -- end)

    -- Add or skip adding a new cursor by matching word/selection
    vim.keymap.set({ 'n', 'v' }, '<C-g>', function()
      mc.matchAddCursor(1)
    end, { desc = 'Add cursor at next match' })
    vim.keymap.set({ 'n', 'v' }, '<leader>ms', function()
      mc.matchSkipCursor(1)
    end, { desc = '[M]ulticursor [S]kip next match' })
    -- set({ 'n', 'v' }, '<leader>mk', function()
    --   mc.matchAddCursor(-1)
    -- end)
    vim.keymap.set({ 'n', 'v' }, '<leader>mS', function()
      mc.matchSkipCursor(-1)
    end, { desc = '[M]ulticursor [S]kip previous match' })

    -- Add all matches in the document
    vim.keymap.set({ 'n', 'v' }, '<leader>ma', mc.matchAllAddCursors, { desc = '[M]ulticursor [A]dd all matches' })

    -- You can also add cursors with any motion you prefer:
    vim.keymap.set('n', '<C-j>', function()
      mc.addCursor 'j'
    end)
    vim.keymap.set('n', '<C-k>', function()
      mc.addCursor 'k'
    end)
    -- set('n', '<C-k>', function()
    --   mc.skipCursor 'k'
    -- end)

    -- Rotate the main cursor.
    vim.keymap.set({ 'n', 'v' }, '<leader>mn', mc.nextCursor)
    vim.keymap.set({ 'n', 'v' }, '<leader>mN', mc.prevCursor)

    -- Delete the main cursor.
    vim.keymap.set({ 'n', 'v' }, '<leader>md', mc.deleteCursor, { desc = '[M]ulticursor [D]elete cursor' })

    -- Add and remove cursors with control + left click.
    -- set('n', '<c-leftmouse>', mc.handleMouse)

    -- Easy way to add and remove cursors using the main cursor.
    -- set({ 'n', 'v' }, '<c-q>', mc.toggleCursor)

    -- Clone every cursor and disable the originals.
    -- set({ 'n', 'v' }, '<leader><c-q>', mc.duplicateCursors)

    vim.keymap.set('n', '<esc>', function()
      vim.cmd 'nohlsearch'
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end)

    -- bring back cursors if you accidentally clear them
    -- set('n', '<leader>gv', mc.restoreCursors)

    -- Align cursor columns.
    -- set('v', '<leader>a', mc.alignCursors)

    -- Split visual selections by regex.
    -- set('v', 'S', mc.splitCursors)

    -- Append/insert for each line of visual selections.
    --  set('v', 'I', mc.insertVisual)
    --  set('v', 'A', mc.appendVisual)

    -- match new cursors within visual selections by regex.
    -- set('v', 'M', mc.matchCursors)

    -- Rotate visual selection contents.
    -- set('v', '<leader>t', function()
    --   mc.transposeCursors(1)
    -- end)
    -- set('v', '<leader>T', function()
    --   mc.transposeCursors(-1)
    -- end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'multicursorcursor', { link = 'cursor' })
    hl(0, 'multicursorvisual', { link = 'visual' })
    hl(0, 'multicursorsign', { link = 'signcolumn' })
    hl(0, 'multicursordisabledcursor', { link = 'visual' })
    hl(0, 'multicursordisabledvisual', { link = 'visual' })
    hl(0, 'multicursordisabledsign', { link = 'signcolumn' })
  end,
}
