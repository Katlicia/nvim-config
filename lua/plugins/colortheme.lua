return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
            transparent = true,
            saturation = 1,
            variant = "default",
    })
    vim.cmd("colorscheme cyberdream")
  end,
}

