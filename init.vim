set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'victorze/foo'
Plugin 'cormacrelf/vim-colors-github'
Plugin 'scrooloose/nerdtree'
Plugin 'neoclide/coc.nvim', {'branch':'release'}
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'StanAngeloff/php.vim'

Plugin 'leafgarland/typescript-vim'
Plugin 'tasn/vim-tsx'
Plugin 'kien/ctrlp.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'HerringtonDarkholme/yats.vim' " TS Syntax
Plugin 'rakr/vim-one'

call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
colorscheme one
set background=dark " for dark theme"

" if you use airline / lightline
let g:airline_theme = "one"
let g:lightline = { 'colorscheme': 'one' }
let g:one_allow_italics = 1 " Italics fonts

set number
set shiftwidth=2

noremap <S-t> :tabnew <CR>
noremap <silent><S-Left> :tabprevious<CR>
noremap <silent><S-Right> :tabnext<CR>
noremap <C-n> :NERDTreeToggle<CR>
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:ctrlp_map = '<c-p>'
let g:ctrl_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"let g:coc_global_extensions = [
"  \ 'coc-snippets',
"  \ 'coc-pairs',
"  \ 'coc-tsserver',
"  \ 'coc-json', 
"  \ ]


if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"set t_8b=^[[48;2;%lu;%lu;%lum
"set t_8f=^[[38;2;%lu;%lu;%lum

set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
