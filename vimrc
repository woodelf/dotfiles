"-----------------
" General Settings
"-----------------
" Default encoding
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" Not compatible with the old-fashion vi mode
set nocompatible

" Save confirmation for unsaved or read-only files
set confirm

" Keep 50 lines of command line history
set history=50

" Enable syntax highlighting
syntax on

" Enable filetype detection
filetype on

" Enable filetype-specific indenting
filetype indent on

" Enable filetype-specific plugins
filetype plugin on

" Auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Save global variables
set viminfo+=!

" No wrap or split for the words containing these characters
set iskeyword+=_,$,@,%,#,-

" Search highlighting
set hlsearch

" Terminal color settings
colors murphy

" Show current mode
set showmode

" Ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

" Always show line number
set nu!

"--------------
" File Settings
"--------------
" Disable backup
set nobackup

" Disable swap file
setlocal noswapfile
set bufhidden=hide

" Start wild expansion in the command line using <TAB>
set wildchar=<TAB>

" Wild char completion menu
set wildmenu

" Spell check for en locale
set spelllang=en

" Show the cursor position all the time
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\,%c\ %p%%%)

" Allow backspacing over everything in insert mode
set backspace=2

" Allow backspacing and cursor move beyond line border
set whichwrap+=<,>,h,l

" Allow usage of mouse at any postion in the buffer
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" Disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Leave space between split windows
set fillchars=vert:\ ,stl:\ ,stlnc:\

"--------------------------
" Search and Match Settings
"--------------------------
" Cursor shows matching ) and }
set showmatch

" Ignore case when searching
set ignorecase

" Incremental search
set incsearch

" Always show status line
set laststatus=2

"---------------
" Text Formating
"---------------
" Auto formating
set formatoptions=tcrqn

" Auto indentation
set autoindent

" Smart indentation for C programs
set smartindent

" Enable C-style indentation
set cindent

" Set tab character
set tabstop=4

" Set global indentation
set softtabstop=4
set shiftwidth=4

" Do not repalce <TAB> with spaces
set noexpandtab

" Disable wrap
set nowrap

" Insert tabs on the start of a line according to context
set smarttab

" Display .nfo file in a nice view
set encoding=utf-8
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction
 
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single au BufReadPost *.nfo call RestoreFileEncodings()

" Turn on/off folding with space bar
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

"---------------
" CTags Settings
"---------------
" Sort by name
let Tlist_Sort_Type = "name"

" Display window on the right
let Tlist_Use_Right_Window = 1

" Compression method
let Tlist_Compart_Format = 1

" If there is only one buffer, then kill window will
" also kill that buffer
let Tlist_Exist_OnlyWindow = 1

" Do not turn off tags from other files
let Tlist_File_Fold_Auto_Close = 0

" Not display fold tree
let Tlist_Enable_Fold_Column = 0

"---------------------
" Programming Settings
"---------------------
" Press F5 to compile and run C programs
" Press F6 to compile and run C++ programs

" Compile and run C programs
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunc
 
" Compile and run C++ programs
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
endfunc

"----------------- 
" Useful Shortcuts
"----------------- 
" Set leader to ,
let mapleader=","
let g:mapleader=","

" Replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" Open the error console
map <leader>cc :botright cope<CR> 

" Move to next error
map <leader>] :cn<CR>

" Move to the prev error
map <leader>[ :cp<CR>

" Move around splits
" Move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" Move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" Move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" Move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
" Set the min width of a window to 0 so we can maximize others
set wmw=0
" Set the min height of a window to 0 so we can maximize others
set wmh=0

" Move around tabs. conflict with the original screen top/bottom
" omment them out if you want the original H/L
" Go to prev tab 
map <S-H> gT
" Go to next tab
map <S-L> gt

" New tab
map <C-t><C-t> :tabnew<CR>
" Close tab
map <C-t><C-w> :tabclose<CR> 

" ,/ Turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p Toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" Allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd.Cchange working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation)
" Ctrl-u 1:    underline Parts w/ #'s
noremap  <C-u>1 yyPVr#yyjp
inoremap <C-u>1 <esc>yyPVr#yyjpA
" Ctrl-u 2:    underline Chapters w/ *'s
noremap  <C-u>2 yyPVr*yyjp
inoremap <C-u>2 <esc>yyPVr*yyjpA
" Ctrl-u 3:    underline Section Level 1 w/ ='s
noremap  <C-u>3 yypVr=
inoremap <C-u>3 <esc>yypVr=A
" Ctrl-u 4:    underline Section Level 2 w/ -'s
noremap  <C-u>4 yypVr-
inoremap <C-u>4 <esc>yypVr-A
" Ctrl-u 5:    underline Section Level 3 w/ ^'s
noremap  <C-u>5 yypVr^
inoremap <C-u>5 <esc>yypVr^A

"---------------------- 
" Programming Shortcuts
"---------------------- 
" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" Use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

set cot-=preview "disable doc preview in omnicomplete

" Make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css
