local function run_tests()
  vim.cmd('term ' .. 'mvn test')
end
local function run_build()
  vim.cmd('term ' .. 'mvn build')
end
vim.keymap.set('n', '<leader>tv', function()
  run_tests()
end, { desc = 'Run Tests with Maven' })
vim.keymap.set('n', '<leader>bm', function()
  run_build()
end, { desc = 'Build with Maven' })
