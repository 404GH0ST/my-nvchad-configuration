local cmp = require("cmp")

return {
	import = "nvchad.blink.lazyspec",
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.conform")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		config = function()
			require("configs.rustaceanvim")
		end,
		lazy = false,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_initialized["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.nvim-lint")
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"404GH0ST/neocord",
		event = "VeryLazy",
		config = function()
			require("neocord").setup(require("configs.neocord"))
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = false,
		config = function(_, opts)
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local M = require("nvchad.configs.cmp")
			M.completion.completeopt = "menu,menuone,noselect"
			M.mapping["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = false,
			})
			table.insert(M.sources, { name = "crates" })
			table.insert(M.sources, { per_filetype = { codecompanion = { "codecompanion" } } })
			return M
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup(require("configs.dashboard"))
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		dependencies = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"astro",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"html",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			local opts = require("nvchad.configs.treesitter")
			opts.ensure_installed = {
				"zig",
				"asm",
				"lua",
				"astro",
				"python",
				"javascript",
				"java",
				"typescript",
				"tsx",
				"rust",
				"solidity",
				"go",
				"bash",
				"c",
				"cpp",
				"dockerfile",
				"css",
				"html",
				"cmake",
				"markdown",
				"make",
				"ini",
				"gowork",
				"gomod",
				"gosum",
				"json",
				"jsonc",
				"php",
				"sql",
				"dot",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"gitattributes",
				"passwd",
				"regex",
				"requirements",
				"toml",
				"xml",
				"yaml",
				"vim",
				"vimdoc",
			}
			return opts
		end,
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		lazy = true,
		keys = {
			{ "<leader>sc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>ss", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		config = function()
			require("codesnap").setup({
				has_breadcrumbs = true,
				save_path = "~/Pictures",
				watermark = "",
				bg_padding = 0,
			})
		end,
	},
	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- 	lazy = false,
	-- },
	-- Lazy.nvim
	-- {
	-- 	"hiasr/vim-zellij-navigator.nvim",
	-- 	config = function()
	-- 		require("vim-zellij-navigator").setup()
	-- 	end,
	-- },
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
	{
		-- Install markdown preview, use npx if available.
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
		},
	},
	-- {
	-- 	"Exafunction/windsurf.vim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		vim.g.codeium_disable_bindings = 1
	-- 		-- Change '<C-g>' here to any keycode you like.
	-- 		vim.keymap.set("i", "<C-f>", function()
	-- 			return vim.fn["codeium#Accept"]()
	-- 		end, { expr = true, silent = true })
	-- 		vim.keymap.set("i", "<C-,>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](1)
	-- 		end, { expr = true, silent = true })
	-- 		vim.keymap.set("i", "<C-.>", function()
	-- 			return vim.fn["codeium#CycleCompletions"](-1)
	-- 		end, { expr = true, silent = true })
	-- 		vim.keymap.set("i", "<c-x>", function()
	-- 			return vim.fn["codeium#Clear"]()
	-- 		end, { expr = true, silent = true })
	-- 	end,
	-- },
	{
		"supermaven-inc/supermaven-nvim",
		lazy = false,
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<C-f>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-j>",
				},
				-- disable_keymaps = true,
			})
		end,
	},
	{
		"karb94/neoscroll.nvim",
		lazy = false,
		opts = {},
	},
	{
		"Bekaboo/dropbar.nvim",
		lazy = false,
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},
	{
		"olimorris/codecompanion.nvim", -- The KING of AI programming
		cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
		dependencies = {
			"j-hui/fidget.nvim", -- Display status
			"ravitemer/codecompanion-history.nvim", -- Save and load conversation history
			{
				"ravitemer/mcphub.nvim", -- Manage MCP servers
				cmd = "MCPHub",
				build = "npm install -g mcp-hub@latest",
				config = true,
			},
			{
				"Davidyz/VectorCode", -- Index and search code in your repositories
				version = "*",
				build = "uv tool install vectorcode",
				dependencies = { "nvim-lua/plenary.nvim" },
			},
			{
				"HakonHarnes/img-clip.nvim", -- Share images with the chat buffer
				event = "VeryLazy",
				cmd = "PasteImage",
				opts = {
					filetypes = {
						codecompanion = {
							prompt_for_file_name = false,
							template = "[Image]($FILE_PATH)",
							use_absolute_path = true,
						},
					},
				},
			},
		},
		opts = require("configs.codecompanion"),
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
	},
	{
		"echasnovski/mini.diff",
		config = function()
			local diff = require("mini.diff")
			diff.setup({
				-- Disabled by default
				source = diff.gen_source.none(),
			})
		end,
	},
	{
		"cordx56/rustowl",
		version = "*", -- Latest stable version
		build = "cargo binstall rustowl",
		lazy = false, -- This plugin is already lazy
		opts = {
			client = {
				on_attach = function(_, buffer)
					vim.keymap.set("n", "<leader>o", function()
						require("rustowl").toggle(buffer)
					end, { buffer = buffer, desc = "Toggle RustOwl" })
				end,
			},
		},
	},
}
