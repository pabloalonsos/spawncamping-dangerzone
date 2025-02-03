Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let termguicolors = 'true'

nmap <leader>e :NvimTreeToggle<cr>

function NvimTreeSetup()
lua << EOF
require("nvim-tree").setup {
  renderer = {
    indent_markers = {
      enable = true
    },
    icons = {
      git_placement = "signcolumn",
      show = {
        file = true,
        folder = false,
        folder_arrow = true,
        git = true,
      }
    },
  },
  filters = {
    custom = {
      "^.git$",
      "^.DS_Store$"
    },
  },
}
EOF
endfunction

augroup NvimTreeSetup
    autocmd!
    autocmd User PlugLoaded call NvimTreeSetup()
augroup END

