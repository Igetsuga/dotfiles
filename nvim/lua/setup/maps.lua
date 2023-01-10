local function map(m,k,v)
	vim.keymap.set(m,k,v, {noremap = true, silent = false})
end


-- Map <leader> to space
-- vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = ","
vim.g.localmapleader = ","
vim.o.timeoutlen = 9999



map('i', '<leader>tb', '<CMD>TagbarToggle<CR>')
map('n', '<leader>tb', '<CMD>TagbarToggle<CR>')

map('i', 'jk', '<ESC>')
map('n', '<leader>h', '<CMD>nohlsearch<CR>')

map('n', '<C-m>', 'gcc') -- Ctr-m : to comment in normal mode 
map('x', '<C-m>', 'gcc') -- Ctr-m : to comment in visual mode

map('n', '<C-s>', '<CMD>w<CR>') -- Ctr-s : to save the file in nmode 
map('i', '<C-s>', '<ESC><CMD>w<CR>') -- Ctr-s : to save the file in imode

map('n', '<C-r>', '<CMD>so%<CR>') -- Ctr-r : to read the file in nmode
map('i', '<C-r>', '<ESC><CMD>so%<CR>') -- Ctr-r : to read the file in imode
-- map('n', '%', 



-- Fix * (Keep cursor position, don't move to next match)
map('n', '*', '*N')

-- Fix n and N. Keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- Mimic shell movements
map('i', '<C-E>', '<C-o>$')
map('i', '<C-A>', '<C-o^>')

-- Quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- Quit nvim 
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/O inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')


-- Move through windows
map('n', 'C-h', '<CMD>tabp<CR>')
map('n', 'C-l', '<CMD>tabn<CR>')

-- Move to the next/previous buffer
map('n', 'C-x', '<CMD>bp<CR>')
map('n', 'C-z', '<CMD>bn<CR>')

-- split window
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

map('n', '<C-j>', '<C-W>j')
map('i', '<C-j>', '<C-W>j')

map('n', '<C-k>', '<C-W>k')
map('i', '<C-k>', '<C-W>k')

map('n', '<C-h>', '<C-W>h')
map('i', '<C-h>', '<C-W>h')

map('n', '<C-l>', '<C-W>l')
map('i', '<C-l>', '<C-W>l')
-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')
