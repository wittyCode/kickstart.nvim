local config = {
  cmd = { '/opt/homebrew/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    java = {
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath 'config' .. '/lang_servers/intellij-java-google-style.xml',
          profile = 'GoogleStyle',
        },
      },
    },
  },
}
require('jdtls').start_or_attach(config)
