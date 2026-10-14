return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "EdenEast/nightfox.nvim" }, -- lazy
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        transparent = true, -- Enables background transparency
        theme = "wave", -- Options: wave, dragon, lotus
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none", -- Makes line numbers column transparent
              },
            },
          },
        },
        overrides = function(colors)
          return {
            -- Makes floating windows (LSP info, Autocomplete) transparent
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- Makes plugin managers (Lazy, Mason) match the transparency
            LazyNormal = { bg = "none" },
            MasonNormal = { bg = "none" },
          }
        end,
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },
}
