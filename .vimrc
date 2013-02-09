" My Personalized vimrc file.
" Nai
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

set clipboard=unnamed
call pathogen#infect()

" set your colorscheme. 

" enable 256 colors in GNOME terminal (for my Ubuntu VM)
set term=xterm-256color
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" turn on language specific syntax highlighting
syntax on

colorscheme Tomorrow-Night-Eighties
"colorscheme solarized
"colorscheme ir_black
"colorscheme blackboard
"colorscheme badwolf
"colorscheme desert
"colorscheme zenburn
"colorscheme elflord
"colorscheme django
"colorscheme blacklight
"colorscheme wombat
"colorscheme zellner
"colorscheme evening
"colorscheme torte
"colorscheme pablo
"set transparency=25

filetype on
filetype plugin on
filetype plugin indent on
set backspace=indent,eol,start
syntax enable
set hlsearch

" Mac customizations 
let mapleader = ","

" htmldjango
au FileType htmldjango setlocal shiftwidth=4
au FileType htmldjango setlocal tabstop=4
au FileType htmldjango setlocal softtabstop=4
au FileType htmldjango setlocal expandtab

" tell gnome terminal that 256 colors work
set t_Co=256
" show line numbers
set nu


"
" Keyboard mappings
"
""""""""""""""""""""

map <C-Up> :tabnew<CR>
map <C-Down> :q<CR>
map <C-Left> gT
map <C-Right> gt


"map file save
"map browse files
" in various scenarios, some weird
map <F1> :w<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> -
map <F4> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <F5> :rightbelow vsp <CR>:exec("tag ".expand("<cword>"))<CR>

map <C-s> :w<CR>
imap jj <Esc>:w<CR>

" disable and enable highlights
map <D-j> :nohlsearch<CR>
map <D-J> :set hlsearch<CR>

"Django
"for templates
imap {{     {{ }}<Esc>hhi
imap {%     {% %}<Esc>hhi
imap {#     {# #}<Esc>hhi
" type table,,, to get <table></table>       ### Cool ###
imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kA

""" Maps to opening main Django files 
map mo /models.py<CR><CR>
map rl /urls.py<CR><CR>
map fo /forms.py<CR><CR>
map tp /templates<CR><CR>
map ad /admin.py<CR><CR>
map til /utils.py<CR><CR>

set statusline=%m%F%r%h%w\ %y\ [line:%04l\ col:%04v]\ [%p%%]\ [lines:%L]
set laststatus=2
set shiftwidth=4
set ic
set scs
set tabstop=4
set autoread

"
" put some quick abbreviations
ab javoid href="javascript:void(0);"
ab jaclick onclick="javascript:"
ab br <br />
ab _get $_GET['']
ab _post $_POST['']
ab sefl self

" python settings
autocmd BufRead *.py setlocal shiftwidth=4
autocmd BufRead *.py setlocal tabstop=4
autocmd BufRead *.py setlocal softtabstop=4
autocmd BufRead *.py setlocal expandtab

map ,sh :source ~/.vim/vimsh.vim<CR>
map ,shpy :source ~/.vim/vimsh.vim

command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
	" Building a hash ensures we get each buffer only once
	let buffer_numbers = {}
	for quickfix_item in getqflist()
		let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
	endfor
	return join(values(buffer_numbers))
endfunction

map <leader>b :ls<CR>:b

set guifont=Inconsolata\ Medium\ 14

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}

" ctags 
set tags=./tags,$VIRTUAL_ENV/tags;/
nmap <F12> :!ctags -f $VIRTUAL_ENV/tags -R $VIRTUAL_ENV/lib/python2.7/site-packages ${PWD} &> /dev/null & disown<CR>


" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
