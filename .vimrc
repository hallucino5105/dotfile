"""""""""""""""""""
""" general setting
"""""""""""""""""""

set browsedir=buffer
set incsearch
set ignorecase
set number
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set whichwrap=b,s,h,l,<,>,[,]
set nowrap
set nowrapscan
set autoindent
set smartindent
set smartcase
set smarttab
set laststatus=2
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set magic
set backup
set backupdir=~/.vim/backup
set backspace=indent,eol,start
set backupskip=/tmp/*,/private/tmp/*
set hlsearch
set showtabline=1
set wildmenu
set showcmd
set showmode
set cmdheight=1
set hidden
set nolist
set listchars=tab:»\ ,extends:»,precedes:«,nbsp:%
set maxmempattern=10000
set autoread
set nofoldenable
set noautochdir
set tabpagemax=99
set visualbell t_vb=
set noerrorbells

" ステータスラインの表示
set statusline=%t\    "
set statusline+=%<    " 行が長すぎるときに切り詰める位置
set statusline+=(%F)\ "
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか

" 無限undo
if has('persistent_undo')
  set undodir=~/dotfile/.vim/undo
  set undofile
endif

" w!! で sudo で保存
cabbr w!! w !sudo tee > /dev/null %

" ファイルのあるディレクトリに移動
autocmd BufEnter * silent! lcd %:p:h

""" general varient
" 不要な一般プラグイン
let g:loaded_matchparen        = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

" vimproc
let ostype = system('uname')
let archtype = system('uname -p')

if ostype == "Darwin\n"
  let g:vimproc_dll_path = $HOME . '/.vim/dein/repos/github.com/Shougo/vimproc/lib/vimproc_mac.so'
elseif ostype == "Linux\n"
  if archtype == "x86_64\n"
    let g:vimproc_dll_path = $HOME.'/.vim/dein/repos/github.com/Shougo/vimproc/lib/vimproc_linux64.so'
  elseif archtype == "i386\n" || archtype == "i686\n"
    let g:vimproc_dll_path = $HOME.'/.vim/dein/repos/github.com/Shougo/vimproc/lib/vimproc_linux32.so'
  endif
else
  if has('win32')
    let g:vimproc_dll_path = $HOME . '/.vim/dein/repos/github.com/Shougo/vimproc/lib/vimproc_win32.dll'
  elseif has('win64')
    let g:vimproc_dll_path = $HOME . '/.vim/dein/repos/github.com/Shougo/vimproc/lib/vimproc_win64.dll'
  endif
endif

let &directory=&backupdir


""""""""""""""""""
""" plugin setting
""""""""""""""""""
if &compatible
  set nocompatible
endif

let s:dein_path = expand('~/.vim/dein')
let s:dein_conf_path = expand('~/.vimrc-dein.toml')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath^=' . s:dein_repo_path

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)
  call dein#load_toml(s:dein_conf_path)
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim_starting')
  if dein#check_install()
    call dein#install()
  endif
endif


"""""""""""""""""
""" plugin config
"""""""""""""""""

"""" lightline
let g:lightline = { 'colorscheme': 'one' }
"let g:lightline = { 'colorscheme': 'seoul256' }
"let g:lightline = { 'colorscheme': 'powerline' }
"let g:lightline = { 'colorscheme': 'solarized' }
"let g:lightline = { 'colorscheme': 'seoul256' }

""" yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 50
let g:yankround_dir = '~/.cache/yankround'


""" yanktmp
map <silent> Sy :call YanktmpYank()<CR> 
map <silent> Sp :call YanktmpPaste_p()<CR> 
map <silent> SP :call YanktmpPaste_P()<CR> 


""" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_max_list=100
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=2
let g:neocomplcache_auto_completion_start_length=2
let g:neocomplcache_force_overwrite_completefunc=1
let g:neocomplcache_enable_camel_case_completion=0

" 日本語を補完候補として取得しないようにする
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default']='\h\w*'

inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-s> neocomplcache#cancel_popup()
inoremap <expr><C-h> neocomplcache#smart_close_popup()
inoremap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
snoremap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" キー入力時にポップアップを閉じる
inoremap <expr><Up> pumvisible() ? "\<C-y>\<Up>" : "\<Up>"
inoremap <expr><Down> pumvisible() ? "\<C-y>\<Down>" : "\<Down>"
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
"inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
" C-gで補完を元に戻す
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-o> neocomplcache#complete_common_string()

" neocomplcacheを無効化
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.python = ''
let g:neocomplcache_omni_patterns.ruby = ''
let g:neocomplcache_omni_patterns.html = ''


""" neosnippet
let g:neosnippet#snippets_directory='~/dotfile/.vim/snippets/'


""" quickrun
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
    \ 'outputter': 'browser',
    \ 'command': 'markdown2',
    \ 'cmdopt': '-x fenced-code-blocks -x wiki-tables -x hard-wrap -x rid-code-tag',
    \ 'exec': '%c %o %a %s',
    \ }


""" html
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
let g:html_indent_inctags="html,body,head"


""" gundo
nnoremap <F4> :GundoToggle<CR>
let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right = 0


""" scratch
"let no_plugin_maps = 1
let g:scratchBackupFile=$HOME."/.vimscratch"

nnoremap <unique><silent><F7> <Plug>ShowScratchBuffer
inoremap <unique><silent><F7> <Plug>InsShowScratchBuffer


""" tagbar
set tags=./tags,tags;
noremap <F2> :TagbarToggle<CR>


""" unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_session_enable_auto_save = 1
let g:unite_enable_start_insert=0
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_file_mru_limit = 1000
let g:unite_update_time = 1000

nnoremap [unite] <Nop>
nmap f [unite]
" 分割しないでuniteのbufferを表示する
nnoremap [unite]u :<C-u>Unite -no-split<Space>
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>UniteWithCurrentDir buffer file_mru bookmark file -buffer-name=files -direction=belowright<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>Unite file file/new -buffer-name=files -direction=belowright<CR>
" タブ一覧
nnoremap <silent> [unite]r :<C-u>Unite tab -direction=belowright<CR>
"
nnoremap <silent> [unite]q :<C-u>Unite file file_rec/async -buffer-name=files -direction=belowright<CR>
" バッファ一覧
nnoremap <silent> [unite]t :<C-u>Unite buffer -direction=belowright<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru -direction=belowright<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]l :<C-u>Unite file_mru -direction=belowright<CR>
" ブックマーク一覧
nnoremap <silent> [unite]b :<C-u>Unite bookmark -direction=belowright<CR>
" ヤンク履歴
nnoremap <silent> [unite]y :<C-u>Unite history/yank -direction=belowright<CR>
" 変更履歴
nnoremap <silent> [unite]c :<C-u>Unite change -direction=belowright<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep -direction=belowright -no-quit<CR>
" セッション
nnoremap <silent> [unite]s :<C-u>Unite session -direction=belowright<CR>
" mark
nnoremap <silent> [unite]m :<C-u>Unite mark -direction=belowright<CR>
"" register
"nnoremap <silent> [unite]v :<C-u>Unite register -direction=belowright<CR>
" 再呼び出し
nnoremap <silent> [unite]. :<C-u>UniteResume<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction
 
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

call unite#sources#rec#define()
call unite#custom#source('file_rec/async,grep', 'ignore_pattern', 'node_modules')
call unite#custom_default_action('file_rec/async,file_mru,file,buffer,grep' , 'tabopen')


""" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1


""" vimfiler
let g:vimfiler_as_default_explorer = 1


""" easymotion
" ホームポジションに近いキーを使う
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" マッピング
let g:EasyMotion_leader_key = "<Space>"
" デフォルトマッピング
let g:EasyMotion_do_mapping = 1
" 1ストローク選択を優先する
let g:EasyMotion_grouping = 1
" smartcase
let g:EasyMotion_smartcase = 1
"" migemo
"let g:EasyMotion_use_migemo = 1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue
"nmap s <Plug>(easymotion-s2)


""" syntastic
"let g:syntastic_python_checkers = ['pep8', 'pyflakes']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--max-line-length=200 --ignore="F4"'
let g:syntastic_mode_map = {
    \   'mode': 'passive',
    \   'active_filetypes': [],
    \   'passive_filetypes': ['python', 'html', 'haskell']
    \}


""" vimfiler
noremap <silent> <F1> :VimFiler<CR>


""" ag
nmap + :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag<space>


""" srcexpl
" 自動的にプレビューを表示するかどうか
let g:SrcExpl_RefreshTime = 0
" tagsをsrcexpl起動時に自動で作成（更新）するかどうか
let g:SrcExpl_UpdateTags = 1

nnoremap <F3> :SrcExplToggle<CR>

" If the Tabbar Plugin existed
if bufname("%") == "-TabBar-"
  " Move the cursor to the window behind.
  " Because I used to put the TabBar
  " Window on the top position.
  silent! wincmd j
endif


"""" vim-rooter
" Change only current window's directory
let g:rooter_use_lcd = 1
" files/directories for the root directory
let g:rooter_patterns = ['tags', '.git', '.git/', '_darcs/', '.hg/', '.bzr/', 'Makefile', 'GNUMakefile', 'GNUmakefile', '.svn/']
" Automatically change the directory
"autocmd! BufEnter *.c,*.cc,*.cxx,*.cpp,*.h,*.hh,*.java,*.py,*.sh,*.rb,*.html,*.css,*.js :Rooter


""" quickhl
nmap <Space>m <Plug>(quickhl-toggle)
xmap <Space>m <Plug>(quickhl-toggle)
nmap <Space>M <Plug>(quickhl-reset)
xmap <Space>M <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)
xmap <Space>j <Plug>(quickhl-match)


""" vim-jsx
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0


""" indentLine
let g:indentLine_color_term = 23 " 'black'
let g:indentLine_color_gui = '#3B3E4B'
let g:indentLine_char = '|'


""" grep
autocmd QuickFixCmdPost *grep* cwindow


""" vimgo
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1


""""""""""""""""
""" associate
""""""""""""""""

""" file skelton
augroup SkeletonAu
  autocmd!
  autocmd BufNewFile *.html 0r $HOME/dotfile/.vim/skel/skel.html
  autocmd BufNewFile *.cpp 0r $HOME/dotfile/.vim/skel/skel.cpp
  autocmd BufNewFile *.hpp 0r $HOME/dotfile/.vim/skel/skel.hpp
  autocmd BufNewFile *.pl 0r $HOME/dotfile/.vim/skel/skel.pl
  autocmd BufNewFile *.pm 0r $HOME/dotfile/.vim/skel/skel.pm
  autocmd BufNewFile *.py 0r $HOME/dotfile/.vim/skel/skel.py
augroup END


""" markdown
autocmd BufRead,BufNewFile *.mkd set filetype=markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown


""" hiveql
autocmd BufRead,BufNewFile *.hql set filetype=sql


""" actionscript,mxml
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml

""" ejs
autocmd BufNewFile,BufRead *.ejs set filetype=html


""" typescript
autocmd BufRead,BufNewFile *.ts  set filetype=typescript
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx


""" scala
au BufNewFile,BufRead *.scala setf scala


""" python
" VimでPythonのコメント行を入力しようとするとインデントが解除されてしまうアレ
autocmd FileType python :inoremap # X#

""" handlebars template
autocmd BufNewFile,BufRead *.hbs set filetype=xhtml


""" ect template
autocmd BufNewfile,BufRead *.ect set filetype=xhtml


"""
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


""" disable auto comment complement after new-lines
autocmd FileType * setlocal formatoptions-=ro


""" Rename
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))


""" jsx
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx


""""""""""""""""
""" difforig
""""""""""""""""
set splitright
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

nnoremap <F7> :DiffOrig<CR>


""""""""""""""""
""" vim session
""""""""""""""""
" 現在のディレクトリ直下の .vimsessions/ を取得
let s:local_session_directory = xolox#misc#path#merge(getcwd(), '.vimsessions')
if isdirectory(s:local_session_directory)
  " session保存ディレクトリをそのディレクトリの設定
  let g:session_directory = s:local_session_directory
  " vim終了時に自動保存
  let g:session_autosave = 'yes'
  " 引数なしでvimを起動した時にsession保存ディレクトリのdefault.vimを開く
  let g:session_autoload = 'yes'
  " 1分間に1回自動保存
  let g:session_autosave_periodic = 1
else
  let g:session_autosave = 'no'
  let g:session_autoload = 'no'
endif
unlet s:local_session_directory


""""""""""""""""
""" tabbar
""""""""""""""""
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

" tc 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
map <silent> [Tag]n :tabnext<CR>
nnoremap <tab> :tabnext<CR>
"inoremap <tab> :tabnext<CR>
" tp 前のタブ
map <silent> [Tag]p :tabprevious<CR>
nnoremap <S-tab> :tabprevious<CR>
"inoremap <S-tab> :tabprevious<CR>

nnoremap <CR> G
nnoremap <BS> gg

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


"""""""""""""""""
""" color setting
"""""""""""""""""
syntax on

let g:onedark_termcolors=256

" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
  syntax on

  " PODバグ対策
  syn sync fromstart
endif


if has('mac')
  set background=dark

  "colorscheme badwolf
  "highlight LineNr ctermfg=162

  colorscheme onedark
  highlight LineNr ctermfg=8

  highlight Normal ctermbg=none
  highlight LineNr ctermbg=none
  highlight EndOfBuffer ctermbg=none

  "let g:solarized_termcolors=16
  "let g:solarized_termtrans=0
  "let g:solarized_degrade=0
  "let g:solarized_bold=1
  "let g:solarized_underline=1
  "let g:solarized_italic=1
  "let g:solarized_contrast='normal'
  "let g:solarized_visibility='normal'
  "colorscheme solarized

  "colorscheme jellybeans 
  "colorscheme molokai
  "colorscheme peachpuff
  "colorscheme slate
  "colorscheme darkblue
elseif has('linux') || has('unix')
  set background=dark

  "colorscheme badwolf
  "highlight LineNr ctermfg=162

  colorscheme onedark
  highlight LineNr ctermfg=8

  highlight Normal ctermbg=none
  highlight LineNr ctermbg=none
  highlight EndOfBuffer ctermbg=none

  "colorscheme elflord
  "colorscheme peachpuff
  "colorscheme molokai
elseif has('win32') || has('cygwin') || has("win32unix")
  colorscheme molokai
endif

" pyflakeが使う
hi SpellBad ctermfg=darkred guifg=darkred

" tabとか
hi SpecialKey ctermfg=0 guifg=darkgray

" ...
hi PmenuSel ctermfg=248 ctermbg=0

" vim-signature
hi SignColumn ctermbg=8


"""""""""""""""
""" key setting
"""""""""""""""
noremap <C-a> <Home>
inoremap <C-a> <Home>
noremap <C-e> <End>
inoremap <C-e> <End>
noremap <C-f> <PageDown>
inoremap <C-f> <PageDown>
noremap <C-b> <PageUp>
inoremap <C-b> <PageUp>

noremap  
noremap!  
noremap <BS> 
noremap! <BS> 

" ハイライト消去
nnoremap <C-n> :nohlsearch<CR>

" 挿入モードで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 表示行単位で移動
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap k gk
onoremap k gk
xnoremap k gk

" ノーマル/インサートモードでカーソルの形状を変更する
if &term =~ "screen" || &term=~"screen-256color"
    "let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
    "let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term =~ "xterm" || &term=~"xterm-256color"
    let &t_SI = "\e]50;CursorShape=1\x7"
    let &t_EI = "\e]50;CursorShape=0\x7"
endif


" c*でカーソル下のキーワードを置換
nnoremap <expr> c* ':%s ;\<' . expand('<cword>') . '\>;'
vnoremap <expr> c* ':s ;\<' . expand('<cword>') . '\>;'

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" buffer
nnoremap [Buf] <Nop>
nmap z [Buf]
nnoremap [Buf] <Nop>
nnoremap [Buf]j <C-w>j
nnoremap [Buf]k <C-w>k
nnoremap [Buf]l <C-w>l
nnoremap [Buf]h <C-w>h
nnoremap [Buf]J <C-w>J
nnoremap [Buf]K <C-w>K
nnoremap [Buf]L <C-w>L
nnoremap [Buf]H <C-w>H
nnoremap [Buf]n :<C-u>tabnext<CR>
nnoremap [Buf]p :<C-u>tabprevious<CR>
nnoremap [Buf]t :<C-u>tabnew<CR>
nnoremap [Buf]c :<C-u>tabnew<CR>
nnoremap [Buf]r <C-w>r
nnoremap [Buf]= <C-w>=
nnoremap [Buf]w <C-w>w
nnoremap [Buf]o <C-w>_<C-w>|
nnoremap [Buf]O <C-w>=
nnoremap [Buf]s :<C-u>sp<CR>
nnoremap [Buf]v :<C-u>vs<CR>
nnoremap [Buf]q :<C-u>q<CR>
nnoremap [Buf]Q :<C-u>bd<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')


" C-c
inoremap <C-c> <ESC>

" コピペ1行
noremap - ddkP
noremap ^ ddjP

" visual mark
map <F5> <Plug>Vm_toggle_sign


"""""""""""""""
""" gui setting
"""""""""""""""
if has('gui_macvim') || has('kaoriya') || has('gvim')
  set guioptions-=T
  set guioptions+=a
  "set guifont=Monaco:h10

  if has('win32')
    set guifont=Ricty:h9
    set lines=50 columns=170
  elseif has('mac')
    set guifont=Ricty:h12
    set lines=55 columns=180
  endif

  "colorscheme wombat
  "colorscheme lucius
  "colorscheme darkeclipse
  colorscheme onedark
endif


""""""""""""""""
"""" nvim
""""""""""""""""
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
  nnoremap <F5> :terminal<CR>
endif


"""""""""""""""
""" misc
"""""""""""""""
set showcmd
set iskeyword+=-
set backupcopy=yes

set runtimepath+=~/dotfile/.vim,~/dotfile/.vim/after

let g:go_version_warning = 0

