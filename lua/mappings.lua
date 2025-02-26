require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

local mappings = {
	n = {
		-- ["<C-h>"] = {
		-- 	"<cmd> TmuxNavigateLeft<CR>",
		-- 	"Left navigation tmux pane",
		-- },
		-- ["<C-j>"] = {
		-- 	"<cmd> TmuxNavigateDown<CR>",
		-- 	"Down navigation tmux pane",
		-- },
		-- ["<C-k>"] = {
		-- 	"<cmd> TmuxNavigateUp<CR>",
		-- 	"Up navigation tmux pane",
		-- },
		-- ["<C-l>"] = {
		-- 	"<cmd> TmuxNavigateRight<CR>",
		-- 	"Right navigation tmux pane",
		-- },
		["<leader>co"] = {
			"<cmd>lua require'jdtls'.organize_imports()<CR>",
			"Organize Imports",
		},
		["<leader>crv"] = {
			"<cmd>lua require('jdtls').extract_variable()<CR>",
			"Extract Variable",
		},
		["<leader>crc"] = {
			"<cmd>lua require('jdtls').extract_constant()<CR>",
			"Extract Constant",
		},
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"update crates",
		},
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
		},
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last go test",
		},
		["<leader>gsj"] = {
			"<cmd> GoTagAdd json <CR>",
			"Add json struct tags",
		},
		["<leader>gsy"] = {
			"<cmd> GoTagAdd yaml <CR>",
			"Add yaml struct tags",
		},
		["<leader>ih"] = {
			function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), nil)
			end,
			"Toggle inlay hint",
		},
		["<leader>lt"] = {
			function()
				require("lint").try_lint()
			end,
			"Trigger linting for current file",
		},
	},
	v = {
		["<leader>crv"] = {
			"<cmd>lua require('jdtls').extract_variable(true)<CR>",
			"Extract Variable",
		},
		["<leader>crc"] = { "<cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
		["<leader>crm"] = { "<cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
	},
}

for mode, maps in pairs(mappings) do
	for key, val in pairs(maps) do
		map(mode, key, val[1], { desc = val[2] })
	end
end
