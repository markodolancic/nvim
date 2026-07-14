vim.pack.add {
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/brenoprata10/nvim-highlight-colors',
	'https://github.com/catppuccin/nvim',
	'https://github.com/vyfor/cord.nvim',
}

vim.cmd.packadd('nvim.difftool')


vim.g.mapleader = ','
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
vim.opt.signcolumn = 'yes:1'
vim.opt.confirm = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.wildoptions:append { 'fuzzy' }
vim.opt.smoothscroll = true
vim.opt.statusline = '[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P'
vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.guifont = 'Iosevka:h35'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.cmd.colorscheme('catppuccin')

vim.cmd [[
    aunmenu PopUp
	autocmd! nvim.popupmenu
]]

vim.cmd('syntax off')

require('nvim-highlight-colors').setup {
    render = 'virtual',
	virtual_symbol = '●',
	virtual_symbol_suffix = '',
}


require('oil').setup {
    keymaps = { ['<C-h>'] = false },
	columns = { 'size', 'mtime' },
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
}

vim.keymap.set('n', '<leader><leader>', ':Oil<CR>', { silent = true })

vim.keymap.set('n', '<leader>a', function()
    vim.cmd('$argadd %')
	vim.cmd('argdedup')
end)

vim.api.nvim_create_autocmd('FileType', {
	callback = function() pcall(vim.treesitter.start) end,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.o.signcolumn = 'yes:1'
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.o.complete = 'o,.,w,b,u'
			vim.o.completeopt = 'menu,menuone,popup,noinsert'
			vim.lsp.completion.enable(true, client.id, args.buf)
		end
	end
})

vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.highlight.on_yank() end,
})

vim.g.clipboard = 'unnamedplus'

vim.filetype.add({
	extension = {
		env = "sh"
	},
	filename = {
		[".env"] = "sh",
	},
	pattern = {
		["%.env%.[%w_.-]+"] = "sh",
	},
})
