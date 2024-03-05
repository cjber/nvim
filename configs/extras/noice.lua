local spec = {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    cmdline = { enabled = true, view = "cmdline_popup" },
    messages = { enabled = true, view = "mini", view_error = "mini", view_warn = "mini" },
    redirect = { enabled = true, view = "mini" },
    notify = { enabled = true, view = "mini" },
    errors = { enabled = true, view = "mini" },
    last = { enabled = true, view = "mini" },
    lsp = {
      message = { enabled = true, view = "mini" },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    views = {
      cmdline_popup = {
        border = { padding = { 0, 1 }, style = "single" },
        win_options = {
          winhighlight = { FloatBorder = "FloatBorder", FloatTitle = "FloatBorder" },
        },
        position = { row = "30%", col = "50%" },
      },
      cmdline_popupmenu = {
        border = "single",
        win_options = { winhighlight = { FloatBorder = "FloatBorder" } },
        position = { row = "50%", col = "50%" },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

return spec
