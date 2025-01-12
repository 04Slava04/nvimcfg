" === Основные настройки ===
set number                    " Включить номера строк
set tabstop=4                 " Ширина табуляции
set shiftwidth=4              " Шаг автоотступа
set expandtab                 " Преобразование табов в пробелы
set smartindent               " Умный отступ
set mouse=a                   " Включить мышь
set clipboard=unnamedplus     " Общий буфер обмена с системой
set updatetime=300            " Ускорить обновление для плагинов
set signcolumn=yes            " Постоянно показывать колонку для знаков
set noswapfile
set encoding=utf-8
set termguicolors             " Поддержка 24-битных цветов

" === Плагины ===
call plug#begin('~/.vim/plugged')

" Управление плагинами
Plug 'junegunn/vim-plug'

" Подсветка синтаксиса и автодополнение для Python
Plug 'dense-analysis/ale'                " Линтер и фиксер
Plug 'neovim/nvim-lspconfig'             " Конфигурация LSP
Plug 'hrsh7th/nvim-cmp'                  " Автодополнение
Plug 'hrsh7th/cmp-nvim-lsp'              " Источник LSP для автодополнения
Plug 'hrsh7th/cmp-buffer'                " Источник для буферов
Plug 'hrsh7th/cmp-path'                  " Источник для путей
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Улучшенная подсветка

" Поиск и навигация
Plug 'nvim-telescope/telescope.nvim'    " Мощный поиск
Plug 'nvim-lua/plenary.nvim'            " Библиотека для Telescope
Plug 'preservim/nerdtree'               " Файловый менеджер

" Форматирование кода
Plug 'psf/black', {'branch': 'main'}    " Форматирование Python

" Тема Gruvbox
Plug 'morhetz/gruvbox'

"автосохранениset noswapfileе
Plug 'Pocco81/auto-save.nvim'

call plug#end()

" Горячая клавиша для запуска Python скрипта
nnoremap <leader>r :!python3 %<CR>

" === Настройки плагинов ===

" Настройка ALE для линтинга
let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {'python': ['black']}
let g:ale_fix_on_save = 1

" Настройка nvim-lspconfig для LSP
lua << EOF
-- Конфигурация LSP для Python через pyright
require('lspconfig').pyright.setup{}
EOF

lua << EOF
-- Подключение автодополнения
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- Если нужен сниппет-менеджер, можно подключить
    end,
  },
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  })
}
EOF

lua << EOF
-- Конфигурация treesitter для Python
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'python',
  highlight = { enable = true },
}
EOF

lua << EOF
vim.api.nvim_create_autocmd("CursorHold",{
    callback = function()
        vim.diagnostic.open_float(nill, {focus = false})
    end,
})
EOF

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

colorscheme gruvbox
set background=dark

