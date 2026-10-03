return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = { "clangd", "clang-format", "codelldb" }, -- list of tools to auto‑install
      })
    end,
  },
}
