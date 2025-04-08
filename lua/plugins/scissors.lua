return {
  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    opts = {
      snippetDir = vim.fn.stdpath("config") .. '/snippets',
      backdrop = {
        enabled = false,
        blend = 90, -- between 0-100
      },
    }
  },
  vim.keymap.set(
    "n",
    "<leader>se",
    function() require("scissors").editSnippet() end,
    { desc = "Snippet: Edit" }
  ),

  -- when used in visual mode, prefills the selection as snippet body
  vim.keymap.set(
    { "n", "x" },
    "<leader>sa",
    function() require("scissors").addNewSnippet() end,
    { desc = "Snippet: Add" }
  )
}
