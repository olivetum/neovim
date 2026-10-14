return {
  "simonwinther/cppman.nvim",
  version = "*",
  cmd = "CPPMan",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  opts = {
    source = "cppreference.com",
    picker = {
      provider = "fzf-lua",
    },
  },
  -- Buffer-local maps in C/C++ files only, so they don't show up in other
  -- filetypes. The require() calls load the plugin on first use.
  init = function()
    local keyword_pages
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "cpp", "c" },
      callback = function(args)
        if vim.bo[args.buf].filetype == "cpp" then
          vim.keymap.set("n", "K", function()
            local cppman = require("cppman")
            -- Bare keywords are not indexed; titles may include C++ version suffixes.
            if not keyword_pages then
              keyword_pages = {}
              for _, item in ipairs(require("cppman.index").load("cppreference.com")) do
                local keyword = item.page:match("^C%+%+ keyword: ([%w_]+)")
                if keyword then
                  keyword_pages[keyword] = keyword_pages[keyword] or item.page
                end
              end
            end
            local page = keyword_pages[vim.fn.expand("<cword>")]
            if page then
              cppman.open_for(page)
            else
              vim.lsp.buf.hover()
            end
          end, { buffer = args.buf, desc = "[C++] keyword reference or LSP hover" })
        end

        vim.keymap.set("n", "<leader>cu", function()
          require("cppman").open_for(vim.fn.expand("<cword>"))
        end, { buffer = args.buf, desc = "[C++] open under cursor" })

        vim.keymap.set("n", "<leader>ck", function()
          require("cppman").search()
        end, { buffer = args.buf, desc = "[C++] keyword search" })
      end,
    })
  end,
}
