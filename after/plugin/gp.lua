require("gp").setup({
	openai_api_key = "",
	hooks = {
		BufferChatNew = function(gp, _)
			vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew popup")
		end,

		BufferReplaceNew = function(gp, _)
			vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "Prepend")
		end,
	}
})
