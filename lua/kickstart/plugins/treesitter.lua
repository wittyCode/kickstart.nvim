return { -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      { 'windwp/nvim-ts-autotag' },
    },
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'html',
        'lua',
        'markdown',
        'markdown_inline',
        'vim',
        'vue',
        'java',
        'javascript',
        'javascriptreact',
        'jsx',
        'typescript',
        'typescriptreact',
        'tsx',
        'vimdoc',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {
      -- Removed markdown due to errors
      filetypes = {
        'handlebars',
        'html',
        'javascript',
        'javascriptreact',
        'jsx',
        'tsx',
        'typescript',
        'typescriptreact',
        'vue',
        'xml',
      },
    },
  },
}
