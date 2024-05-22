return {
	"folke/which-key.nvim",
	opts = {
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "", -- symbol prepended to a group
		},
	},
	config = function(_, opts)
		require("which-key").setup(opts)
		require("which-key").register({
			{
				["<leader>"] = {
					d = { name = "󰃤 Debugger" },
					r = { name = " Runner" },
					s = { name = "󰔚 Sessions" },
					f = { name = " Find" },
					g = { name = "󰊢 Git" },
					l = { name = " LSP" },
					n = { name = "󰰓 Neovim" },
					o = { name = " Options" },
					p = { name = " Plugins" },
					t = { name = " Terminal" },
					T = { name = "󰙨 Tests" },
				},
				--Toggle Term
				t = {
					name = "Terminal",
					n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" }, -- NodeJS Terminal
					p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" }, -- Python Terminal
					f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal

					-- Play with size according to your needs.
					h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal,
					v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }, -- Vertical Terminal
				},
			},
		})
	end,
}
