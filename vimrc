set nocompatible          " get rid of Vi compatibility mode. SET FIRST!

execute pathogen#infect()

syntax on
filetype plugin indent on

set laststatus=2

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_auto_jump = 1
" let g:syntastic_loc_list_height = 5
" "let g:syntastic_debug = 1
" "let g:syntastic_debug_file = '~/syntastic.debug'
" let g:syntastic_enable_signs = 1
" "let g:syntastic_puppet_checkers=['puppet']
" "let g:syntastic_puppet_checkers=['puppetlint']
" let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-class_inherits_from_params_class-check'

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
set background=dark
colorscheme hybrid

set number                  " show line numbers
set ignorecase              " Make searches case-insensitive.
set ruler                   " Always show info along bottom.
set expandtab               " use spaces instead of tabs
set shiftwidth=2
set tabstop=2
set smarttab
set nowrap                  " don't wrap text
set hls                     " highlight search

" this didn't work after installing colorscheme?
match ErrorMsg '\s\+$'      " highlight trailing whitespace

" tab/eol chars are not needed with expandtab and trailing whitespace highlighted
set list
set listchars=tab:▸\ ,eol:¬ " set tab/eol characters

