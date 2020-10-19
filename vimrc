""
"" Janus setup
""

let mapleader = ","
set mouse=a
set guifont=Monospace:h10
abbreviate bp require 'pry'; binding.pry
set noeb vb t_vb= " disable beeping
set rnu

filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" make bar at column 80 to know when we pass it
set colorcolumn=80

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

fu! s:FileToTmux()
  :silent ! tmux select-window -l
  :silent ! tmux send-keys "%"
endfu

command! FileToTmux call s:FileToTmux()
nmap <silent> <leader>tt :FileToTmux<cr>

" Define paths
if has('win32') || has('win64') || has('win32unix')
  let g:janus_path = escape(expand("~/.vim/janus/vim"), ' ')
  let g:janus_vim_path = escape(expand("~/.vim/janus/vim"), ' ')
else
  let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
  let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
endif
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" ctrlp ignore
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|vendor)|(\.(swp|ico|git|svn))$'

" .vimrc.after is loaded after the plugins have loaded

" keymaps
let g:NERDTreeNodeDelimiter = "\u00a0"
nmap <leader>m :NERDTreeFind<CR>
set runtimepath^=~/.vim/bundle/ag

execute pathogen#infect()
