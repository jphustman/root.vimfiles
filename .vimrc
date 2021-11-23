" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" vimrc for root

" identify platform
silent function! OSX()
    return has('macunix')
endfunction
silent function! UNIX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
silent function! WINDOWS()
    return (has('win16') || has('win32') || has('win64'))
endfunction



" Dein
if &compatible
    set nocompatible               " Be iMproved
endif

" For Solaris (Also currently only version 2.2 is supported)
if substitute(system('uname'), "\n", "", "") == "SunOS"
    " set at system level so the same for everyone	
    set runtimepath+=/usr/share/vim/.cache/dein/repos/github.com/Shougo/dein.vim
else
    " figure out rest when working on other platforms (Same on Ubuntu)
    set runtimepath+=/usr/share/vim/.cache/dein/repos/github.com/Shougo/dein.vim
endif

call dein#begin(expand('/usr/share/vim/.cache/dein'))

" Let dein manage dein
" Required:
call dein#add('/usr/share/vim/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your Bundles here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tpope/vim-fugitive')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('junegunn/vim-easy-align')                                                                                                                                                                            

call dein#add('scrooloose/nerdcommenter')
call dein#add('scrooloose/nerdtree')

call dein#add('vim-syntastic/syntastic')

call dein#add('spf13/PIV')

call dein#add('vim-scripts/apachelogs.vim')

call dein#add('terryma/vim-multiple-cursors')

" deol.nvim requires Neovim 0.3+ or Vim 8.2.1978+
if v:versionlong >= 80201978
    call dein#add('Shougo/deol.nvim')
endif

call dein#end()
call dein#save_state()


let g:netrw_liststyle=3
scriptencoding utf-8
set encoding=utf-8


" Required:
filetype plugin indent on
syntax enable

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
if dein#check_install()
    call dein#install()
endif
" }


set mousehide
scriptencoding utf-8

set tags=./tags



"set autowrite
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

set background=dark

set complete+=kspell
set ttyfast
set magic " Better searching
set lazyredraw

set autoread
set showmatch
set matchtime=3




"if &term == 'xterm' || &term == 'screen'
"	set t_Co=256 "Enable 256 colors to stop the CSApprox warning and make xterm vim shine
"	set background=light
"endif
set term=xterm-256color

au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Vim UI {
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme solarized             " Load a colorscheme

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
"highlight clear CursorLineNr    " Remove highlight color from current line number

if has('cmdline_info')
  set ruler                   " Show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
  set showcmd                    " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=2
  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r               " Options

  if !exists('g:override_spf13_bundles')
    set statusline+=%{fugitive#statusline()} " Git Hotness
  endif
  set statusline+=\ [%{&ff}/%Y] " Filetype
  set statusline+=\ [%{getcwd()}] " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
"set list
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set showtabline=2
set noshowmode

set shiftround

set visualbell
set t_vb=

set title

set comments=sl:/*,mb:*,elx:*/

highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

" }


" { Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perlcritic']

" }

" NerdTree {
if isdirectory(expand("/root/.vim/bundle/repos/github.com/scrooloose/nerdtree"))

	map <C-e> <plug>NERDTreeTabsToggle<CR>
	map <leader>e :NERDTreeFind<CR>
	nmap <leader>nt :NERDTreeFind<CR>

	let g:NERDTreeShowBookmarks=1
	let g:NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^.hg$', '^.svn$', '\.bzr$']
	let g:NERDTreeChDirMode=0
	let g:NERDTreeQuitOnOpen=0
	let g:NERDTreeMouseMode=2
	let g:NERDTreeShowHidden=1
	let g:NERDTreeKeepTreeInNewTab=1
	let g:nerdtree_tabs_open_on_gui_startup=0

endif

" Initialize NERDTree as needed
function! NERDTreeInitAsNeeded()
	redir => bufoutput
	buffers!
	redir END
	let idx = stridx(bufoutput, "NERD_tree")
	if idx > -1
		NERDTreeMirror
		NERDTreeFind
		wincmd 1
	endif
endfunction
" }

" set backup
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

set history=1000

let g:mapleader=","

" Formatting {

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Stop Autocommenting!
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set smartindent
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set tabstop=2

set columns=120
set lines=40
set modeline
set modelines=5

set cmdheight=2

set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
vnoremap <C-c> "+y
" }

imap jk <Esc>


autocmd BufNewFile,BufRead access.log,error.log set ft=apachelogs

" RegularInitialize directories {
function! InitializeDirectories()
    let parent = $HOME
    let prefix = 'vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = parent . '/.' . prefix

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists('*mkdir')
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo 'Warning: Unable to create backup directory: ' . directory
            echo 'Try: mkdir -p ' . directory
        else
            let directory = substitute(directory, ' ', '\\\\ ', 'g')
            exec 'set ' . settingname . '=' . directory
        endif
    endfor
endfunction
call InitializeDirectories()
" }


