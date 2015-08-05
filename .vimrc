"""""""""""""""""""
""" general setting
"""""""""""""""""""
set browsedir=buffer
set nocompatible
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
set showmatch
set matchtime=3
set autoindent
set smartindent
"set cindent
set smartcase
set smarttab
"set hlsearch
set laststatus=2
"set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}¥)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%l,%c\ (%p%%)]
"set clipboard+=unnamedplus,unnamed
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set magic
set backup
set backupdir=~/dotfile/.vim/backup
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
set iskeyword+=-

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
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=%1l   " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数
set statusline+=,
set statusline+=%c    " 何列目にカーソルがあるか
set statusline+=%V    " 画面上の何列目にカーソルがあるか
set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか

"" カーソル行をハイライト
""  -> カーソル移動が重くなる原因なのでやめ
"set cursorline
"" カレントウィンドウにのみ罫線を引く
"augroup cch
"    autocmd! cch
"    autocmd WinLeave * set nocursorline
"    autocmd WinEnter,BufRead * set cursorline
"augroup END

" 自動再読み込み
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

" trailing spaces highlight
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces guibg=Black ctermbg=234
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


" 無限undo
if has('persistent_undo')
    set undodir=~/dotfile/.vim/undo
    set undofile
endif

" grep
set grepprg=grep\ -nH


""" general varient
let loaded_matchparen=1
let &directory=&backupdir

let ostype = system('uname')
let archtype = system('uname -p')

if ostype == "Darwin\n"
    let g:vimproc_dll_path = $HOME . '/dotfile/.vim/bundle/vimproc/autoload/vimproc_mac.so'
elseif ostype == "Linux\n"
    if archtype == "x86_64\n"
        let g:vimproc_dll_path = $HOME.'/dotfile/.vim/bundle/vimproc/autoload/vimproc_linux64.so'
    elseif archtype == "i386\n" || archtype == "i686\n"
        let g:vimproc_dll_path = $HOME.'/dotfile/.vim/bundle/vimproc/autoload/vimproc_linux32.so'
    endif
else
    if has('win32')
        let g:vimproc_dll_path = $HOME . '/dotfile/.vim/bundle/vimproc/autoload/vimproc_win32.dll'
    elseif has('win64')
        let g:vimproc_dll_path = $HOME . '/dotfile/.vim/bundle/vimproc/autoload/vimproc_win64.dll'
    endif
endif


""""""""""""""""""
""" plugin setting
""""""""""""""""""
set nocompatible
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/dotfile/.vim/neobundle/
    call neobundle#rc(expand('~/dotfile/.vim/bundle'))
endif

source $VIMRUNTIME/macros/matchit.vim

" fetch
NeoBundleFetch 'Shougo/neobundle.vim'

" color
NeoBundle 'Lucius'
NeoBundle 'Zenburn'
NeoBundle 'molokai'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nanotech/jellybeans.vim'

" syntax
NeoBundle 'jQuery'
NeoBundle 'JSON.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'autowitch/hive.vim'
NeoBundle 'JulesWang/css.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'stephpy/vim-yaml'

" indent
NeoBundle 'html-improved-indentation'
NeoBundleLazy 'hynek/vim-python-pep8-indent', { "autoload": { "insert": 1, "filetypes": ["python", "python3", "djangohtml"] }}

" vimproc
NeoBundle 'Shougo/vimproc.git', { 'build': {
    \ 'mac': 'make -f make_mac.mak',
    \ 'unix': 'make -f make_unix.mak',
    \ 'cygwin': 'make -f make_cygwin.mak',
    \ 'windows': 'make -f make_mingw32.mak',
    \ }}

" unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite-session', { 'depends': 'Shougo/unite.vim' }
NeoBundle 'kannokanno/unite-dwm', { 'depends': 'Shougo/unite.vim' }

" other
NeoBundle 'neocomplcache'
"NeoBundle 'vimgrep.vim'
NeoBundle 'eregex.vim'
NeoBundle 'yanktmp.vim'
NeoBundle 'surround.vim'
NeoBundle 'quickrun.vim'
NeoBundle 'scratch.vim'
NeoBundle 'sudo.vim'
NeoBundle 'taglist.vim'
NeoBundle 'dbext.vim'
NeoBundle 'fugitive.vim'
NeoBundle 'gitv'
NeoBundle 'occur.vim'
NeoBundle 'renamer.vim'
NeoBundle 'camelcasemotion'
NeoBundle 'sjl/gundo.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'open-browser.vim'
NeoBundle '5t111111/neat-json.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'closetag.vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'chase/vim-ansible-yaml'

" nouse
"NeoBundle 'editorconfig/editorconfig-vim'
"NeoBundle 'VimRepress'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'kevinw/pyflakes-vim'
"NeoBundle 'mitechie/pyflakes-pathogen'
"NeoBundle 'davidhalter/jedi-vim'
"NeoBundle 'Align'
"NeoBundle 'Yggdroot/indentLine' " 重い
"NeoBundle 'kana/vim-smartinput' " 邪魔
"NeoBundle 'othree/html5.vim'
"if !has('gui_macvim')
"    NeoBundle 'VimRepress'
"    "NeoBundle 'minibufexpl.vim'
"    "NeoBundle 'bufferlist.vim'
"endif

filetype plugin indent on


"""""""""""""""""
""" plugin config
"""""""""""""""""

""" YankRing
let g:yankring_max_history=50
let g:yankring_history_dir='~/dotfile/.vim/bundle/YankRing.vim'
let g:yankring_manual_clipboard_check=1


""" yanktmp
let g:yanktmp_file=$HOME.'/dotfile/.vim/bundle/yanktmp.vim/.vimyanktmp'
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR> 


""" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_max_list=100
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_auto_completion_start_length=3
let g:neocomplcache_force_overwrite_completefunc=1

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

" Avoid crash by editing python source
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.python = ''
let g:neocomplcache_omni_patterns.ruby = ''


""" quickrun
"'cmdopt': '-x fenced-code-blocks -x wiki-tables -x hard-wrap -x rid-code-tag -x html-classes=\{\"pre\":\"syntaxhighlight\"\}',

let g:quickrun_config = {}
let g:quickrun_config['mkd'] = {
    \ 'outputter': 'browser',
    \ 'command': 'markdown2',
    \ 'cmdopt': '-x fenced-code-blocks -x wiki-tables -x hard-wrap -x rid-code-tag',
    \ 'exec': '%c %o %a %s',
    \ }


""" gundo
nnoremap <F5> :GundoToggle<CR>


""" scratch
"let no_plugin_maps = 1
let g:scratchBackupFile=$HOME."/.vimscratch"

nnoremap <unique><silent><F7> <Plug>ShowScratchBuffer
inoremap <unique><silent><F7> <Plug>InsShowScratchBuffer


""" sudo
nnoremap :es :e sudo:%<CR><C-^>:bd!
nnoremap :ws :w sudo:%<CR>


""" vcscommand
"noremap <F8> :VCSDiff<CR>


""" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1


""" taglist
set tags=./tags,tags;
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1
"let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let g:tlist_javascript_settings = 'javascript;c:class;m:method;F:function;p:property'
noremap <F4> :TlistToggle<CR>


""" BufferList
"map <silent> <C-x> :call BufferList()<CR>
"let g:BufferListWidth=25
"let g:BufferListMaxWidth=40


""" MemoList
let g:memolist_path = "~/.vimmemo"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
"let g:memolist_memo_date = "epoch"
"let g:memolist_memo_date = "%D %T"
"let g:memolist_prompt_tags = 1
"let g:memolist_prompt_categories = 1
"let g:memolist_qfixgrep = 1
"let g:memolist_vimfiler = 1
"let g:memolist_template_dir_path = "path/to/dir"
map <Leader>ml :MemoList<CR>
map <Leader>mn :MemoNew<CR>
map <Leader>mg :MemoGrep<CR>


""" unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_session_enable_auto_save = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_file_mru_limit = 1000
let g:unite_update_time = 1000

nnoremap [unite] <Nop>
nmap r [unite]
" 分割しないでuniteのbufferを表示する
nnoremap [unite]u :<C-u>Unite -no-split<Space>
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>UniteWithCurrentDir buffer file_mru bookmark file -buffer-name=files -direction=belowright -start-insert<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>Unite file file/new -buffer-name=files -direction=belowright -start-insert<CR>
" バッファ一覧
nnoremap <silent> [unite]t :<C-u>Unite buffer -direction=belowright -start-insert<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru -direction=belowright -start-insert<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru -direction=belowright -start-insert<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files file file/new -direction=belowright -start-insert<CR>
" ブックマーク一覧
nnoremap <silent> [unite]b :<C-u>Unite bookmark -direction=belowright -start-insert<CR>
" ヤンク履歴
nnoremap <silent> [unite]y :<C-u>Unite history/yank -direction=belowright -start-insert<CR>
" 変更履歴
nnoremap <silent> [unite]c :<C-u>Unite change -direction=belowright -start-insert<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep -direction=belowright -no-quit -start-insert<CR>
" セッション
nnoremap <silent> [unite]s :<C-u>Unite session -direction=belowright< -start-insertCR>
" dwm
nnoremap <silent> [unite]w :<C-u>Unite dwm -direction=belowright -start-insert<CR>
" neobundle
nnoremap <silent> [unite]n  :<C-u>Unite neobundle -direction=belowright -start-insert<CR>
nnoremap <silent> [unite]ns :<C-u>Unite neobundle/search -direction=belowright -start-insert<CR>
" register
nnoremap <silent> [unite]r :<C-u>Unite register -direction=belowright -start-insert<CR>
" 再呼び出し
nnoremap <silent> [unite]. :<C-u>UniteResume -start-insert<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " 単語単位からパス単位で削除するように変更
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
endfunction


"""" 検索語が真ん中に来るように
"nmap n nzz
"nmap N Nzz
"nmap * *zz
"nmap # #zz
"nmap g* g*zz
"nmap g# g#zz


""" indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


"""" gitv
"autocmd FileType git :setlocal foldlevel=99


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
autocmd BufRead,BufNewFile *.mkd  set filetype=mkd
autocmd BufRead,BufNewFile *.md  set filetype=mkd


""" hiveql
autocmd BufRead,BufNewFile *.hql set filetype=sql

""" actionscript,mxml
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml


""" python
"autocmd FileType python setl autoindent
"autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
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


"""" vimfiler
"let g:vimfiler_as_default_explorer = 1


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

nmap s <Plug>(easymotion-s2)


""" dwm
nnoremap <c-j> <c-w>w
nnoremap <c-k> <c-w>W
nnoremap <Tab> <c-w>w
nnoremap <s-Tab> <c-w>W
nmap <m-r> <Plug>DWMRotateCounterclockwise
nmap <m-t> <Plug>DWMRotateClockwise
nmap <c-n> <Plug>DWMNew
nmap <c-c> <Plug>DWMClose
nmap <c-@> <Plug>DWMFocus
nmap <c-Space> <Plug>DWMFocus
nmap <c-l> <Plug>DWMGrowMaster
nmap <c-h> <Plug>DWMShrinkMaster


""" vim-markdown
let g:vim_markdown_folding_disabled=1


""" occur
" 検索結果一覧
noremap <F2> :Occur<CR>


"""" simple-javascript-indenter
"" この設定入れるとshiftwidthを1にしてインデントしてくれる
"let g:SimpleJsIndenter_BriefMode = 4
"" この設定入れるとswitchのインデントがいくらかマシに
"let g:SimpleJsIndenter_CaseIndentLevel = -1


""" syntastic
"let g:syntastic_python_checkers = ['pep8', 'pyflakes']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--max-line-length=200 --ignore="F4"'
let g:syntastic_mode_map = {
    \   'mode': 'passive',
    \   'active_filetypes': [],
    \   'passive_filetypes': ['python', 'html', 'haskell']
    \}


"""" vim-indent-guides
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_color_change_percent = 10
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black guibg=black
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey guibg=darkgrey


""" IndentLine
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#2e2e2e'
"let g:indentLine_char = '|'


""" NERDTree
noremap <silent> <F1> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=0
let g:NERDTreeDirArrows=1


"""" smartinput
"call smartinput#define_rule({
"    \   'at': '\s\+\%#',
"    \   'char': '<CR>',
"    \   'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
"    \})
"
"call smartinput#define_rule({
"    \   'at': '\%#',
"    \   'char': '<',
"    \   'input': '<>',
"    \   'filetype': ['html', 'xml', 'xhtml', 'eruby'],
"    \})
"
"call smartinput#define_rule({
"    \   'at': '<.*\%#>',
"    \   'char': '>',
"    \   'input': '',
"    \   'filetype': ['html', 'xml', 'xhtml', 'eruby'],
"    \})


"""""""""""""""""
""" ex command
"""""""""""""""""

" Open junk file
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/memo'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction


"""""""""""""""""
""" color setting
"""""""""""""""""
syntax on


" ターミナルタイプによるカラー設定
"if &term =~ 'xterm-256color' || 'screen-256color'
"  " 256色
"  set t_Co=256
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"elseif &term =~ 'xterm-debian' || &term =~ 'xterm-xfree86'
"  set t_Co=16
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"elseif &term =~ 'xterm-color'
"  set t_Co=8
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif


" ref by ~/program_ym0/cardinal/tech/term_color_palette/term_color_palette.py
"hi Pmenu ctermfg=4 ctermbg=59
"hi PmenuSel ctermfg=0 ctermbg=254
"hi PmenuSbar guibg=#333333
"hi CursorLine term=None cterm=None ctermbg=235 gui=underline
""hi BufferSelected term=reverse ctermfg=black ctermbg=red cterm=bold
"hi BufferNormal term=NONE ctermfg=black ctermbg=black cterm=NONE
"hi StatusLine term=bold,reverse ctermfg=231 ctermbg=238 guifg=#ffffff guibg=#666666
""hi LineNr ctermfg=28


" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の'　'は全角スペース
        syntax match InvisibleJISX0208Space '　' display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace '[ \t]\+$' display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab '\t' display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=1 gui=undercurl guisp=darkslategray
    endfunction

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif


" pyflakeが使う
hi SpellBad ctermfg=darkred guifg=darkred

" tabとか
hi SpecialKey ctermfg=0 guifg=darkgray

" ...
hi PmenuSel ctermfg=248 ctermbg=0


if has('mac') || has('linux') || has('unix')
    "colorscheme darkblue
    "colorscheme yuroyoro256
    "colorscheme molokai

    let g:solarized_termcolors=16
    let g:solarized_termtrans=0
    let g:solarized_degrade=0
    let g:solarized_bold=1
    let g:solarized_underline=1
    let g:solarized_italic=1
    let g:solarized_contrast='normal'
    let g:solarized_visibility='normal'
    colorscheme solarized
    set background=dark
elseif has('win32') || has('cygwin') || has("win32unix")
    colorscheme molokai
endif


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
nnoremap <C-g> :nohlsearch<CR>

" shell起動
nnoremap <F3> :shell<CR>

" JunkFile
nnoremap <F8> :JunkFile<CR>

"" CTRL-hjklでウィンドウ移動
"nnoremap <C-j> :<C-w>j
"nnoremap <C-k> :<C-k>j
"nnoremap <C-l> :<C-l>j
"nnoremap <C-h> :<C-h>j

" 挿入モードで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" tab
"nmap <C-t> :tabnext<CR>
"nmap <F1> :tabnew<CR>

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


"""""""""""""""
""" gui setting
"""""""""""""""
if has('gui_macvim') || has('kaoriya') || has('gvim')
    "set background=dark
    set guioptions-=T
    set guioptions+=a
    "set guifont=Monaco:h10
    set showtabline=2
    set transparency=5
    set visualbell t_vb=

    if has('win32')
        set guifont=Ricty:h9
        set lines=50 columns=170
    elseif has('mac')
        set guifont=Ricty:h12
        set lines=55 columns=180
    endif

    "augroup hack234
    "  autocmd!
    "    autocmd FocusGained * set transparency=10
    "    autocmd FocusLost * set transparency=50
    "augroup END

    "colorscheme wombat
    "colorscheme lucius
    "colorscheme darkeclipse
endif


"""""""""""""""
""" sonota
"""""""""""""""
" なんかのプラグインで無効になってるぽいので
set showcmd

set runtimepath+=~/dotfile/.vim,~/dotfile/.vim/after

