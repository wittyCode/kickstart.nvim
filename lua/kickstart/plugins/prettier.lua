-- nvim prettier plugin
return {
  'MunifTanjim/prettier.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    -- TODO: check if this can be replaced by none-ls
    'jose-elias-alvarez/null-ls.nvim',
  },
  config = function()
    require('prettier').setup()
  end,
}
