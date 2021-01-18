"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Juan Pablo Almonacid <jpalmonacidv@gmail.com>
"		Based on Amir Salihefendic work <amix@amix.dk>
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files, backups and undo
"    -> Text, tab and indent related
"    -> Custom functions
"    -> General key mapping
"    -> Vim Scripts configuration & mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manage your 'runtimepath' with ease. In practical terms, pathogen.vim makes
" it super easy to install plugins and runtime files in their own private
" directories.
runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Less compatible with vi
set nocompatible

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"set term=xterm

" Yank text-object or motion into the '+' register which represents the
" system's clipboard.
set clipboard=unnamedplus

let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

" coc - TextEdit might fail if hidden is not set.
set hidden

" coc - Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" coc - Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
" Ignore these files when completing names
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,cache/*,logs/*,*/storage/*

"Always show current position
set ruler
set relativenumber

" Display line numbers
set number

" Height of the command bar
"set cmdheight=2

" Recommended settings for Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256       " Explicitly tell Vim that the terminal supports 256 colors

" Always shot tab line
set showtabline=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" For regular expressions turn magic on
"set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight column 80
set colorcolumn=80
au BufNewFile,BufRead *.blade.php,*.html setl colorcolumn=

" Highlight cursor line and column
set cursorline
set cursorcolumn

" coc - Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark
colorscheme gruvbox

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
autocmd BufWritePre * :%s%\s\+$%%e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set foldmethod=indent
set foldlevel=1

" Set backspace with eol and start behaviour. (Added for delimitMate)
set bs=eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative numbers toggle
function! RNuToggle()
  if(&relativenumber == 1)
    set relativenumber!
  else
    set relativenumber
  endif
endfunc

" Toggle paste option value
function! PasteToggle()
  if(&paste == 1)
    set paste!
  else
    set paste
  endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mapping
let mapleader = "ñ"

" Clears the search highlights when pressing Lh
nnoremap <Leader>h :nohlsearch<CR>

" Write whole buffer into current file
nnoremap <Leader>w :write<CR>

" Reorder tabs
nnoremap <Leader>gtf :tabm 0<CR>
nnoremap <Leader>gtl :tabm<CR>
nnoremap <Leader>gt :<C-U>exe "tabm +" . v:count1<CR>
nnoremap <Leader>gT :<C-U>exe "tabm -" . v:count1<CR>
nnoremap <Leader>tf :tabr<CR>
nnoremap <Leader>tl :tabl<CR>
nnoremap <Leader>tc :tabc<CR>
nnoremap <Leader>to :tabo<CR>
nnoremap <Leader>tn :tabnew<CR>

" Map toggle of relative numbers function
nnoremap <Leader>r :call RNuToggle()<CR>
nnoremap <Leader>p :call PasteToggle()<CR>

" Navigate Quickfix
noremap <Leader>qn :cnext<CR>
noremap <Leader>qN :cNext<CR>
noremap <Leader>qf :cfirst<CR>
noremap <Leader>ql :clast<CR>

" Navigate location-list
noremap <Leader>ln :lnext<CR>
noremap <Leader>lN :lNext<CR>
noremap <Leader>lf :lfirst<CR>
noremap <Leader>ll :llast<CR>

" Navigate tags
noremap <Leader>} :tnext<CR>
noremap <Leader>{ :tprevious<CR>
noremap <Leader>[ :trewind<CR>
noremap <Leader>] :tlast<CR>

" Scroll history with ex commands scrollers
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Navigate windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Scripts configuration & mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ------  Airline  ------
let g:airline_theme = 'gruvbox'
let g:airline#extensions#branch#format = 2
let g:airline#extensions#branch#displayed_head_limit = 20
let g:airline#extensions#hunks#enabled = 0
let g:airline_exclude_preview = 1

" ------  Coc  ------
let g:coc_node_path='~/.nvm/versions/node/v12.16.3/bin/node'

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <Leader>jd <Plug>(coc-definition)
nmap <silent> <Leader>jt <Plug>(coc-type-definition)
nmap <silent> <Leader>ji <Plug>(coc-implementation)
nmap <silent> <Leader>ju <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>jr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>jf  <Plug>(coc-format-selected)
nmap <leader>jf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ja  <Plug>(coc-codeaction-selected)
nmap <leader>ja  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>jc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>jq  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ------  Commentary  ------
autocmd FileType blade setlocal commentstring={{--\ %s\ --}}

" ------  CtrlP  ------
let g:ctrlp_map = '<Leader>.'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:50'
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 'eT'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_mruf_relative = 1
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s --path-to-ignore ~/.agignore -l --nocolor -U --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif
noremap <Leader>.ta :CtrlPTag<CR>
noremap <Leader>.t :CtrlPBufTag<CR>
noremap <Leader>.tb :CtrlPBufTagAll<CR>
noremap <Leader>.b :CtrlPBuffer<CR>
noremap <Leader>.l :CtrlPLine<CR>
noremap <Leader>.u :CtrlPUndo<CR>
noremap <Leader>.r :CtrlPMRUFiles<CR>
noremap <Leader>.c :CtrlPChangesAll<CR>

" ------  CtrlP sessions  ------
let g:ctrlp_session_path = '~/.vim/sessions'
noremap <Leader>.s :CtrlPSession<CR>

" ------  DelimitMate  ------
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1

" ------  EasyAlign  ------
nmap <Leader>a <Plug>(EasyAlign)
xmap <Leader>a <Plug>(EasyAlign)

" ------  EasyGrep  ------
let g:EasyGrepMode = 2
let g:EasyGrepReplaceWindowMode = 2
let g:EasyGrepCommand = 1
let g:EasyGrepRecursive = 1
let g:EasyGrepEveryMatch = 1
let g:EasyGrepFilesToExclude="storage/"
let g:EasyGrepCommand="ag"
let g:EasyGrepFileAssociations=$HOME . "/.vim/myEasyGrepFileAssociations"

" ------  Git Gutter ------
nmap <silent> <Leader>gs <Plug>GitGutterStageHunk
nmap <silent> <Leader>gu <Plug>GitGutterUndoHunk
nmap <silent> <Leader>gp <Plug>GitGutterPreviewHunk

" ------  Gutentags  ------
let gutentags_ctags_tagfile = '.vimtags'

" ------  Emmet  ------
let g:user_emmet_leader_key = '<Leader>y'

" ------  Incsearch  ------
map g/ <Plug>(incsearch-stay)

" ------  Incsearch Easymotion ------
map <Leader>/ <Plug>(incsearch-easymotion-/)
map <Leader>? <Plug>(incsearch-easymotion-?)
map <Leader>g/ <Plug>(incsearch-easymotion-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" ------  Indent Guides  ------
let g:indent_guides_guide_size = 1
let g:indent_guides_space_guides = 1

" ------  jsdoc  ------
let g:jsdoc_enable_es6 = 1

" ------  jsx  ------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" ------  Localvimrc  ------
let g:localvimrc_sandbox = 0
let g:localvimrc_debug = 0

" ------  matchtagalways ------
let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'html.php' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ 'blade' : 1,
            \ 'blade.php' : 1,
            \}

" ------  multiple-cursors  ------
let g:multi_cursor_select_all_word_key = '<C-s>'
let g:multi_cursor_select_all_key      = 'g<C-s>'

" ------  NERDCommenter  ------
let g:NERDSpaceDelims = 1
let g:NERDCustomDelimiters = {
    \ 'blade': { 'left': '{{--', 'right': '--}}' }
\}

" ------  NERDTree  ------
let g:NERDTreeWinSize = 50
let g:NERDTreeQuitOnOpen = 1
noremap <silent> <Leader>n :NERDTreeToggle<CR>
noremap <silent> <Leader>nf :NERDTreeFind<CR>

" ------  PDV - PHP Documentor for VIM - 2 ------
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

" ------  PHP Code Style Fixer ------
let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_verbose = 1
let g:php_cs_fixer_enable_default_mapping = 0

" ------  Php Refactoring Toolbox  ------
let g:vim_php_refactoring_use_default_mapping = 0

" ------  PreserveNoEOL  ------
let g:PreserveNoEOL = 1

" ------  Session  ------
let g:session_autoload = 'no'

" ------  Tagbar Options  ------
"let g:tagbar_ctags_bin
let g:tagbar_autoclose = 1
let g:tagbar_left = 1
let g:tagbar_width = 50
noremap <silent> <Leader>b :TagbarToggle<CR>
noremap <silent> <Leader>bo :TagbarOpenAutoClose<CR>

" ------  UltiSnips  ------
let g:UltiSnipsSnippetsDir = '~/.vim/myUltiSnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'myUltiSnips']
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsListSnippets = '<c-h>'
let g:UltiSnipsEditSplit = 'context'
"let g:UltiSnipsJumpForwardTrigger = <c-j>
"let g:UltiSnipsJumpBackwardTrigger = <c-k>

" ------  Vdebug  ------
let g:vdebug_options = { 'watch_window_style' : 'compact' }
let g:vdebug_keymap = {}
let g:vdebug_keymap['eval_visual'] = '<Leader>ve'

"let g:vdebug_options = {
"    \ "watch_window_style" : "compact",
"    \ "path_maps" : {
"        \ "/target-path" : "/src-path"
"    \},
"    \ "server" : "127.0.0.1"
"\}


set secure
