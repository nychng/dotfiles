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
set t_Co=256

" set your color scheme (replace wombat with whatever yours is called)
" if you're using a gvim or macvim, then your color scheme may have a version
" that uses more than 256 colors
if has("gui_running")
    colorscheme Tomorrow-Night-Eighties
elseif &t_Co == 256
    colorscheme Tomorrow-Night-Eighties
endif

" turn on language specific syntax highlighting
syntax on


"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Bright
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

" insert blank line and return to normal mode
map zj o<Esc>
map zk O<Esc>

map <C-Up> :tabnew<CR>
map <C-Down> :q<CR>
map <C-Left> gT
map <C-Right> gt


"map file save
"map browse files
" in various scenarios, some weird
map <F1> :w<CR>
map <F2> :o <CR>
map <F3> :Ex <CR>
map <F4> :nohl <CR>

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
map vi /views.py<CR><CR>
map fo /forms.py<CR><CR>
map tp /templates<CR><CR>
map ad /admin.py<CR><CR>
map til /utils.py<CR><CR>

" map for JS/PHP long comments used 
" mainly for function descriptions
map <C-c> i/*<CR>*/

""" Maps for tap navigation
map <C-t> :tabnew<CR>
"map <C-w> :tabclose<CR>

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
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}
