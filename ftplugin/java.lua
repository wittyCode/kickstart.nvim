local bundles = {
  -- NOTE: update this with local filepath of java debug jar (e.g. after version change)
  vim.fn.glob '/Users/wittycode/dev/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar',
}

-- NOTE: this filepath needs to point to vscode-java-test jar
vim.list_extend(bundles, vim.split(vim.fn.glob '/Users/wittycode/dev/java/vscode-java-test/server/*.jar', '\n'))

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
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.hamcrest.CoreMatchers.*',
          'org.junit.jupiter.api.Assertions.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
          'org.mockito.Mockito.*',
        },
        importOrder = { 'java', 'javax', 'com', 'org' },
      },
      codeGeneration = {
        toString = {
          template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
        },
        useBlocks = true,
      },
    },
  },
  init_options = {
    bundles = bundles,
  },
}
require('jdtls').start_or_attach(config)
