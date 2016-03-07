set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'vim-scripts/QFEnter'
Plugin 'mileszs/ack.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'rizzatti/funcoo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-scripts/LustyJuggler'
Plugin 'scrooloose/nerdtree'
Plugin 'tyok/nerdtree-ack'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'joshtronic/php.vim'
Plugin 'stephpy/vim-phpdoc'
Plugin 'dbakker/vim-projectroot'
Plugin 'vim-scripts/renamer.vim'
Plugin 'vim-scripts/scratch.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'altercation/vim-colors-solarized'
Plugin 'gmarik/sudo-gui.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'beyondwords/vim-twig'
Plugin 'joonty/vdebug'
Plugin 'junegunn/vim-easy-align'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'joonty/vim-phpqa'
Plugin 'rafi/vim-phpspec'
Plugin 'derekwyatt/vim-scala'
Plugin 'docteurklein/vim-symfony'
Plugin 'stephpy/vim-yaml'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'janko-m/vim-test'
Plugin 'leafgarland/typescript-vim'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'henrik/CamelCaseMotion'

let $PATH = "/Users/fra/bin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/opt/local/bin" 
set shell=/bin/bash
set t_Co=256
syntax on
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
colorscheme jellybeans
"if has('gui_running')
"  set t_Co=256
"  colorscheme wombat
"else
"  set t_Co=64
"  colorscheme zenburn
"endif 

set nosmartindent
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
set diffopt+=vertical
set clipboard=unnamed
set mouse=nicr
set cursorline


" simplify diff colors
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red


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


" set gfn=Bitstream\ Vera\ Sans\ Mono\ 9
"set guifont=Envy\ Code\ R:h13
"set gfn=Envy\ Code\ R:h13

"set guifont=M\+\ 2m\ medium:h13
"set gfn=M\+\ 2m\ medium:h13
set guifont=Fantasque\ Sans\ Mono:h14
set gfn=Fantasque\ Sans\ Mono:h14
"set gfn=Inconsolata-dz:h12
"set gfn=Source\ Code\ Pro\ Light:h11
"set guifont=Cousine:h12
"set gfn=Cousine:h12
"set guifont=Consolas:h10


"let Tlist_Use_Right_Window = 1
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_WinWidth = 50
"
"nnoremap <silent> <F8> :TlistToggle<CR>
"let g:tagbar_phpctags_bin='/opt/phpctags/phpctags'
nnoremap <silent> <F8> :TagbarToggle<CR>

filetype plugin indent on

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

" autocmd BufEnter * lcd %:p:h
autocmd BufEnter * if expand("%:p:h") !~ '^fugitive://' | silent! lcd %:p:h | endif

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

if has('nvim')
    tnoremap <silent> <Up>      :wincmd k<CR>
    tnoremap <silent> <Down>    :wincmd j<CR>
    tnoremap <silent> <Left>    <C-\><C-n><C-w>h<CR>
    tnoremap <silent> <Right>   :wincmd l<CR>
endif


noremap   <Leader>v :vsplit<CR>
noremap   <Leader>c :close<CR>
noremap   <Leader>s V`] 
noremap   <Leader>~ :lcd %:p:h<CR>
noremap   <Leader>` :ProjectRootCD<CR>
"noremap   <Leader>t :ProjectRootExe CommandT<CR>
"noremap   <Leader>T :CommandTFlush<CR>:ProjectRootExe CommandT<CR>
cmap w!! w !sudo tee % >/dev/null


" Lower the delay of escaping out of other modes
" set timeout timeoutlen=1000 ttimeoutlen=1
set timeout timeoutlen=300 ttimeoutlen=1



" http://vim.wikia.com/wiki/View_text_file_in_two_columns
"noremap <silent> <Leader>f :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
noremap   <Leader>f :MPage 2<CR>




set directory=/tmp
set backupdir=/Users/fra/.backup

au FileType php let g:phpqa_codecoverage_file = projectroot#guess() . "/build/logs/clover.xml"

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
hi ColorColumn ctermbg=236
set undofile
set undodir=/tmp
" set rnu

noremap <leader><tab> :Scratch<CR>

let sessionman_save_on_exit=1

autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
let g:ycm_filetype_specific_completion_to_disable = {
        \ 'php': 1
        \}

" PHP documenter script bound to Control-P
autocmd FileType php inoremap <Leader>p <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <Leader>p :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <Leader>p :call PhpDocRange()<CR> 
let g:pdv_cfg_Author = "Francesco Mosca <fmosca@gmail.com>"
let g:pdv_cfg_Copyright = ""
let g:pdv_cfg_License = ""

" noremap <C-P> :% ! php_beautifier --filters "Default() DocBlock()"<CR>

"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd InsertLeave * :set number

" Remap code completion to Ctrl+Space
inoremap <C-space> <C-x><C-o>

set splitbelow

set completeopt=longest,menuone
set complete-=i

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

noremap <Leader>? :NERDTreeFind<CR>

nmap <silent> <Leader>/ :call g:WorkaroundNERDTreeToggle()<CR>

function! g:WorkaroundNERDTreeToggle()
  try | :NERDTreeToggle | catch | :NERDTree | endtry
endfunction

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

"let g:airline_left_sep='▙ '
"let g:airline_right_sep='▟'


let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']  
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'
let g:syntastic_error_symbol = '❕'
let g:syntastic_warning_symbol = '🔸'
let g:syntastic_twig_twiglint_exec = 'php'
let g:syntastic_twig_twiglint_exe = 'php ~/.composer/vendor/bin/twig-lint'
let g:syntastic_twig_checkers=['twiglint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_quiet_messages = { "level": "warnings" }
 let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:rootmarkers = ['.svn', '.git', '.proj']

nmap <silent> <leader>mf :ProjectRootExe TestFile<cr>
nmap <silent> <leader>mt :ProjectRootExe TestNearest<cr>
nmap <silent> <leader>mp :ProjectRootExe TestLast<cr>
nmap <silent> <leader>ss :ProjectRootExe PhpSpecSwitch<cr>

let test#php#phpunit#options = '--colors=never -c app --stop-on-failure --stop-on-error '
let test#strategy = "dispatch"

"aug QFClose
"  au!
"  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
"aug END


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


let g:qfenter_open_map = ['<Leader><CR>', '<2-LeftMouse>'] 

function! GitExecInPath(cmd) "{{{2
  if exists('b:git_dir')
    let path = b:git_dir
  else
    let path = fugitive#extract_git_dir('.')
  endif
  let path = fnamemodify(path, ':h')

  return system('cd ' . path . '; ' . a:cmd)
endfunction
" }}}2

augroup gitctags
    au!
    au BufWritePost *.php :call GitExecInPath('git ctags --src-only &')
augroup END

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0


" Close buffer but keep split
nmap <Leader>d :b#<bar>bd#<bar>b<CR>


"CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_files = 0




""" PLANTUML
let g:plantuml_executable_script='/usr/local/bin/plantuml -tsvg '


""" MAKE
nnoremap <leader>m :silent make\|redraw!\|cw<CR>



""" SNIPMATE
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger


let g:php_cs_fixer_path = "~/.composer/vendor/bin/php-cs-fixer"
let g:php_cs_fixer_level = "all"
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
au FileType php let g:php_cs_fixer_command = g:php_cs_fixer_path . ' --config-file=' . projectroot#guess() . "/.php_cs fix "




" Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
" }}}

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 1m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 1m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}
