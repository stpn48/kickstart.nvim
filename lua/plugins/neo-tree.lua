return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'muniftanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<cr>', desc = 'Neotree reveal', silent = true },
    { '<leader>cc', ':lua CollapseNeoTree()<cr>', desc = 'Neotree Collapse All', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  config = function()
    function CollapseNeoTree()
      local neotree = require 'neo-tree.sources.filesystem'
      local manager = require 'neo-tree.sources.manager'

      local state = manager.get_state 'filesystem'
      if not state then
        return
      end

      -- Collapse all expanded folders manually
      for id, node in pairs(state.nodes) do
        if node.type == 'directory' and node:is_expanded() then
          neotree.toggle_node(state, id)
        end
      end

      -- Refresh Neo-tree after collapsing
      neotree.refresh(state)
    end

    vim.api.nvim_set_keymap('n', '<leader>cc', ':lua CollapseNeoTree()<CR>', { noremap = true, silent = true })
  end,
}
