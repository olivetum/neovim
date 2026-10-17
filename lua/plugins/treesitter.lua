return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.setup({})
    treesitter.install({
      "bash",
      "c",
      "cpp",
      "css",
      "diff",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter-features", { clear = true }),
      callback = function(event)
        local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
        if not lang or not vim.list_contains(treesitter.get_available(), lang) then
          return
        end

        local function enable()
          if
            not vim.api.nvim_buf_is_valid(event.buf)
            or vim.treesitter.language.get_lang(vim.bo[event.buf].filetype) ~= lang
            or not pcall(vim.treesitter.get_parser, event.buf, lang)
          then
            return
          end

          vim.treesitter.start(event.buf, lang)
          -- Keep Ruby's regex highlighting and built-in indentation.
          if lang == "ruby" then
            vim.bo[event.buf].syntax = "ruby"
          elseif vim.treesitter.query.get(lang, "indents") then
            vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end

        if vim.list_contains(treesitter.get_installed(), lang) then
          enable()
        else
          -- Preserve automatic installation for other supported filetypes.
          treesitter.install({ lang }):await(vim.schedule_wrap(function(err)
            if not err then
              enable()
            end
          end))
        end
      end,
    })
  end,
}
