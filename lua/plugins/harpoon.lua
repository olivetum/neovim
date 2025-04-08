return {
	'ThePrimeagen/harpoon',
	config = function()
		local mark = require 'harpoon.mark'
		local ui = require 'harpoon.ui'

		vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[H]arpoon [A]dd File' })
		vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = '[H]arpoon [E]dit Menu' })

		vim.keymap.set('n', '<C-h>', function()
			ui.nav_file(1)
		end, { desc = '[H]arpoon Nav [1]' })
		vim.keymap.set('n', '<C-j>', function()
			ui.nav_file(2)
		end, { desc = '[H]arpoon Nav [2]' })
		vim.keymap.set('n', '<C-n>', function()
			ui.nav_file(3)
		end, { desc = '[H]arpoon Nav [3]' })
		vim.keymap.set('n', '<C-s>', function()
			ui.nav_file(4)
		end, { desc = '[H]arpoon Nav [4]' })
	end,
}
