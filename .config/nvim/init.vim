"Setting line numbers
:set number


"Restoring cursor shape when leaving nvim
augroup Shape
	autocmd!
	autocmd VimLeave * set guicursor=a:ver90
augroup END
