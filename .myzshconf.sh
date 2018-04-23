autoload -U colors && colors
autoload -U compinit && compinit -C
autoload history-search-end

### zsh設定
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
zstyle ':completion:*' completer _complete _oldlist _match _history #_ignored _approximate _prefix
# 補完候補をキャッシュする
zstyle ':completion:*' use-cache yes
# 詳細な情報を使う
#zstyle ':completion:*' verbose yes

# moshの補完をsshと同じに
compdef mosh=ssh

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
setopt bang_hist

# マッチしたコマンドのヒストリを表示できるようにする
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 改行なしの行を表示させる
unsetopt promptcr

# 「/」も単語区切りとみなす
WORDCHARS=${WORDCHARS:s,/,,}


### zshプロンプト
PROMPT="[${USER}@${HOST%%.*} %1~](%(?.^-^.@_@))%(!.#.$) "


### 環境変数
case "$TERM" in
    xterm*)
        COLORTERM=1
        ;;
    screen*)
        COLORTERM=1
        SCREEN=1
        ;;
esac


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
case ${OSTYPE} in
    linux*)
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
        ;;
    darwin*)
        alias ls="ls -vFG"
        alias ll="ls -lavFG"
        alias l="ls -lavFG"
        ;;
esac

# -g 先頭以外で展開されるalias
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


# 設定ファイルのインポート
if [ -f $HOME/dotfile/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $HOME/dotfile/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f $HOME/.fzf.zsh ]; then
    source $HOME/.fzf.zsh
fi


### その他
function vig {
    vi -p `grep -irn "$1" . | fzf | awk -F ":" '{print "-c "$2" "$1}'`
}

function vif {
    find . -iname "$1" | fzf | xargs -o vim -p
}

function display_notification () {
    case ${OSTYPE} in
        darwin*)
            osascript -e 'on run argv
                display notification current date as text with title item 1 of argv
            end run' -- "$*"
            ;;
        *)
            echo "no support os"
            ;;
    esac
}

function with_display_notification () {
    case ${OSTYPE} in
        darwin*)
            "$@"
            display_notification "($?)" "$@"
            ;;
        *)
            echo "no support os"
            ;;
    esac
}

