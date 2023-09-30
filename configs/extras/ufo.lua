local spec = {
  "kevinhwang91/nvim-ufo",
  -- ft = { "quarto", "python" },
  lazy = false,
  dependencies = "kevinhwang91/promise-async",
  config = function()
    local ufo = require "ufo"

    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ("  %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "Comment" })
      return newVirtText
    end

    local function get_cell_folds(bufnr)
      local function handleFallbackException(err, providerName)
        if type(err) == "string" and err:match "UfoFallbackException" then
          return ufo.getFolds(bufnr, providerName)
        else
          return require("promise").reject(err)
        end
      end
      return ufo
        .getFolds(bufnr, "lsp")
        :catch(function(err)
          return handleFallbackException(err, "treesitter")
        end)
        :catch(function(err)
          return handleFallbackException(err, "indent")
        end)
        :thenCall(function(ufo_folds)
          local ok, jupynium = pcall(require, "jupynium")
          if ok then
            for _, fold in ipairs(jupynium.get_folds()) do
              table.insert(ufo_folds, fold)
            end
          end
          return ufo_folds
        end)
    end

    local ftMap = {
      python = get_cell_folds,
    }

    -- global handler
    ufo.setup {
      provider_selector = function(bufnr, filetype, buftype)
        return ftMap[filetype]
      end,
      fold_virt_text_handler = handler,
      preview = { win_config = { border = "single" } },
      open_fold_hl_timeout = 0,
    }
    require("core.utils").load_mappings "ufo"

    -- buffer scope handler
    -- will override global handler if it is existed
    local bufnr = vim.api.nvim_get_current_buf()
    ufo.setFoldVirtTextHandler(bufnr, handler)
  end,
}

return spec
