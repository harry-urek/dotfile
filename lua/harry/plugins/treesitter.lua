return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "go", "python", "javascript" },
			highlight = { enable = true },
			incremental_selection = {
				enable = true,
				-- SEE: https://github.com/nvim-treesitter/nvim-treesitter/issues/4945
				-- SEE: https://github.com/UserNobody14/tree-sitter-dart/issues/48
				disable = { "dart" },
				keymaps = {
					init_selection = false,
					node_incremental = "g)",
					scope_incremental = "g}",
					node_decremental = "g(",
				},
			},
			indent = { enable = true },

			-- extra modules

			-- nvim-treesitter-textobjects
			textobjects = {
				select = {
					enable = true,
					-- for `zig`, SEE: https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/461
					--[[ disable = { "dart", "zig" }, ]]
					lookahead = true,
					-- keymaps = {
					-- 	["aB"] = "@block.outer",
					-- 	["iB"] = "@block.inner",
					-- 	["ic"] = "@conditional.inner",
					-- 	["ac"] = "@conditional.outer",
					-- 	["af"] = "@function.outer",
					-- 	["if"] = "@function.inner",
					-- 	["al"] = "@loop.outer",
					-- 	["il"] = "@loop.inner",
					-- 	["is"] = "@statement.inner",
					-- 	["as"] = "@statement.outer",
					-- 	["aC"] = "@class.outer",
					-- 	["iC"] = "@class.inner",
					-- },
				},
			},

			-- nvim-ts-autotag
			autotag = { enable = true },
		})
	end,
}
