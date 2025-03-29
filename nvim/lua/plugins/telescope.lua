return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    local actions = require('telescope.actions')
    return {
      defaults = {
        prompt_position = 'top',
        layout_strategy = 'horizontal',
        layout_config = { height = 0.5 },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["d"] = actions.delete_buffer,
            },
          },
        },
      },
    }
	end
}
