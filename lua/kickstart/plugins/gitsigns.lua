-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame_opts = {},
  },

  vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>'),
  vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>'),
  vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>'),
}
