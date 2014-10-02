" set nocompatible              " be iMproved
" filetype off                  " required!
"
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
if $SYSTEM != 'windows'
  if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" Bundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

"split management
NeoBundle 'wesQ3/vim-windowswap'
let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>

"Mail search
NeoBundle 'daisuzu/unite-notmuch'
NeoBundle 'diefans/notmuch-vim'


"colorschemes
NeoBundle 'tomasr/molokai'
NeoBundle 'sjl/badwolf'
NeoBundle 'Solarized'
" NeoBundle 'github-theme'
NeoBundle 'nanotech/jellybeans.vim'

"visual
"NeoBundle 'Powerline'
"powerline not working, light alternative?
NeoBundle 'bling/vim-airline'
" NeoBundle 'bling/vim-bufferline'
NeoBundle 'edkolev/tmuxline.vim'

"filetype handlers, highlighting etc
NeoBundle 'LaTeX-Box-Team/LaTeX-Box'
NeoBundle 'vim-latex/vim-latex'
NeoBundle 'liquid.vim'
"c++11 highlighting
NeoBundle 'vim-jp/cpp-vim'
"rust highlighting
NeoBundle 'wting/rust.vim'
" map <silent> <buffer> <C-A-K> <Plug>VO_FollowLink
" NeoBundle 'VimOutliner'
"link handler
NeoBundle 'vim-scripts/utl.vim'
"cool csv highlighting
NeoBundle 'chrisbra/csv.vim'
" CSupport plugin: XXX: reacts badly with several others
" NeoBundle 'c.vim'
" NeoBundle "jceb/vim-orgmode"
"deps
NeoBundle "tpope/vim-speeddating"

"tmux integration
NeoBundle 'vimux'

if $SYSTEM != 'windows'
  "completion
  NeoBundle 'Valloric/YouCompleteMe', {
        \ 'build' : {
        \     'mac' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
        \     'unix' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
        \    },
        \ }
endif
" not sure I want this one back... NeoBundle 'scrooloose/syntastic'

"project management
" NeoBundle 'project.tar.gz'

"bindings

"shell/terminal emulation
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'pthrasher/conqueterm-vim'

"file management
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'terryma/vim-multiple-cursors'

if executable('task')
  NeoBundle 'farseer90718/vim-taskwarrior'
endif

let g:task_default_prompt= ['description', 'project', 'tag', 'due']
", 'priority', 'depends'

augroup taskwarrior_quick_add
  au FileType taskreport nmap <silent> <buffer> <Plug>(taskwarrior_new_quick)             :call taskwarrior#system_call('', 'add', taskwarrior#data#get_args('add', ['description', 'project', 'due']), 'echo')<CR>
  au FileType taskreport nmap <silent> <buffer> n        <Plug>(taskwarrior_new_quick)
augroup END



" NeoBundle 'Raimondi/delimitMate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tommcdo/vim-exchange'
" NeoBundle 'UltiSnips'
NeoBundle 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'
NeoBundle 'Lokaltog/vim-easymotion'
" map <Leader>e <Plug>(easymotion-prefix)
" NeoBundle 'The-NERD-Commenter'
NeoBundle 'majutsushi/tagbar'
NeoBundle "Chiel92/vim-autoformat"
NeoBundle 'Gundo'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'visualrepeat'
"new alignment plugin, CR from visual mode to use
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tpope/vim-pastie'
"Unix command aliases, Chmod and company
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-markdown'
" NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tomtom/tcomment_vim'
"Word highlighting for possible but uncertain errors
NeoBundle 'reedes/vim-wordy'

call neobundle#end()

filetype plugin indent on     " required!
" NeoBundleCheck

" set runtimepath+=~/.vim/pyclewn

let mapleader      = ','
let maplocalleader = ','
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


runtime ftplugin/man.vim
runtime! macros/matchit.vim

"Alignment mapping to enter in visual mode
vmap <CR> <Plug>(EasyAlign)

" let $PYTHONPATH .= ":~/.vim/included/ropevim"
" source ~/.vim/included/ropevim/ropevim.vim

"make command mode suck less
" cnoremap <C-A>  <Home>
" cnoremap <C-F>  <Right>
" cnoremap <C-B>  <Left>
" cnoremap <Esc>b <S-Left>
" cnoremap <Esc>f <S-Right>

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>


"" add neocomplcache option
"let g:neocomplcache_force_overwrite_completefunc=1

"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_disable_auto_complete = 1
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)

"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"inoremap <expr><Tab>  neocomplcache#start_manual_complete()

"" For snippet_complete marker.
"let g:neosnippet#snippets_directory="~/.vim/included-old/snipmate/snippets/"
"if has('conceal')
"set conceallevel=2 concealcursor=i
"endif

"Unite
let g:unite_data_directory = '~/.vim/unite'
" let g:unite_source_bookmark_directory = '~/.vim/unite-bookmarks'
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#profile('files', 'filters', 'sorter_rank')
nnoremap <leader>uB :<C-u>Unite bookmark<CR>
nnoremap <leader>uY :<C-u>Unite history/yank<CR>
" nnoremap <leader>uf :<C-u>Unite file<CR>
nnoremap <leader>uf :<C-u>Unite -start-insert file<CR>
nnoremap <leader>ug :<C-u>Unite grep:.<CR>
nnoremap <leader>uG :<C-u>Unite grep:.:-i<CR>
" nnoremap <leader>ur :<C-u>Unite -start-insert file_rec<CR>
nnoremap <leader>ur :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <leader>uvr :<C-u>Unite -start-insert file_rec/async:!<CR>
nnoremap <silent> <leader>ub :<C-u>Unite buffer file_mru bookmark<CR>
let g:unite_source_grep_max_candidates = 500

if executable('pt')
  " Use pt in unite grep source.
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = ' --nogroup --nocolor ' .
        \ '--ignore ''.hg'' ' .
        \ '--ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
        \ '--ignore ''*.dat'' --ignore ''*.pdf'' --ignore ''*.bib'' -e '
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command = 'pt --nocolor --nogroup -g . '
elseif executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
        \  '--ignore ''*.dat'' --ignore ''*.pdf'' '
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command = 'ag -i --nocolor --nogroup --ignore --ignore ''.git'' --ignore ''.bzr'' --ignore ''node_modules'' --hidden -g ""'
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
        \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -H'   " -k might be good, limit to known file types only
  let g:unite_source_grep_recursive_opt = ''
endif

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'changes', 'mixed', 'bookmarkdir']

"YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/Dropbox/*','~/projects/*']
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:SuperTabDefaultCompletionType="context"
let g:SuperTabContextDefaultCompletionType="<c-x><c-u>"

"syntax/visual options
let g:vimsyn_folding = 'af'
set vb
set t_vb=
syn on
set background=dark
let g:solarized_contrast = "high"
" let g:solarized_termcolors=256
let g:solarized_termtrans = 1
set ruler
set nowrap

set winaltkeys=no
set virtualedit=block,insert

set wildignore+=*.com,*.class,*.dll,*.exe,*.o,*.so
set wildignore+=*.dmg,*.iso,*.jar,*.rar,*.tar,*.zip
set wildignore+=".DS_Store,.DS_Store?,._*,.Spotlight-V100,ehthumbs.db,Thumbs.db"
set wildignore+=*.swp,*~
set wildignore+=*.aux,*.lot,*.lof,*.pyg,*.toc
" set wildignore+=*.pdf,*.eps,*.epsi,*.png,*.jpg,*.svg
" set wildignore+=*.xls,*.xlsx,*.ppt,*.pptx,*.doc,*.docx,*.graffle

"outliner checkboxes
augroup filetype_otl
  autocmd!
  au FileType otl source ~/.vim/plugin/vo_checkbox.vim
  au FileType otl setlocal spell spelllang=en_us
augroup END

"additional buffer types
augroup extra_filetypes
  autocmd!
  au BufNewFile,BufRead *.cu           set      ft=cuda
  au BufNewFile,BufRead *.cl           set      ft=opencl
  au BufNewFile,BufRead *.br           set      ft=brook
  au BufNewFile,BufRead *.go           set      ft=go
  au FileType           go             setlocal formatprg=gofmt
  au BufRead            COMMIT_EDITMSG set      backupcopy=no
  au BufNewFile,BufRead *.txt          set      ft=txt
  au BufNewFile,BufRead CMakeLists.txt set      ft=cmake
augroup END

"for plugins, etc.
set encoding=utf-8



"remove ending whitespace on file write
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

augroup extra_filetypes
  autocmd!
  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END

fun! TeX_fmt()
  if (getline(".") != "")
    let save_cursor = getpos(".")
    let op_wrapscan = &wrapscan
    set nowrapscan
    let par_begin = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\Start\|\\Stop\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\|\\noindent\>\)'
    let par_end   = '^\(%D\)\=\s*\($\|\\begin\|\\end\|\\Start\|\\Stop\|\\place\|\\\(sub\)*section\>\|\\item\>\|\\NC\>\|\\blank\>\)'
    try
      exe '?'.par_begin.'?+'
    catch /E384/
      1
    endtry
    norm V
    try
      exe '/'.par_end.'/-'
    catch /E385/
      $
    endtry
    norm gq
    let &wrapscan = op_wrapscan
    call setpos('.', save_cursor)
  endif
endfun

"CODE LINTING
let g:syntastic_tex_checkers=[] "do NOT check latex files
" let g:syntastic_cpp_checkers=['cpplint']
let g:syntastic_python_checkers=['pylint', 'pep8', 'python']
let g:syntastic_python_pylint_args=' --indent-string="    "'

"CODE FORMATTING
let g:formatprg_args_expr_python = '(&textwidth ? " --max-line-length=" . &textwidth : "") . " -" '
let g:formatprg_args_expr_c = '"--mode=c --style=google --add-brackets --keep-one-line-statements -pcH".(&expandtab ? "s".&shiftwidth : "t")'
let g:formatprg_args_expr_cpp = g:formatprg_args_expr_c

"automatic formatting options
set textwidth=78
set formatoptions=crq
" set fo-=t
" au FileType tex set formatoptions+=a
augroup text_formatting
  autocmd!
  au FileType tex setlocal formatoptions+=t
  au FileType tex setlocal formatexpr=cindent
  au FileType txt setlocal formatoptions+=t
  au FileType txt setlocal formatexpr=cindent
augroup END
"set formatoptions+=a

"hilighting
let python_highlight_all = 1
"there is no local value for fp, must set other languages to use cindent
"manually

"au FileType cpp setlocal fp=astyle\ --pad-oper\ --unpad-paren\ --add-brackets\ --convert-tabs\ --align-pointer=name\ --indent-col1-comments\ --style=k/r\ --quiet
"if executable("astyle")
"au FileType cpp setlocal fp=astyle\ --pad-oper\ --unpad-paren\ --add-brackets\ --convert-tabs\ --align-pointer=name\ --indent-col1-comments\ --style=k/r\ --quiet
"au FileType c setlocal fp=astyle\ --pad-oper\ --unpad-paren\ --add-brackets\ --convert-tabs\ --align-pointer=name\ --indent-col1-comments\ --style=k/r\ --quiet
"au FileType cpp setlocal equalprg=astyle\ --indent=spaces=2\ --pad-oper\ --unpad-paren\ --add-brackets\ --convert-tabs\ --align-pointer=name\ --indent-col1-comments\ --style=k/r\ --quiet
"au FileType c setlocal equalprg=astyle\ --indent=spaces=2\ --pad-oper\ --unpad-paren\ --add-brackets\ --convert-tabs\ --align-pointer=name\ --indent-col1-comments\ --style=k/r\ --quiet
"endif
"
"if filereadable("/Users/njustn/build/clang/llvm/tools/clang/tools/clang-format/clang-format.py")
"au FileType c,cpp map <buffer> <C-K> :pyf /Users/njustn/build/clang/llvm/tools/clang/tools/clang-format/clang-format.py<CR>
"au FileType c,cpp imap <buffer> <C-K> <ESC>:pyf /Users/njustn/build/clang/llvm/tools/clang/tools/clang-format/clang-format.py<CR>i
"endif
"if filereadable("/Users/njustn/scripts/PythonTidy-1.22.python")
"au FileType python map <buffer> <C-K> :pyf ~/scripts/PythonTidy-1.22.python<CR>
"au FileType python imap <buffer> <C-K> <ESC>:pyf ~/scripts/PythonTidy-1.22.python<CR>i
"endif

map      <C-k>     :Autoformat<CR>
noremap  <C-k>     :Autoformat<CR>
nnoremap <C-k>     :Autoformat<CR>
vmap     <C-k>     <Esc>:Autoformat<CR>
imap     <C-k>     <Esc>:Autoformat<CR>
cmap     <C-k>     <Esc>:Autoformat<CR>
omap     <C-k>     <Esc>:Autoformat<CR>


"tags
" set tags+=~/.vim-systags

"Conque
nmap <C-w><S-v> :ConqueTermVSplit zsh<CR>
nmap <C-w><S-s> :ConqueTermSplit zsh<CR>
let g:ConqqueTerm_Color = 2
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CWInsert = 1

let g:tmuxline_preset = 'full'
let g:tmuxline_powerline_separators = 0
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tagbar#enabled = 0
set ttimeoutlen=100

if exists("$SYSTEM")
  if $SYSTEM == "darwin"
    " let g:Powerline_symbols = 'fancy'
    let include_paths = '/opt/local/include /usr/local/include /usr/include /Developer/Headers'
  elseif $SYSTEM == "linux"
    let include_paths = '/usr/local/include /usr/include'
  endif
else
  let include_paths = '/usr/local/include /usr/include'
endif

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $PWD<CR>
map <A-C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $PWD<CR>
map <Esc><C-T> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q $PWD<CR>
execute 'map <C-S-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f - ' . include_paths . ' > ~/.vim-systags'

if has("gui_running")
  set guioptions=egmt
  if has("gui_macvim")
    "CRITICAL option, allows alt-based key-bindings to work in macvim
    set macmeta
    set transparency=10
    " set gfn=Courier\ New:h11.00
    set gfn=ProFont:h9.00
    set noantialias
    set fuopt=maxvert,maxhorz
  elseif has("gui_gtk2")
    set guifont=Terminus\ 8
  elseif has("x11")
    " Also for GTK 1
    set guifont=-misc-fixed-medium-r-normal-*-10-*-*-*-c-*-iso8859-15
  endif
endif



"keyboard options
set t_kb=
nnoremap    <BS>
vmap        <BS>
imap        <BS>
cmap        <BS>
omap        <BS>

if &term =~ "screen.*" "screen configurations
  if &term =~ "screen.*-bce"
    set term=screen-256color
  endif
  "set ttymouse=xterm "falls back to xterm for unsupported terminal type
  set t_ku=OA
  set t_kd=OB
  set t_kr=OC
  set t_kl=OD
  set t_@7=OF
  set t_kh=[1~

  nnoremap <Esc>[C     <Right>
  vmap     <Esc>[C     <Right>
  imap     <Esc>[C     <Right>
  cmap     <Esc>[C     <Right>
  omap     <Esc>[C     <Right>
  nnoremap <Esc>[D     <Left>
  vmap     <Esc>[D     <Left>
  imap     <Esc>[D     <Left>
  cmap     <Esc>[D     <Left>
  omap     <Esc>[D     <Left>
  nnoremap <Esc>[A     <Up>
  vmap     <Esc>[A     <Up>
  imap     <Esc>[A     <Up>
  cmap     <Esc>[A     <Up>
  omap     <Esc>[A     <Up>
  nnoremap <Esc>[B     <Down>
  vmap     <Esc>[B     <Down>
  imap     <Esc>[B     <Down>
  cmap     <Esc>[B     <Down>
  omap     <Esc>[B     <Down>
  " map OB <Down>
  " map OA <Up>
  " map OD <Left>
  " map OC <Right>


  nnoremap  <Esc>[4~ <End>
  vmap      <Esc>[4~ <End>
  imap      <Esc>[4~ <End>
  cmap      <Esc>[4~ <End>
  omap      <Esc>[4~ <End>
  nnoremap  <Esc>[1~  <Home>
  vmap      <Esc>[1~  <Home>
  imap      <Esc>[1~  <Home>
  cmap      <Esc>[1~  <Home>
  omap      <Esc>[1~  <Home>

  nnoremap  <Esc>0F <End>
  vmap      <Esc>0F <End>
  imap      <Esc>0F <End>
  cmap      <Esc>0F <End>
  omap      <Esc>0F <End>
  nnoremap  <Esc>OH  <Home>
  vmap      <Esc>OH  <Home>
  imap      <Esc>OH  <Home>
  cmap      <Esc>OH  <Home>
  omap      <Esc>OH  <Home>
  nnoremap  <Esc>[F <End>
  vmap      <Esc>[F <End>
  imap      <Esc>[F <End>
  cmap      <Esc>[F <End>
  omap      <Esc>[F <End>
  nnoremap  <Esc>[H  <Home>
  vmap      <Esc>[H  <Home>
  imap      <Esc>[H  <Home>
  cmap      <Esc>[H  <Home>
  omap      <Esc>[H  <Home>
endif


"let g:NERDCustomDelimiters = {
"\ 'opencl': { 'left': '#', 'leftAlt': 'FOO', 'rightAlt': 'BAR' },
"\ 'grondle': { 'left': '{{', 'right': '}}' }
"\ }

" tComment extra mappings:
" yank visual before toggle comment
vmap gy ygvgc
" yank and past visual before toggle comment
vmap gyy ygvgc'>gp'.
" yank line before toggle comment
nmap gy yygcc
" yank and paste line before toggle comment and remember position
" it works both in normal and insert mode
" Use :t-1 instead of yyP to preserve registers
nmap gyy mz:t-1<cr>gCc`zmz
" imap gyy <esc>:t-1<cr>gCcgi
vmap gcc gc

" nnoremap <Leader>x :call NERDComment(0,"toggle")<C-m>
" vmap <Leader>x :call NERDComment(0,"toggle")<C-m>
" let g:NERDRemoveExtraSpaces=1
" let g:NERDRemoveExtraSpaces=1
" let g:NERDSpaceDelims=1

"map <Leader>x <plug>NERDCommenterToggleComment
" Follow links with ,o
nnoremap <Leader>o :Utl ol<CR>

imap <A-x> <Esc><Plug>Traditionala
imap <Esc>x <Esc><Plug>Traditionala

"csupport, but very commentify related...
let g:C_TypeOfH="c"

"editing behavior
set history=10000
set backspace=2
" set softtabstop=2 "used to favor the gnu style, getting used to K&R @ 4 spaces
" set shiftwidth=2
set softtabstop=2
set shiftwidth=2
set expandtab
set hlsearch
set incsearch
set ignorecase
set smartcase
set modeline
set modelines=5

"diff behavior
set diffopt+=iwhite

"indent
set autoindent
set smartindent

"c/c++ options
augroup c_setup
  autocmd!
  au FileType c set foldmethod=syntax
augroup END

"latex options
let g:LatexBox_viewer = 'open'
let g:LatexBox_quickfix = 0
let g:LatexBox_latexmk_options = '-pdf -shell-escape' "latter is needed for pygments
let g:LatexBox_latexmk_preview_continuously=0
let g:tex_flavor='latex'
let g:Imap_FreezeImap=1
let g:Tex_FormatDependency_pdf = 'pdf'
if exists("$SYSTEM")
  if $SYSTEM == "darwin"
    let g:Tex_ViewRule_pdf = 'open '
    let g:Tex_ViewRuleComplete_pdf = 'open $*.pdf'
  elseif $SYSTEM == "linux"
    let g:Tex_ViewRule_pdf = 'evince '
    let g:Tex_ViewRuleComplete_pdf = 'evince $*.pdf'
  endif
endif

augroup text_setup
  autocmd!
  au FileType tex let g:Tex_DefaultTargetFormat='pdf'
  au FileType tex setlocal spell spelllang=en_us
  " au FileType tex imap <C-x><C-p> <Plug>Tex_Completion
  au FileType tex imap <buffer> <C-b> <Plug>Tex_MathBF
  au FileType tex imap <buffer> <C-l> <Plug>Tex_LeftRight
  au FileType tex imap <buffer> <C-p> <Plug>Tex_InsertItemOnThisLine
  au FileType tex imap <buffer> <A-i> <Plug>Tex_InsertItemOnThisLine
  au FileType tex imap <buffer> <Esc>i <Plug>Tex_InsertItemOnThisLine

  " Highlight words I might use to mess up grammar
  au FileType tex highlight whichthat ctermfg=Magenta guifg=#515996
  "ctermfg=black
  au FileType tex match whichthat /\(\swhich\s\|\sthat\s\)/

  au FileType txt set textwidth=80
  au FileType txt setlocal spell spelllang=en_us
augroup END

"build system options
" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" if no errors, it closes any open cwindow.
command! -nargs=* Make make <args> | cwindow 3
command! -nargs=* Scons scons <args> | cwindow 3
nnoremap <Leader>m :Make<cr>

augroup build_autos
  autocmd!
  au BufRead,BufNewFile SConstruct set filetype=python

  au FileType make inoremap <buffer> <tab> <tab>
  au FileType make setlocal softtabstop=0
  au FileType make setlocal shiftwidth=8
  au FileType make setlocal noexpandtab
  au FileType make setlocal noautoindent
  au FileType make setlocal nosmartindent
augroup END

"general key remappings
nmap Y y$
function! Map_for_all(mapping, target, for_cmd, for_input, esc_input)
  for item in ['nnoremap', 'vmap', 'omap']
    execute item . ' ' . a:mapping . ' ' . a:target
  endfor

  if a:for_cmd != 0
    execute 'cmap '.a:mapping.' '.a:target
  endif

  if a:for_input != 0
    if a:esc_input != 0
      execute 'imap ' . a:mapping . ' <Esc>' . a:target
    else
      execute 'imap ' . a:mapping . ' ' . a:target
    endif
  endif
endfunction

function! Map_for_all_meta(mapping, target, for_cmd, for_input, esc_input)
  call Map_for_all('<A-'.mapping.'>', target, for_cmd, for_input, esc_input)
  call Map_for_all('<Esc>'.mapping, target, for_cmd, for_input, esc_input)
endfunction

call Map_for_all("<C-c>","<Esc>", 1, 1, 0)

map <S-Z><S-S> :up<CR>


if ! has("gui_running")
  "if $TMUX "TODO: get copy support for tmux, need to figure out what mappings
  "make sense...
  "vmap <silent> <A-C>        "py:call eval('system("tmux set-buffer \'" . @p . "\'")')<CR>
  "vmap <silent> <Esc>C       "py:call eval('system("tmux set-buffer \'" . @p . "\'")')<CR>
  "vmap <silent> <A-V>        dh:call Paste_proper()<CR>
  "vmap <silent> <Esc>V       dh:call Paste_proper()<CR>
  "imap <silent> <A-V>        <Esc>: call Paste_proper()<CR>
  "imap <silent> <Esc>V       <Esc>: call Paste_proper()<CR>
  "nmap <silent> <A-C>        :yank p<CR>:call Yank_proper()<CR>
  "nmap <silent> <Esc>C       :yank p<CR>:call Yank_proper()<CR>
  "nmap <silent> <A-V>        :call Paste_proper()<CR>
  "nmap <silent> <Esc>V       :call Paste_proper()<CR>
  "endif
  "nnoremap <special> <A-c> "*Y
  " cnoremap <special> <A-c> <C-R>+
  "vnoremap <special> <A-c> "*y
  if $SYSTEM == "darwin"
    let tmux_reattach_prefix=glob("~/Dropbox/config/tmux-MacOSX-pasteboard/reattach-to-user-namespace")

    "paste from pbpaste as paste normally works, from the current cursor position
    function! Paste_proper()
      let @p=system(g:tmux_reattach_prefix . " pbpaste")
      execute 'normal "pp'
    endfunction
    function! Yank_proper()
      "each mode needs different copy, see below mappings
      call system(g:tmux_reattach_prefix . " pbcopy", getreg("p"))
    endfunction

    vmap <silent> <A-c>        "py:call Yank_proper()<CR>
    vmap <silent> <Esc>c       "py:call Yank_proper()<CR>
    nmap <silent> <A-c>        :yank p<CR>:call Yank_proper()<CR>
    nmap <silent> <Esc>c       :yank p<CR>:call Yank_proper()<CR>
    vmap <silent> <A-v>        dh:call Paste_proper()<CR>
    vmap <silent> <Esc>v       dh:call Paste_proper()<CR>
    imap <silent> <A-v>        <Esc>: call Paste_proper()<CR>
    imap <silent> <Esc>v       <Esc>: call Paste_proper()<CR>
    nmap <silent> <A-v>        :call Paste_proper()<CR>
    nmap <silent> <Esc>v       :call Paste_proper()<CR>
  elseif $SYSTEM == "linux"
    vmap <C-y> y:call system("xclip", getreg("\""))<CR>
  endif
  " execute 'inoremap <script> <special> <A-c>' paste#paste_cmd['i']
  " nnoremap <special> <Esc>c "+gP
  " cnoremap <special> <Esc>c <C-R>+
  " execute 'cnoremap <script> <special> <Esc>c' paste#paste_cmd['c']
  " execute 'inoremap <script> <special> <Esc>c' paste#paste_cmd['i']
  "nnoremap <special> <A-v> "+gP
  "cnoremap <special> <A-v> <C-R>+
  "execute 'vnoremap <script> <special> <A-v>' paste#paste_cmd['v']
  "execute 'inoremap <script> <special> <A-v>' paste#paste_cmd['i']
  "nnoremap <special> <Esc>v "+gP
  "cnoremap <special> <Esc>v <C-R>+
  "execute 'vnoremap <script> <special> <Esc>v' paste#paste_cmd['v']
  "execute 'inoremap <script> <special> <Esc>v' paste#paste_cmd['i']
  call Map_for_all("<Esc>[1;3C", "<End>", 1, 1, 0)
  call Map_for_all("<Esc>[1;3D", "<Home>", 1, 1, 0)
  nnoremap  <Esc>[1;9D <C-Left>
  vmap      <Esc>[1;9D <C-Left>
  imap      <Esc>[1;9D <C-Left>
  cmap      <Esc>[1;9D <C-Left>
  omap      <Esc>[1;9D <C-Left>
  nnoremap  <Esc>[1;9C <C-Right>
  vmap      <Esc>[1;9C <C-Right>
  imap      <Esc>[1;9C <C-Right>
  cmap      <Esc>[1;9C <C-Right>
  omap      <Esc>[1;9C <C-Right>

endif


""tag jump remappings, makes <C-]> list if more than 1, immediate if only 1,
""alt does the same, but in a new vertical split so you can look at both
""together, awesome for looking at function arguments and defs together
function! Vertical_tag_jump()
  execute "vert rightb stj " . expand("<cword>")
endfunction
map  <C-]>   g<C-]>
imap  <C-]>  <Esc>g<C-]>
cmap  <C-]>  g<C-]>

map <silent> <A-]>  :call Vertical_tag_jump()<CR>
imap <silent> <A-]>  <Esc>:call Vertical_tag_jump()<CR>
map <silent> <Esc>]  :call Vertical_tag_jump()<CR>
imap <silent> <Esc>]  <Esc>:call Vertical_tag_jump()<CR>

" if ! has("gui_running")
"alt
"tab management
nnoremap  <A-t>  :tabnew<CR>
vmap      <A-t>  :tabnew<CR>
imap      <A-t>  <Esc>:tabnew<CR>
cmap      <A-t>  <Esc>:tabnew<CR>
omap      <A-t>  :tabnew<CR>
nnoremap  <A-}>  :tabnext<CR>
vmap      <A-}>  :tabnext<CR>
imap      <A-}>  <Esc>:tabnext<CR>
cmap      <A-}>  <Esc>:tabnext<CR>
omap      <A-}>  :tabnext<CR>
nnoremap  <A-{>  :tabprevious<CR>
vmap      <A-{>  :tabprevious<CR>
imap      <A-{>  <Esc>:tabprevious<CR>
cmap      <A-{>  <Esc>:tabprevious<CR>
omap      <A-{>  :tabprevious<CR>
nnoremap  <Esc>t  :tabnew<CR>
vmap      <Esc>t  :tabnew<CR>
imap      <Esc>t  <Esc>:tabnew<CR>
cmap      <Esc>t  <Esc>:tabnew<CR>
omap      <Esc>t  :tabnew<CR>
nnoremap  <Esc>}  :tabnext<CR>
vmap      <Esc>}  :tabnext<CR>
imap      <Esc>}  <Esc>:tabnext<CR>
cmap      <Esc>}  <Esc>:tabnext<CR>
omap      <Esc>}  :tabnext<CR>
nnoremap  <Esc>{  :tabprevious<CR>
vmap      <Esc>{  :tabprevious<CR>
imap      <Esc>{  <Esc>:tabprevious<CR>
cmap      <Esc>{  <Esc>:tabprevious<CR>
omap      <Esc>{  :tabprevious<CR>

"movement through splits
nnoremap  <Esc><S-L>  :wincmd l<CR>
vmap      <Esc><S-L>  :wincmd l<CR>
imap      <Esc><S-L>  <Esc>:wincmd l<CR>
cmap      <Esc><S-L>  <Esc>:wincmd l<CR>
omap      <Esc><S-L>  :wincmd l<CR>
nnoremap  <Esc><S-H>  :wincmd h<CR>
vmap      <Esc><S-H>  :wincmd h<CR>
imap      <Esc><S-H>  <Esc>:wincmd h<CR>
cmap      <Esc><S-H>  <Esc>:wincmd h<CR>
omap      <Esc><S-H>  :wincmd h<CR>
nnoremap  <Esc><S-J>  :wincmd j<CR>
vnoremap  <Esc><S-J>  :wincmd j<CR>
inoremap  <Esc><S-J>  <Esc>:wincmd j<CR>
cnoremap  <Esc><S-J>  <Esc>:wincmd j<CR>
onoremap  <Esc><S-J>  :wincmd j<CR>
nnoremap  <Esc><S-K>  :wincmd k<CR>
vmap      <Esc><S-K>  :wincmd k<CR>
imap      <Esc><S-K>  <Esc>:wincmd k<CR>
cmap      <Esc><S-K>  <Esc>:wincmd k<CR>
omap      <Esc><S-K>  :wincmd k<CR>
" endif

"Powerline
"source ~/.vim/included/powerline/powerline/ext/vim/source_plugin.vim " back in
"if they fix it
set laststatus=2 "keeps the statusbar on
let g:Powerline_symbols = 'unicode'
if exists("$HOST")
  if $HOST == "typhoon"
    let g:Powerline_symbols = 'fancy'
  endif
endif
"let g:Powerline_theme = 'default'
let g:Powerline_colorscheme = 'solarized256'
"if
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_theme = 'default'
"let g:Powerline_colorscheme = 'solarized256'

"general options
set grepprg=grep\ -nH\ $*
set wildmenu
set wildmode=longest:list,full
"set foldmethod=syntax
filetype indent on
filetype plugin on

"winmanager
let g:winManagerWindowLayout = "Project|TagList"

function! ToggleVExplorer()
  if exists("t:expl_buf_num")
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      exec cur_win_nr . 'wincmd w'
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction

nnoremap <silent> <M-f>      :call ToggleVExplorer()<CR>
nnoremap <silent> <A-S-f>    :call ToggleVExplorer()<CR>
nnoremap <silent> <Esc><S-f> :call ToggleVExplorer()<CR>
nnoremap <silent> <D-F>      :call ToggleVExplorer()<CR>
nmap     <silent> <F3>       :call ToggleVExplorer()<CR>
let g:netrw_liststyle = 4
" let g:netrw_home      = '~/.vim'

nnoremap <silent> <C-L> :noh<CR><C-L>
"project plugin options
" map           <A-S-o> :Project<CR>:redraw<CR>
" map           <Esc><S-o> :Project<CR>:redraw<CR>
" map           <D-O> :Project<CR>:redraw<CR>
" replaced with netrw for now
" nnoremap   <silent>   <A-S-f> :NERDTreeToggle<CR>
" nnoremap   <silent>   <Esc><S-f> :NERDTreeToggle<CR>
" nnoremap   <silent>   <D-F> :NERDTreeToggle<CR>
" map  <silent>         <A-S-p> <Plug>ToggleProject
" map  <silent>         <Esc><S-p> <Plug>ToggleProject
" map  <silent>         <D-P> <Plug>ToggleProject
" nmap <silent> <F3>    <Plug>ToggleProject
let g:proj_run1 = "!open %f"
let g:proj_window_width = 30
let g:proj_window_increment = 50
let g:proj_run_fold1 = ":!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f - %f > %d/tags"


" --------------------
" TagList
" --------------------
" F4:  Switch on/off TagList
nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <A-S-t> :TagbarToggle<CR>
nnoremap <silent> <Esc><S-t> :TagbarToggle<CR>
nnoremap <silent> <D-T> :TagbarToggle<CR>

let g:tagbar_autoclose = 1

"mouse options
set mouse=a
"enable wide mouse support for iTerm2 and urxvt, should also work in new xterms
if v:version >= 703
  set t_RV=
  set ttym=sgr
else
  set ttymouse=xterm2
endif



" TagListTagName  - Used for tag names
highlight MyTagListTagName gui=bold guifg=Black guibg=Green cterm=bold ctermfg=Black ctermbg=Green
" TagListTagScope - Used for tag scope
highlight MyTagListTagScope gui=NONE guifg=Blue ctermfg=Blue
" TagListTitle    - Used for tag titles
highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray cterm=bold ctermfg=DarkRed ctermbg=LightGray
" TagListComment  - Used for comments
highlight MyTagListComment guifg=DarkGreen ctermfg=DarkGreen
" TagListFileName - Used for filenames
highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue cterm=bold ctermfg=Black ctermbg=LightBlue

"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
" let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 30
"let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
"let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]
"
let g:lisp_rainbow=1

"unsorted, deal with later
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Highlight words I might use to mess up grammar
au FileType tex highlight whichthat ctermfg=Magenta guifg=#515996
"ctermfg=black
au FileType tex match whichthat /\(\swhich\s\|\sthat\s\)/

let g:UltiSnipsExpandTrigger="<c-j>"
inoremap <S-tab> <Esc>:call UltiSnips_ListSnippets()<CR>

" colorscheme solarized
if &term =~ ".*256color.*" || has("gui_running")
  set t_Co=256
  " let g:inkpot_black_background=1
  " colorscheme inkpot
endif

" if !has("gui_running")
" let g:jellybeans_background_color = "000000"
" let g:jellybeans_background_color_256=0
" endif

colorscheme jellybeans
if exists("$TERM_PROGRAM") && $TERM_PROGRAM == 'iTerm.app'
  if exists("$ITERM_PROFILE")
    if $ITERM_PROFILE == 'Monokai'
      colorscheme monokai
    elseif $ITERM_PROFILE == 'Default'
      " colorscheme inkpot
      " colorscheme badwolf
    endif
  endif
endif
