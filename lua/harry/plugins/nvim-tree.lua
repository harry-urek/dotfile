return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")
		local api = require("nvim-tree.api")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
		vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })

		-- configure nvim-tree
		nvimtree.setup({

			view = {
				width = 35,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})
		local function edit_or_open()
			local node = api.tree.get_node_under_cursor()
			if node.nodes ~= nil then
				api.node.open.edit()
			else
				api.node.open.edit()
				api.tree.close()
			end
		end

		local function vsplit_preview()
			local node = api.tree.get_node_under_cursor()
			if node.nodes ~= nil then
				-- expand or collapse folder
				api.node.open.edit()
			else
				-- open file as vsplit
				api.node.open.vertical()
			end

			-- Finally refocus on tree if it was lost
			api.tree.focus()
		end

		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "ga", function()
			local node = api.tree.get_node_under_cursor()
			local gs = node.git_status.file

			-- If the current node is a directory get children status
			if gs == nil then
				gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
					or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
			end

			-- If the file is untracked, unstaged or partially staged, we stage it
			if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
				vim.cmd("silent !git add " .. node.absolute_path)

			-- If the file is staged, we unstage
			elseif gs == "M " or gs == "A " then
				vim.cmd("silent !git restore --staged " .. node.absolute_path)
			end

			api.tree.reload()
		end, { desc = "git add file" }) -- toggle file explorer

		-- global
		keymap.set("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true })

		-- on_attach
		--[[ 	keymap.set("n", "l", edit_or_open, { desc = "Edit Or Open" }) ]]
		keymap.set("n", "L", vsplit_preview, { desc = "Vsplit Preview" })
		keymap.set("n", "h", api.tree.close, { desc = "Close" })
		keymap.set("n", "H", api.tree.collapse_all, { desc = "Collapse All" })
	end,
}
