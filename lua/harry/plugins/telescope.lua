return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.4",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local pickers = {}

		pickers.find_files = {
			layout_config = { height = 0.4 },
			theme = "ivy",
			previewer = false,
			disable_devicons = true, -- SEE: https://github.com/nvim-telescope/telescope.nvim/issues/1222
		}

		pickers.quickfix = {
			layout_config = { height = 0.4 },
			theme = "ivy",
			disable_devicons = true,
			fname_width = 60,
		}
		pickers.loclist = pickers.quickfix

		pickers.buffers = {
			layout_config = { height = 0.4 },
			theme = "dropdown",
			previewer = false,
			mappings = {
				i = {
					["<C-d>"] = require("telescope.actions").delete_buffer,
				},
			},
			disable_devicons = true,
		}

		pickers.help_tags = {
			theme = "dropdown",
			previewer = false,
		}

		pickers.live_grep = {
			layout_config = {
				anchor = "N",
				height = 0.35,
				mirror = true,
				width = 0.55,
			},
			theme = "dropdown",
			disable_devicons = true,
		}

		pickers.filetypes = {
			layout_config = {
				width = 0.25,
				height = 0.5,
			},
		}

		pickers.git_commits = {
			layout_config = pickers.live_grep.layout_config,
			theme = "dropdown",
		}
		pickers.git_bcommits = pickers.git_commits
		pickers.git_branches = {
			theme = "dropdown",
			previewer = false,
		}
		pickers.git_status = {
			layout_config = { horizontal = { preview_width = 0.6 } },
			git_icons = {
				renamed = "→",
			},
		}

		pickers.lsp_document_symbols = {
			layout_config = {
				anchor = "N",
				height = 0.35,
				mirror = true,
				width = 0.50,
			},
			previewer = false,
			theme = "dropdown",
		}
		pickers.lsp_workspace_symbols = {
			layout_config = { height = 0.4 },
			theme = "ivy",
		}
		pickers.lsp_references = {
			layout_strategy = "vertical",
			layout_config = {
				preview_cutoff = 10,
				preview_height = 0.55,
				anchor = "S",
				width = 0.7,
				height = 0.9,
			},
		}
		pickers.lsp_implementations = pickers.lsp_references
		pickers.lsp_definitions = pickers.lsp_references

		pickers.diagnostics = {
			layout_config = { height = 0.4 },
			theme = "ivy",
			previewer = false,
		}

		telescope.setup({
			pickers = pickers,

			defaults = {

				layout_strategy = "flex",
				layout_config = {
					horizontal = { preview_width = 0.6 },
				},
				prompt_prefix = " → ", -- digraph: ->
				selection_caret = "  ", -- SEE: https://github.com/nvim-telescope/telescope.nvim/issues/1841
				dynamic_preview_title = true,
				results_title = false,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, --move to prev result
						["<C-j>"] = actions.move_selection_next, --move to next ressult
						["<C-q>"] = actions.send_selected_to_qflist,
						["<C-s>"] = actions.select_horizontal,
						--[[ 	["<M-p>"] = actions.layout.toggle_preview, ]]
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ft", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy strng pattern in curr file" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
}
