vim.opt.hlsearch = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')

-- remap to not replace buffer with token that was pasted over
vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>co', ':only<CR>', { desc = 'close all but current window' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- java and spring boot
local function get_spring_boot_runner(profile, debug)
  local debug_param = ''
  if debug then
    debug_param = '--spring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=127.0.0.1:5005" '
    print(debug_param)
  end

  local profile_param = ''
  if profile then
    profile_param = '--spring.profiles.active=' .. profile .. ' '
  end

  local args_prefix = ''
  if profile or debug then
    args_prefix = "--args='"
  end

  local full_command = './gradlew bootRun ' .. args_prefix .. profile_param .. debug_param .. "'"
  print(full_command)

  return full_command
end

-- TODO: this is the maven way - use implementation for different keymap
-- function get_spring_boot_runner(profile, debug)
--   local debug_param = ""
--   if debug then
--     debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
--   end
--
--   local profile_param = ""
--   if profile then
--     profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
--   end
--
--   return 'mvn spring-boot:run ' .. profile_param .. debug_param
-- end

-- TODO: add other profiles?, probably for different keymaps
local function run_spring_boot(debug)
  vim.cmd('term ' .. get_spring_boot_runner('local', debug))
end

vim.keymap.set('n', '<leader>rs', function()
  run_spring_boot()
end, { desc = 'Run Spring Boot' })
vim.keymap.set('n', '<leader>rsd', function()
  run_spring_boot(true)
end, { desc = 'Run Spring Boot in debug mode' })
