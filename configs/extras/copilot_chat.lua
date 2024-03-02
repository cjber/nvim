local spec = {
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = false,
  opts = {
    show_help = "yes",
    debug = false,
    disable_extra_info = "no",
    language = "English",
  },
  build = function()
    vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
  end,
  event = "VeryLazy",
  keys = {
    { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "CopilotChat" },
  },
}

return spec
