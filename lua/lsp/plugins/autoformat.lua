local jsFmt = function(bufnr)
  -- if require('conform').get_formatter_info('eslint_d', bufnr).available then
  -- return { 'prettierd', 'eslint_d' }
  -- else
  return { 'prettier', 'eslint' }
  -- end
end

return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = function(bufnr)
        return jsFmt(bufnr)
      end,
      javascriptreact = function(bufnr)
        return jsFmt(bufnr)
      end,
      typescript = function(bufnr)
        return jsFmt(bufnr)
      end,
      typescriptreact = function(bufnr)
        return jsFmt(bufnr)
      end,
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { "prettierd", "prettierd", stop_after_first = true },
    },
  },
}
