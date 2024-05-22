return {
	"akinsho/toggleterm.nvim",
	cmd = {
		"ToggleTerm",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
	},
	config = function()
		local tterm = require("toggleterm")

		tterm.setup({

			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.4
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.5
				end
			end,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = false,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			autochdir = true,
			highlights = {
				NormalFloat = {
					link = "Normal",
				},
				FloatBorder = {
					link = "FloatBorder",
				},
			},
			float_opts = {
				border = "rounded",
				height = 25,
				width = 95,
				winblend = 0,
			},
		})
		function _G.set_terminal_keymaps()
			local opts = { noremap = true }
			vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
			vim.api.nvimfbuf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
			vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		local node = Terminal:new({ cmd = "node", hidden = true })

		function _NODE_TOGGLE()
			node:toggle()
		end

		local python = Terminal:new({ cmd = "python3", hidden = true })

		function _PYTHON_TOGGLE()
			python:toggle()
		end
	end,
}
