Plug 'scrooloose/syntastic'

let g:syntastic_javascript_checkers = ['eslint']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
" let g:syntastic_javascript_eslint_args = "--no-eslintrc --config ~/Code/eslintrc"
" " use eslintrc in current directory. Else look upwards. Else use standard
" autocmd FileType javascript let b:syntastic_checkers = findfile('./eslintrc', '.;') != '' ? ['eslint'] : ['standard']
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["scala"] }
