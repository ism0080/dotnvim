return {
  'goolord/alpha-nvim',
  config = function()
    local function pad(n)
      return { type = 'padding', val = n }
    end
    local is_git_repo = vim.fn.system('git rev-parse --is-inside-work-tree'):match 'true'

    local function get_repo_name()
      if is_git_repo then
        return vim.fn.system('git config --get remote.origin.url'):match '([^/]+)$'
      else
        return vim.fn.getcwd()
      end
    end

    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local repo_name = { type = 'text', val = get_repo_name(), opts = { position = 'center' } }

    local header = {
      type = 'text',
      val = os.date ' %H:%M ',
      opts = { position = 'center' },
    }

    local buttons = {
      type = 'group',
      val = {
        dashboard.button('r', 'Recent files', '<cmd>Telescope oldfiles<cr>'),
        dashboard.button('e', 'Explorer', '<cmd>Neotree filesystem reveal current<cr>'),
        dashboard.button('q', 'Quit', ':qa<CR>'),
      },
    }

    alpha.setup {
      layout = {
        pad(4),
        header,
        repo_name,
        pad(4),
        buttons,
      },
      position = 'center',
    }
  end,
}
