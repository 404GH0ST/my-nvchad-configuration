return {
	extensions = {
		history = {
			enabled = true,
			opts = {
				keymap = "gh",
				save_chat_keymap = "sc",
				auto_save = false,
				auto_generate_title = true,
				continue_last_chat = false,
				delete_on_clearing_chat = false,
				picker = "snacks",
				enable_logging = false,
				dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
			},
		},
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				make_vars = true,
				make_slash_commands = true,
				show_result_in_chat = true,
			},
		},
		vectorcode = {
			opts = {
				add_tool = true,
			},
		},
	},
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = "cmd: gpg --batch --quiet --decrypt ~/.gemini_api_key.gpg",
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = {
				name = "gemini",
				model = "gemini-2.5-flash",
			},
			roles = {
				user = "jergal",
			},
			keymaps = {
				send = {
					modes = {
						i = { "<C-CR>", "<C-s>" },
					},
				},
				completion = {
					modes = {
						i = "<C-x>",
					},
				},
			},
			slash_commands = {
				["buffer"] = {
					keymaps = {
						modes = {
							i = "<C-b>",
						},
					},
				},
				["fetch"] = {
					keymaps = {
						modes = {
							i = "<C-f>",
						},
					},
				},
				["help"] = {
					opts = {
						max_lines = 1000,
					},
				},
				["image"] = {
					keymaps = {
						modes = {
							i = "<C-i>",
						},
					},
					opts = {
						completion_provider = "cmp", -- blink|cmp|coc|default
						dirs = { "~/Documents/Screenshots" },
					},
				},
			},
		},
		inline = {
			adapter = {
				name = "gemini",
				model = "gemini-2.5-flash",
			},
		},
	},
	display = {
		action_palette = {
			provider = "default",
		},
		chat = {
			-- show_references = true,
			-- show_header_separator = false,
			-- show_settings = false,
			icons = {
				tool_success = "󰸞",
			},
		},
		diff = {
			provider = "mini_diff",
		},
	},
	opts = {
		log_level = "DEBUG",
	},
}
