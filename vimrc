execute pathogen#infect()

let $PATH = "/Users/fra/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/opt/local/bin" 
set background=dark
if has('gui_running')
  set t_Co=256
  colorscheme wombat
else
  set t_Co=64
  colorscheme zenburn
endif 

set nosmartindent
set nocompatible
set pastetoggle=<f2>
set autoindent
set nosmarttab
set lazyredraw
set bs=2
set showmatch
set ruler
set ignorecase
set smartcase
set incsearch
set wrapscan
set expandtab
map <F11> :bprev!<CR>
map <F12> :bnext!<CR>
set matchtime=1
set nobackup
set ruler
set wildmenu
set wildmode=list:longest
set guioptions-=T
set guioptions-=m
set backspace=indent,eol,start
set wildignore+=**/cache/**

" Automatically reload .vimrc when changing
autocmd! bufwritepost .vimrc source %

" Linewidth to endless
set textwidth=0

" Do not wrap lines automatically
set nowrap

" Show line numbers by default
set relativenumber
set number

" Enable folding by fold markers
"set foldmethod=marker 
set nofoldenable

" Autoclose folds, when moving out of them
set foldclose=all

" Jump 5 lines when running out of the screen
set scrolljump=1

" Indicate jump out of the screen when 3 lines before end of the screen
set scrolloff=1

syntax on

" set gfn=Bitstream\ Vera\ Sans\ Mono\ 9
"set guifont=Envy\ Code\ R:h13
"set gfn=Envy\ Code\ R:h13

set guifont=Fantasque\ Sans\ Mono:h14
set gfn=Fantasque\ Sans\ Mono:h14
"set gfn=Inconsolata-dz:h12
"set gfn=Source\ Code\ Pro\ Light:h11
"set guifont=Cousine:h12
"set gfn=Cousine:h12
"set guifont=Consolas:h10
set linespace=4


"let Tlist_Use_Right_Window = 1
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_WinWidth = 50
"
"nnoremap <silent> <F8> :TlistToggle<CR>
"let g:tagbar_phpctags_bin='/opt/phpctags/phpctags'
nnoremap <silent> <F8> :TagbarToggle<CR>

filetype on
filetype indent on
filetype plugin on

noremap <C-TAB> :bn!<CR>
noremap <C-w>   :bd<CR>
noremap <C-ESC>   :Ex!<CR>
:let g:netrw_liststyle=3

" indent
set et
set sw=2
set smarttab

set hidden

map <silent> <F3> :call BufferList()<CR>
let g:BufferListWidth = 40
let g:BufferListMaxWidth = 50

set laststatus=2
:let g:buftabs_in_statusline=1 
:let g:buftabs_only_basename=1 


" change to directory of current file automatically (put in _vimrc)
function! ToProjBase(path, updateTree)
python << EOF
import vim
import os.path
import sys

curdir = vim.eval('a:path');
updateTree = vim.eval('a:updateTree');
bufdir = curdir;

while True:
  projPath = vim.eval("globpath('"+curdir+"/','.proj')")
  curdir = os.path.split(curdir)[0];
  if (projPath != '' or curdir == '/'):
    break;

if(projPath != None):
  destPath = os.path.dirname(projPath)
else:
  destPath = bufdir


vim.command('execute ":silent! lcd ' + destPath + '"');
EOF
endfunction

autocmd BufEnter * lcd %:p:h

let &guicursor = &guicursor . ",a:blinkon0"


set cmdheight=2
set matchpairs=(:),{:},[:]

:let php_sql_query = 0
 
let mapleader = ","

" sensible searching (?)
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>


" disable arrow keys!
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap <silent> <Up>      :wincmd k<CR>
noremap <silent> <Down>    :wincmd j<CR>
noremap <silent> <Left>    :wincmd h<CR>
noremap <silent> <Right>   :wincmd l<CR>


noremap   <Leader>v :vsplit<CR>
noremap   <Leader>c :close<CR>
noremap   <Leader>s V`] 
noremap   <Leader>~ :lcd %:p:h<CR>
noremap   <Leader>` :ProjectRootCD<CR>
noremap   <Leader>t :ProjectRootExe CommandT<CR>
noremap   <Leader>T :ProjectRootExe CommandTFlush<CR>:CommandT<CR>
cmap w!! w !sudo tee % >/dev/null

" http://vim.wikia.com/wiki/View_text_file_in_two_columns
"noremap <silent> <Leader>f :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
noremap   <Leader>f :MPage 2<CR>




set directory=/tmp
set backupdir=/Users/fra/.backup

au FileType php nnoremap <Leader>p :!uzbl -g maximized /usr/share/doc/php-doc/html/function.<c-r><c-w>.html > /dev/null 2>&1<cr><cr>
au FileType php map <leader>h :call OpenPhpFunction('<c-r><c-w>')<cr>

let g:sparkupNextMapping = '<c-g>'

let tlist_php_settings = 'php;c:class;d:constant;f:function'

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" NEW in 7.3
"
set colorcolumn=85
hi ColorColumn guibg=#383838
hi ColorColumn ctermbg=Black
set undofile
set undodir=/tmp
" set rnu

noremap <leader><tab> :Scratch<CR>

let sessionman_save_on_exit=1

" PHP documenter script bound to Control-P
autocmd FileType php inoremap <Leader>p <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <Leader>p :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <Leader>p :call PhpDocRange()<CR> 
let g:pdv_cfg_Author = "Francesco Mosca <fmosca@gmail.com>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""

" noremap <C-P> :% ! php_beautifier --filters "Default() DocBlock()"<CR>

inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd InsertLeave * :set number

" Remap code completion to Ctrl+Space
inoremap <C-space> <C-x><C-o>

set splitbelow

set completeopt=longest,menuone

:hi link cssClassName Special


"let g:ackprg="ack\\ -H\\ -a\\ --nocolor\\ --nogroup"
let g:ackprg = 'ag --nogroup --nocolor --column'


if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif


" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let g:LustyJugglerSuppressRubyWarning = 1


let g:user_zen_expandabbr_key = '<c-e>' 
let g:use_zen_complete_tag = 1

set tabstop=4
set softtabstop=4
set shiftwidth=4

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_color_change_percent = 5
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

let NERDTreeWinSize = 50

"nnoremap <silent> <buffer> <cr> :PhpSearchContext<cr>
nmap <silent> <leader>d <Plug>DashGlobalSearch

noremap <Leader>/ :NERDTreeToggle<CR>
noremap <Leader>? :NERDTreeFind<CR>

nnoremap Q <nop>


" XML formatter
function! DoFormatXML() range
	" Save the file type
	let l:origft = &ft

	" Clean the file type
	set ft=

	" Add fake initial tag (so we can process multiple top-level elements)
	exe ":let l:beforeFirstLine=" . a:firstline . "-1"
	if l:beforeFirstLine < 0
		let l:beforeFirstLine=0
	endif
	exe a:lastline . "put ='</PrettyXML>'"
	exe l:beforeFirstLine . "put ='<PrettyXML>'"
	exe ":let l:newLastLine=" . a:lastline . "+2"
	if l:newLastLine > line('$')
		let l:newLastLine=line('$')
	endif

	" Remove XML header
	exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

	" Recalculate last line of the edited code
	let l:newLastLine=search('</PrettyXML>')

	" Execute external formatter
	exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

	" Recalculate first and last lines of the edited code
	let l:newFirstLine=search('<PrettyXML>')
	let l:newLastLine=search('</PrettyXML>')
	
	" Get inner range
	let l:innerFirstLine=l:newFirstLine+1
	let l:innerLastLine=l:newLastLine-1

	" Remove extra unnecessary indentation
	exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

	" Remove fake tag
	exe l:newLastLine . "d"
	exe l:newFirstLine . "d"

	" Put the cursor at the first line of the edited code
	exe ":" . l:newFirstLine

	" Restore the file type
	exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

vmap <silent> <leader>x :FormatXML<CR>

let g:airline_powerline_fonts = 1

let g:airline_left_sep='▙ '
let g:airline_right_sep='▟'


let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']  
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'

let g:phpunit_command = "Dispatch /usr/local/bin/phpunit -c app --stop-on-failure --stop-on-error {test}"

let g:rootmarkers = ['.svn', '.git', '.proj']
noremap <leader>mf :ProjectRootExe call PHPUnitRunCurrentFile()<cr>
nnoremap <leader>mt :ProjectRootExe call PHPUnitRunCurrentTest()<cr>
nnoremap <leader>mp :ProjectRootExe call PHPUnitRunPreviousTest()<cr>
nnoremap <C-i> :ProjectRootExe Ack! <C-r><C-w><CR>

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END


nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

let g:vdebug_options = {}
let g:vdebug_options["break_on_open"] = 0


au FileType qf call AdjustWindowHeight(3, 20)
function! AdjustWindowHeight(minheight, maxheight)
    let l = 1
    let n_lines = 0
    let w_width = winwidth(0)
    while l <= line('$')
        " number to float for division
        let l_len = strlen(getline(l)) + 0.0
        let line_width = l_len/w_width
        let n_lines += float2nr(ceil(line_width))
        let l += 1
    endw
    exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction


let g:tagbar_ctags_bin = "/usr/local/bin/ctags"


inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>

inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)
nmap <CR> za

nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = '—' "matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart(' ' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2
