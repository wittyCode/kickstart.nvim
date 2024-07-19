-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local jdtls = require 'jdtls'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>or', function()
      dap.repl.toggle { height = 15 }
    end, { desc = 'Debug: Open REPL' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>dl', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>dk', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set('n', '<leader>tc', jdtls.test_class, { desc = 'Test class (DAP)' })
    vim.keymap.set('n', '<leader>tm', jdtls.test_nearest_method, { desc = 'Test method (DAP)' })

    -- jdtls focused keymaps
    vim.keymap.set('n', '<leader>oi', jdtls.organize_imports, { desc = 'Organize imports ' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>dsr', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- WARN: this is just doc of how the function was set up outside of keymap
    -- function attach_to_debug()
    --   local dap = require 'dap'
    --   dap.configurations.java = {
    --     {
    --       type = 'java',
    --       request = 'attach',
    --       name = 'Attach to the process',
    --       hostName = 'localhost',
    --       port = '5005',
    --     },
    --   }
    --   dap.continue()
    -- end

    -- TODO: see if I can make this work, but right now it would be enough to just run the main class in debug mode
    -- vim.keymap.set('n', '<leader>da', function()
    --   dap.configurations.java = {
    --     {
    --       type = 'java',
    --       request = 'attach',
    --       name = 'Attach to the process',
    --       hostName = '127.0.0.1',
    --       port = '5005',
    --     },
    --   }
    --   dap.continue()
    -- end, { desc = 'debugger: attach to running debug server' })

    -- Install golang specific config
    require('dap-go').setup()
  end,
}
