local vscode = require('vscode')

vim.keymap.set("n", "<leader>ff", function() vscode.action("workbench.action.quickOpen") end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() vscode.action("workbench.action.findInFiles") end, { desc = "Find Files" })


-- Folding Vscode issue
vim.api.nvim_set_keymap('n', 'zM', '<Cmd>call VSCodeNotify("editor.foldAll")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zR', '<Cmd>call VSCodeNotify("editor.unfoldAll")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zc', '<Cmd>call VSCodeNotify("editor.fold")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zC', '<Cmd>call VSCodeNotify("editor.foldRecursively")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zo', '<Cmd>call VSCodeNotify("editor.unfold")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zO', '<Cmd>call VSCodeNotify("editor.unfoldRecursively")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'za', '<Cmd>call VSCodeNotify("editor.toggleFold")<CR>', { noremap = true, silent = true })