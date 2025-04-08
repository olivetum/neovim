return {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			show_hidden = true,
			is_hidden_file = function(name)
				local m = name:match '^%.'
				return m ~= nil
			end,
			columns = {
				'icons',
				'permissions',
				'size',
				'mtime',
			},
		},
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
	},
	dependencies = { { 'echasnovski/mini.icons', opts = {} } },
	lazy = false,

	config = function(_, opts)
		require('oil').setup(opts)
	end,
}
