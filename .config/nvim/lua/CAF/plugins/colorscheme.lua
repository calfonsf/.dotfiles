function Colorscheme(theme)
	Color = Color or theme
	vim.cmd.colorscheme(color)
end

return{
	{"folke/tokyonight.nvim", lazy = true, priority = 1000},
	{ 'rose-pine/neovim', lazy = true, name = 'rose-pine'},
}
