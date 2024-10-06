local function run_tests()
  vim.cmd('term ' .. './gradlew test')
end
local function run_build()
  vim.cmd('term ' .. './gradlew build')
end
vim.keymap.set('n', '<leader>tg', function()
  run_tests()
end, { desc = 'Run Tests with Gradle' })
vim.keymap.set('n', '<leader>bg', function()
  run_build()
end, { desc = 'Build with Gradle' })
