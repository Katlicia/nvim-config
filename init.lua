require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end

		local bufname = vim.api.nvim_buf_get_name(0)
		if bufname == "" then
			return
		end

		local dir = vim.fn.fnamemodify(bufname, ":p:h")
		if vim.fn.isdirectory(dir) == 1 then
			vim.cmd("cd " .. dir)
		end
	end,
})


---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.discordrichpresence"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.indentline"),
	require("plugins.misc"),
	require("plugins.loveconfig"),
})
