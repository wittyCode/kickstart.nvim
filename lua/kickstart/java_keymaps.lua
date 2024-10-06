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

local function run_spring_boot_docker_compose(debug)
  vim.cmd('term ' .. get_spring_boot_runner('docker_compose', debug))
end

vim.keymap.set('n', '<leader>rsl', function()
  run_spring_boot()
end, { desc = 'Run Spring Boot local' })
vim.keymap.set('n', '<leader>rsld', function()
  run_spring_boot(true)
end, { desc = 'Run Spring Boot local in debug mode' })
vim.keymap.set('n', '<leader>rsd', function()
  run_spring_boot_docker_compose()
end, { desc = 'Run Spring Boot docker' })
vim.keymap.set('n', '<leader>rsdd', function()
  run_spring_boot_docker_compose(true)
end, { desc = 'Run Spring Boot docker in debug mode' })
