autoload -U colors && colors
autoload -U compinit && compinit -u


### zsh設定
# 補完方法毎にグループ化する
#zstyle ':completion:*' format '%B%d%b'
#zstyle ':completion:*' group-name ''
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ""
# 補完侯補をメニューから選択する
zstyle ':completion:*:{processes}' menu yes select=2
# 補完方法の設定指定した順番に実行する
# _oldlist 前回の補完結果を再利用する
# _complete: 補完する
# _match: globを展開しないで候補の一覧から補完する
# _history: ヒストリのコマンドも補完候補とする
# _ignored: 補完候補にださないと指定したものも補完候補とする
# _approximate: 似ている補完候補も補完候補とする
# _prefix: カーソル以降を無視してカーソル位置までで補完する
zstyle ':completion:*' completer _complete _oldlist _match #_history _ignored _approximate _prefix
# 補完候補をキャッシュする
zstyle ':completion:*' use-cache yes
# 詳細な情報を使う
#zstyle ':completion:*' verbose yes

# --prefix=~/localというように「=」の後でもファイル名展開を行う
setopt magic_equal_subst
# cdでpushdする
setopt auto_pushd
# pushdで同じディレクトリを重複してpushしない
setopt pushd_ignore_dups
# no nomatch
setopt nonomatch
# 候補をつめて表示
setopt list_packed
# 拡張glob
setopt extended_glob

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt no_flow_control
setopt hist_reduce_blanks
setopt hist_verify
#setopt share_history

## インクリメンタルからの検索
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward

# 改行なしの行を表示させる
unsetopt promptcr

# 全てのユーザのログイン・ログアウトを監視する
#watch="all"
#log

# 「/」も単語区切りとみなす
WORDCHARS=${WORDCHARS:s,/,,}


### zshプロンプト
#PROMPT="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
#PROMPT="[${USER}@${HOST%%.*} %1~](%(?.%F{green}^-^%f.%F{red}@_@%f))%(!.#.$) "
#PROMPT="[${USER}@${HOST%%.*} %1~](%D{%m/%d %H:%M})(%(?.^-^.@_@))%(!.#.$) "
PROMPT="[${USER}@${HOST%%.*} %1~](%D{%H:%M})(%(?.^-^.@_@))%(!.#.$) "

autoload -Uz is-at-least
if is-at-least 4.3.10; then
    autoload -Uz vcs_info

    # 下のformatsの値をそれぞれの変数に入れてくれる機能の、変数の数の最大値
    # デフォルトだと2くらいなので、指定しておかないと、下のformatsがほぼ動かない
    zstyle ':vcs_info:*' max-exports 5
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr '+'
    zstyle ':vcs_info:git:*' unstagedstr '-'
    zstyle ':vcs_info:(git|svn):*' formats '%R' '%S' '%b' '%c%u'
    zstyle ':vcs_info:(git|svn):*' actionformats '%R' '%S' '%b|%a' '%c%u'
    zstyle ':vcs_info:*' formats '%S' '%R' '%b'
    zstyle ':vcs_info:*' actionformats '%S' '%R' '%b|%a'

    precmd_vcs_info () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        repos=$(print -nD $vcs_info_msg_0_)

        # psvar[1]とpsvar[2]がなぜかvcs以外のディレクトリに行っても消えないので
        # この順番を変更しないように
        [[ -n "$repos" ]] && psvar[3]="$repos"
        [[ -n "$vcs_info_msg_1_" ]] && psvar[4]="$vcs_info_msg_1_"
        [[ -n "$vcs_info_msg_2_" ]] && psvar[1]="$vcs_info_msg_2_"
        [[ -n "$vcs_info_msg_3_" ]] && psvar[2]="$vcs_info_msg_3_"
    }

    typeset -ga precmd_functions
    precmd_functions+=precmd_vcs_info

    # %3(v|{a}|{b}): psvarの配列長が3以上なら{a}、それ以外なら{b}を実行
    setopt prompt_subst
    local stage='%3(v|[%F{green}%2v%f]|)'
    local vcs='%3(v|[%25<\<<%F{yellow}%3v%f@%F{blue}%1v%f%<<]|)'
    RPROMPT="$stage$vcs"
fi


### 環境変数
case "$TERM" in
    xterm*)
        COLORTERM=1
        ;;
    screen*)
        COLORTERM=1
        SCREEN=1
        #TERM="xterm-256color"
        ;;
    #mlterm*)
    #    COLORTERM=1 
    #    #TERM="kterm-color"
    #    ;;
    #ct100*)
    #    COLORTERM=1
    #    ;;
    #kterm*)
    #    COLORTERM=1
    #    #TERM="kterm-color"
    #    export LANG=ja_JP.eucJP
    #    export LC_ALL=ja_JP.eucJP
    #    ;;
    #linux)
    #    LC_ALL=C
    #    ;;
esac


### コマンド
# ctrl+hでbackspaceを入力可能する
#if [ $TERM = "screen" ] || [ $SCREEN = 1 ]; then
#    stty erase ""
#fi

# コマンドラインスタックを表示
show_buffer_stack() {
    POSTDISPLAY="
    stack: $LBUFFER"
    zle push-line
}

zle -N show_buffer_stack
bindkey "^q" show_buffer_stack


### エイリアス
# macにbunutils入れたので入らない
#case ${OSTYPE} in
#    linux*)
        alias ls="ls -F --color --time-style=long-iso"
        alias ll="ls -la --color --time-style=long-iso"

        # 最新のファイルからn件をls
        function lf() {
            if [ $# = 1 ]; then
                DIR=$1
                COUNT=1
            elif [ $# = 2 ]; then
                DIR=$1
                COUNT=$2
            fi

            sudo find $DIR -type f -print0 | xargs -0 ls -l --color --time-style=long-iso | sort -k 6,7 | tail -n $COUNT
        }
#        ;;
#    darwin*)
#        alias ls="ls -vFG"
#        alias ll="ls -lavFG"
#        alias l="ls -lavFG"
#        ;;
#esac

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'


### キーバインド グローバル
# emacs風キーバインド
bindkey -e

## vim風キーバインド
#bindkey -v
#bindkey "^P" up-line-or-history
#bindkey "^N" down-line-or-history


### その他
# moshの補完をsshと同じに
compdef mosh=ssh

