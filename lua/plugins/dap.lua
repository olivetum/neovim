return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
      desc = "Toggle breakpoint",
    })
    vim.keymap.set("n", "<leader>dr", dap.continue, {
      desc = "Run debugger",
    })
  end,
}
