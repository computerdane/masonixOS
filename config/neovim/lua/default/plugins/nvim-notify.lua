return {
	{
		"rcarriga/nvim-notify",
		config = function()
			local status_ok, notify = pcall(require, "notify")
			if not status_ok then
				print("Status of the plugin nvim-notify is not good.")
				return
			end

			--Set default notifications to nvim-notify ones
			vim.notify = notify

			notify.setup({
				render = "minimal",
			})
			--
			-- vim.keymap.set {
			-- 	"<leader>un",
			-- 	function()
			-- 		require("notify").dismiss({ silent = true, pending = true })
			-- 	end
			-- }
		end,

		keys = {
			-- swapping buffers between windows
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all notifications"
			},
		},
	}
	-- {
	-- 	"vigoux/notifier.nvim",
	-- 	config = function()
	-- 		local notify = require 'notifier'.setup {
	-- 			-- You configuration here
	-- 		}
	--
	-- 		vim.notify = notify
	-- 	end
	-- }
}
