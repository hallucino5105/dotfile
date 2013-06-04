""" general setting
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
"set smartindent
"set cindent
set smartcase
set smarttab
"set hlsearch
set laststatus=2
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}¥)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%l,%c\ (%p%%)]
set clipboard+=autoselect
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set magic
set backup
set backupdir=~/dotfile/.vim/backup
set backspace=indent,eol,start
set backupskip=/tmp/*,/private/tmp/*
set clipboard+=autoselect
set hlsearch
set showtabline=1
set wildmenu
set showcmd
set showmode
set cmdheight=1
set hidden
set list
set listchars=tab:»\ ,extends:»,precedes:«,nbsp:%
set maxmempattern=10000
set autoread
set nofoldenable


" 自動再読み込み
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

" trailing spaces highlight
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
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
let g:vimproc_dll_path = $HOME.'/dotfile/.vim/bundle/vimproc/autoload/vimproc.so'


""" Vundle
set nocompatible
filetype off

set runtimepath+=~/dotfile/.vim/vundle/
call vundle#rc('~/dotfile/.vim/bundle')

" color
Bundle 'Lucius'
Bundle 'Zenburn'
"Bundle 'darkblue'
"Bundle 'darkblue2'
"Bundle 'wombat256.vim'
Bundle 'yuroyoro/yuroyoro256.vim.git'
Bundle 'molokai'
"Bundle 'Solarized'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'

" syntax
Bundle 'jQuery'
"Bundle 'css3'
Bundle 'JSON.vim'
Bundle 'html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'

" other
Bundle 'eregex.vim'
"Bundle 'YankRing.vim'
Bundle 'yanktmp.vim'
Bundle 'surround.vim'
Bundle 'quickrun.vim'
Bundle 'sjl/gundo.vim.git'
"Bundle 'renamer.vim'
Bundle 'scratch.vim'
"Bundle 'Python-Syntax'
Bundle 'sudo.vim'
Bundle 'neocomplcache'
Bundle 'Shougo/vimshell.git'
Bundle 'Shougo/vimproc.git'
"Bundle 'vcscommand.vim'
Bundle 'taglist.vim'
Bundle 'Align'
"Bundle 'dbext.vim'
"Bundle 'SQLUtilities'
"Bundle 'Indent-Guides'
"Bundle 'Smooth-Scroll'
"Bundle 'mattn/hahhah-vim'
"Bundle 'glidenote/memolist.vim'
"Bundle 'vimgrep.vim' "終了時にエラーが出る
Bundle 'fuenor/qfixgrep.git'
"Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-markdown'
Bundle 'unite.vim'
"Bundle 'unite-colorscheme'
Bundle 'Shougo/unite-session.git'
Bundle 'kannokanno/unite-dwm.git'
Bundle 'fugitive.vim'
Bundle 'gitv'
"Bundle 'pyflakes'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'renamer.vim'
"Bundle 'wincent/Command-T'
"Bundle 'Shougo/vimfiler'
Bundle 'thinca/vim-qfreplace'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'VimRepress'
Bundle 'spolu/dwm.vim'
Bundle 'open-browser.vim'


if !has('gui_macvim')
    Bundle 'VimRepress'
    "Bundle 'minibufexpl.vim'
    "Bundle 'bufferlist.vim'
endif

filetype plugin indent on


""" YankRing
let g:yankring_max_history=50
let g:yankring_history_dir='~/dotfile/.vim/bundle/YankRing.vim'
let g:yankring_manual_clipboard_check=1


""" yanktmp
let g:yanktmp_file=$HOME.'/dotfile/.vim/bundle/yanktmp.vim/.vimyanktmp'


""" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_max_list=100
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_min_syntax_length=3
let g:neocomplcache_auto_completion_start_length=3

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
let g:quickrun_config = {}
let g:quickrun_config['mkd'] = {
    \ 'outputter': 'browser',
    \ 'command': 'markdown2',
    \ 'cmdopt': '-x fenced-code-blocks',
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
noremap <F4> :Tlist<CR>


""" BufferList
"map <silent> <C-x> :call BufferList()<CR>
"let g:BufferListWidth=25
"let g:BufferListMaxWidth=40


""" MemoList
"let g:memolist_path = "path/to/dir"
"let g:memolist_memo_suffix = "txt"
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
let g:unite_source_file_mru_limit = 1000
let g:unite_update_time = 1000
nnoremap [unite] <Nop>
nmap r [unite]
" 分割しないでuniteのbufferを表示する
nnoremap [unite]u :<C-u>Unite -no-split<Space>
" 全部乗せ
nnoremap <silent> [unite]a :<C-u>UniteWithCurrentDir buffer file_mru bookmark file -buffer-name=files -direction=belowright<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>Unite file file/new -buffer-name=files -direction=belowright<CR>
" バッファ一覧
nnoremap <silent> [unite]t :<C-u>Unite buffer -direction=belowright<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru -direction=belowright<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru -direction=belowright<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> [unite]d :<C-u>UniteWithBufferDir -buffer-name=files file file/new -direction=belowright<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark -direction=belowright<CR>
" ヤンク履歴
nnoremap <silent> [unite]y :<C-u>Unite history/yank -direction=belowright<CR>
" 変更履歴
nnoremap <silent> [unite]s :<C-u>Unite change -direction=belowright<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep -direction=belowright<CR>
" セッション
nnoremap <silent> [unite]s :<C-u>Unite session -direction=belowright<CR>
" dwm
nnoremap <silent> [unite]w :<C-u>Unite dwm -direction=belowright<CR>


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


"""" markdown
"autocmd BufRead,BufNewFile *.mkd  setfiletype=mkd
"autocmd BufRead,BufNewFile *.md  setfiletype=mkd


""" actionscript,mxml
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml


""" python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
" VimでPythonのコメント行を入力しようとするとインデントが解除されてしまうアレ
autocmd FileType python :inoremap # X#


""" handlebars template
autocmd BufNewFile,BufRead *.hbs set filetype=xhtml


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
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" マッピング
let g:EasyMotion_leader_key="<Space>"
" 1ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


""" dwm
nnoremap <c-j> <c-w>w
nnoremap <c-k> <c-w>W
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


""" color setting
syntax on


if has('mac')
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
    set background=dark
    colorscheme solarized
elseif has('win32') || has('cygwin') || has("win32unix")
    colorscheme molokai
endif



" ターミナルタイプによるカラー設定
"if &term =~ "xterm-256color" || "screen-256color"
"  " 256色
"  set t_Co=256
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
"  set t_Co=16
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"elseif &term =~ "xterm-color"
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
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
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

"
hi PmenuSel ctermfg=248 ctermbg=0


""" general key map
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

"" CTRL-hjklでウィンドウ移動
"nnoremap <C-j> :<C-w>j
"nnoremap <C-k> :<C-k>j
"nnoremap <C-l> :<C-l>j
"nnoremap <C-h> :<C-h>j

"" 挿入モードで移動
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>


" tab
"nmap <C-t> :tabnext<CR>
"nmap <F1> :tabnew<CR>


""" ノーマル/インサートモードでカーソルの形状を変更する
if &term =~ "screen" || &term=~"screen-256color"
    "let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
    "let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
elseif &term =~ "xterm" || &term=~"xterm-256color"
    let &t_SI = "\e]50;CursorShape=1\x7"
    let &t_EI = "\e]50;CursorShape=0\x7"
endif


""" gui用設定
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
        set lines=50 columns=165
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





""" nouse
""" 文字コード自動認識
"if !has('kaoriya')
"    if &encoding !=# 'utf-8'
"        set encoding=japan
"        set fileencoding=japan
"    endif
"    if has('iconv')
"        let s:enc_euc='euc-jp'
"        let s:enc_jis='iso-2022-jp'
"        " iconvがeucJP-msに対応しているかをチェック
"        if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"            let s:enc_euc='eucjp-ms'
"            let s:enc_jis='iso-2022-jp-3'
"        " iconvがJISX0213に対応しているかをチェック
"        elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"            let s:enc_euc='euc-jisx0213'
"            let s:enc_jis='iso-2022-jp-3'
"        endif
"        " fileencodingsを構築
"        if &encoding ==# 'utf-8'
"            let s:fileencodings_default=&fileencodings
"            let &fileencodings=s:enc_jis .','. s:enc_euc .',cp932'
"            let &fileencodings=&fileencodings .','. s:fileencodings_default
"            unlet s:fileencodings_default
"        else
"            let &fileencodings=&fileencodings .','. s:enc_jis
"            set fileencodings+=utf-8,ucs-2le,ucs-2
"            if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"                set fileencodings+=cp932
"                set fileencodings-=euc-jp
"                set fileencodings-=euc-jisx0213
"                set fileencodings-=eucjp-ms
"                let &encoding=s:enc_euc
"                let &fileencoding=s:enc_euc
"            else
"                let &fileencodings=&fileencodings .','. s:enc_euc
"            endif
"        endif
"        " 定数を処分
"        unlet s:enc_euc
"        unlet s:enc_jis
"    endif
"    " 日本語を含まない場合は fileencoding に encoding を使うようにする
"    if has('autocmd')
"        function! AU_ReCheck_FENC()
"            if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
"                let &fileencoding=&encoding
"            endif
"        endfunction
"        autocmd BufReadPost * call AU_ReCheck_FENC()
"    endif
"    " 改行コードの自動認識
"    set fileformats=unix,dos,mac
"    " □とか○の文字があってもカーソル位置がずれないようにする
"    if exists('&ambiwidth')
"        set ambiwidth=double
"    endif
"endif


""" JunkFile
"" Open junk file."{{{
"command! -nargs=0 JunkFile call s:open_junk_file()
"function! s:open_junk_file()
"    let l:junk_dir = $HOME . '/.vimjunk'. strftime('/%Y/%m')
"    if !isdirectory(l:junk_dir)
"        call mkdir(l:junk_dir, 'p')
"    endif
"
"    let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
"    if l:filename != ''
"        execute 'edit ' . l:filename
"    endif
"endfunction"}}}


" なんかのプラグインで無効になってるぽいので
set showcmd
