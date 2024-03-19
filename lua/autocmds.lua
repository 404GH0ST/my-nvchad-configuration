require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd

-- Auto enable Inlay_hint
autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(args.buf, true)
		end
	end,
})
