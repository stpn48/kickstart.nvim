return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- Optional: for git status
      'nvim-tree/nvim-web-devicons', -- Not optional, just a regular dependency
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      icons = {
        filetype = {
          enabled = false, -- Ensure filetype icons are enabled
        },
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}

-- Ensure nvim-web-devicons is initialized
