---@type ChadrcConfig
local M = {}

M.ui = { theme = 'onedark' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(args.buf, true)
    end
  end
})

return M
