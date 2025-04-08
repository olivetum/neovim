vim.diagnostic.config({ virtual_text = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- UI settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.showmode = false      -- Don't show mode in command line
vim.opt.signcolumn = "yes"    -- Always show the signcolumn
vim.opt.cursorline = true     -- Highlight current line
vim.opt.scrolloff = 10        -- Keep 10 lines visible above/below cursor
vim.opt.splitright = true     -- Open vertical splits to the right
vim.opt.splitbelow = true     -- Open horizontal splits below
-- Editor behavior
vim.opt.mouse = "a"           -- Enable mouse in all modes
vim.opt.timeoutlen = 300      -- Time to wait for mapped sequence
vim.opt.updatetime = 250      -- Faster completion and UI updates
vim.opt.breakindent = true    -- Indent wrapped lines
vim.opt.undofile = true       -- Save undo history
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Search settings
vim.opt.ignorecase = true    -- Case insensitive search
vim.opt.smartcase = true     -- Case sensitive when uppercase present
vim.opt.inccommand = "split" -- Preview substitutions in split window

-- Appearance
vim.opt.list = true -- Show some invisible characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Netrw settings
vim.g.netrw_bufsettings = "noma nomod nu rnu nobl nowrap ro"
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0

-- Nerd Font detection
vim.g.have_nerd_font = true

-- Clipboard settings (delayed to improve startup time)
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
end)

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#565F89", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#565F89", bold = true })
