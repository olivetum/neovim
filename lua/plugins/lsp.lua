return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { "saghen/blink.cmp" },
    },
    opts = {
      servers = {
        lua_ls = {},
        tsserver = {},
        emmet_language_server = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
          },
          init_options = {
            includeLanguages = {},
            excludeLanguages = {},
            extensionsPath = {},
            preferences = {},
            showAbbreviationSuggestions = true,
            showExpandedAbbreviation = "always",
            showSuggestionsAsSnippets = false,
            syntaxProfiles = {},
            variables = {},
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for server, config in pairs(opts.servers) do
        -- Merge our enhanced capabilities with any server-specific ones
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("<leader>ln", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>la", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
          map("<leader>lr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("<leader>li", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("<leader>ld", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("<leader>lD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
          map("<leader>O", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
          map("<leader>W", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
        end,
      })
    end,
  },
}
