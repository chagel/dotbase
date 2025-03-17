return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function()
    return {
      defaults = {
        prompt_position = 'top',
        layout_strategy = 'horizontal',
        layout_config = { height = 0.5 },
      },
    }
	end	
}
