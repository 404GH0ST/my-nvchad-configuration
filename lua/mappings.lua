-- lua/core/mappings.lua
require("nvchad.mappings")

local map = vim.keymap.set

local mappings = {
	-- Normal Mode Mappings
	n = {
		[";"] = { ":", "CMD enter command mode" },
		["<leader>fm"] = {
			function()
				require("conform").format()
			end,
			"File Format with conform",
		},

		["<C-a>"] = { "<cmd>CodeCompanionActions<CR>", "AI: Action Palette" },
		["<leader>a"] = { "<cmd>CodeCompanionChat Toggle<CR>", "AI: Toggle Chat" },

		["<leader>rca"] = { "<cmd>RustLsp codeAction<CR>", "Rust Grouped Actions" },
		["<leader>co"] = { "<cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
		["<leader>crv"] = { "<cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
		["<leader>crc"] = { "<cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
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
			"Update crates",
		},
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"Debug Python test method",
		},
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug Go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last Go test",
		},
		["<leader>gsj"] = { "<cmd> GoTagAdd json <CR>", "Add json struct tags" },
		["<leader>gsy"] = { "<cmd> GoTagAdd yaml <CR>", "Add yaml struct tags" },
		["<leader>ih"] = {
			function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end,
			"Toggle inlay hints",
		},
		["<leader>lt"] = {
			function()
				require("lint").try_lint()
			end,
			"Trigger linting for current file",
		},
	},
	-- Visual Mode Mappings
	v = {
		["<C-a>"] = { "<cmd>CodeCompanionActions<CR>", "AI: Action Palette" },
		["<leader>a"] = { "<cmd>CodeCompanionChat Toggle<CR>", "AI: Toggle Chat" },
		["<LocalLeader>a"] = { "<cmd>CodeCompanionChat Add<CR>", "AI: Add code to chat" },

		["<leader>crv"] = { "<cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
		["<leader>crc"] = { "<cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
		["<leader>crm"] = { "<cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
	},
}

-- This loop applies all the mappings from the table above
for mode, maps in pairs(mappings) do
	for key, val in pairs(maps) do
		map(mode, key, val[1], { desc = val[2] })
	end
end
