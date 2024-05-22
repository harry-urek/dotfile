return {
	"romgrk/barbar.nvim",
	dpendencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	config = function()
		local bar = require("barbar")
		vim.g.barbar_auto_setup = false
		bar.setup({
			theme = "tokyonight",

			animation = true,
			clickable = true,

			maximum_padding = 4,
			minimum_padding = 1.5,
			hide = {
				extensions = true,
			},
			icons = {
				-- Configure the base icons on the bufferline.
				-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
				buffer_index = false,
				buffer_number = false,
				button = "",
				-- Enables / disables diagnostic symbols
				--Error = " ", Warn = " ", Hint = "󰠠 ", Info = " "
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " ", highlight = false },
					[vim.diagnostic.severity.WARN] = { enabled = true, icon = " ", highlight = false },
					[vim.diagnostic.severity.INFO] = { enabled = false },
					[vim.diagnostic.severity.HINT] = { enabled = true, icon = "󰠠 ", highlight = false },
				},
				gitsigns = {
					added = { enabled = true, icon = "+" },
					changed = { enabled = true, icon = "~" },
					deleted = { enabled = true, icon = "-" },
				},
				filetype = {
					-- Sets the icon's highlight group.
					-- If false, will use nvim-web-devicons colors
					custom_colors = false,

					-- Requires `nvim-web-devicons` if `true`
					enabled = true,
				},
				separator = { left = "┏", right = " ┃" },

				-- If true, add an additional separator at the end of the buffer list
				separator_at_end = false,

				-- Configure the icons on the bufferline when modified or pinned.
				-- Supports all the base icon options.
				modified = { button = "●" },
				pinned = { button = "", filename = true },

				-- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
				preset = "default",

				-- Configure the icons on the bufferline based on the visibility of a buffer.
				-- Supports all the base icon options, plus `modified` and `pinned`.
				alternate = { filetype = { enabled = true } },
				current = { buffer_index = true },
				inactive = { button = "󰅖" },
			},
			insert_at_end = true,
			semantic_letters = true,
			sidebar_filetypes = {
				-- Use the default values: {event = 'BufWinLeave', text = nil}
				NvimTree = true,
				-- Or, specify the text used for the offset:
				undotree = { text = "undotree" },
				-- Or, specify the event which the sidebar executes when leaving:
				["neo-tree"] = { event = "BufWipeout" },
				-- Or, specify both
				Outline = { event = "BufWinLeave", text = "symbols-outline" },
			},
		})
	end,
}
