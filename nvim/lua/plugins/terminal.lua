return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            open_mapping = [[<M-t>]],
            shell = "powershell",
            direction = 'float',
            float_opts = {
                border = 'curved',
                title_pos = 'center',
            },
            size = 10
        }

        function _G.set_terminal_keymaps()
            vim.keymap.set('t', [[<c-\>]], 'vim.cmd.ToggleTerm')
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        -- function _G.set_terminal_keymaps()
            --   local opts = {buffer = 0}
            --   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            --   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            --   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            --   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            --   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            --   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            --   vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            -- end

    end
}
