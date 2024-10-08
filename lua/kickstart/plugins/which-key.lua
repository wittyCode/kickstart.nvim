return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>c', group = '[C]ode' },
      { '<leader>c_', hidden = true },
      { '<leader>d', group = '[D]ebug' },
      { '<leader>d_', hidden = true },
      { '<leader>r', group = '[R]ename / [R]un' },
      { '<leader>r_', hidden = true },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>w_', hidden = true },
      { '<leader>t', group = '[T]est' },
      { '<leader>t_', hidden = true },
      { '<leader>g', group = '[G]itsigns' },
      { '<leader>g_', hidden = true },
      { '<leader>b', group = '[B]uild' },
      { '<leader>b_', hidden = true },
    }
  end,
}
