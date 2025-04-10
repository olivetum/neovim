return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",

    keymaps = {
      vim.keymap.set("n", "<leader>nn", ":Neorg<CR>"),
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "norg",
        callback = function()
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = true, desc = "Neorg: " .. desc })
          end
          map("<leader>td", "<Plug>(neorg.qol.todo-items.todo.task-done)", "[T]ask [D]one")
          map("<leader>tt", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", "[T]ask [C]ycle")
          map("<leader>th", "<Plug>(neorg.qol.todo-items.todo.task-on-hold)", "[T]ask on [H]old")
          map("<leader>ti", "<Plug>(neorg.qol.todo-items.todo.task-important)", "[T]ask [I]mportant")
          map("<leader>tc", "<Plug>(neorg.qol.todo-items.todo.task-cancelled)", "[T]ask [C]ancelled")
        end,
      })

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
