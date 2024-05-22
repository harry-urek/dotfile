return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local comment = require("Comment")

		comment.setup({
			ignore = "^$",
			toggler = {
				line = "<leader>cc",
				block = "<leader>bc",
			},
			opleader = {
				line = "<leader>c",
				block = "<leader>b",
			},
		})
	end,
}
