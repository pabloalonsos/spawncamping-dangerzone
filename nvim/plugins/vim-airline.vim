Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme = 'one'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

" Hides the double insert/normal/visual status that's not the airline bar one
set noshowmode



" Other themes
"Plug 'mhartington/oceanic-next'
"Plug 'w0ng/vim-hybrid'
"Plug 'sainnhe/edge'
"Plug 'larsbs/vimterial_dark'
Plug 'rakr/vim-one'

