require 'config'

-- [[ lazy.nvim plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Install Plugins ]]
require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Smart and powerful commenting
  { 'numToStr/Comment.nvim', opts = {} },

  -- Adds git related signs to the gutter
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        deleted = { text = '_' },
        topdeleted = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- Prettier
  'prettier/vim-prettier',

  require 'plugins.telescope',
  require 'plugins.which-key',
  require 'plugins.theme',
  require 'lsp',
  require 'lsp.plugins.autocomplete',
  require 'lsp.plugins.autoformat',
  -- require 'plugins.mini',
  require 'plugins.treesitter',
  require 'plugins.lint',
  require 'plugins.gitsigns',
  require 'plugins.harpoon',
  require 'plugins.fugitive',
  require 'plugins.neo-tree',
  require 'plugins.autopairs',
  require 'plugins.lualine',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
