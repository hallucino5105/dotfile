export LANG=ja_JP.UTF-8

export PATH=~/bin:${PATH}
export PATH=/opt/local/bin:/opt/local/sbin:${PATH}
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export MANPATH=${MANPATH}:/usr/local/man:/opt/local/share/man:/opt/local/man

export LESS="-sgSRXF -x4"
export SVN_EDITOR="vim --noplugin"
export PAGER="less"
export GIT_PAGER="less"
export MANPAGER="less"
export DIFF="colordiff"

# 設定するとzshが勝手にエディタ風のキーバインドにしやがる
# .zshrcにbindkey -e
export EDITOR="vi"


## term color
#if [ -e /usr/share/terminfo/73/screen-256color ]; then
#    export TERM=screen-256color
#elif [ -e /usr/share/terminfo/s/screen-256color ]; then
#    export TERM=screen-256color
#elif [ -e /usr/share/terminfo/78/xterm-256color ]; then
#    export TERM=xterm-256color
#elif [ -e /usr/share/terminfo/x/xterm-256color ]; then
#    export TERM=xterm-256color
#else 
#    export TERM=xterm
#fi


alias ls="ls -vF --color --time-style=long-iso"
alias ll="ls -lavF --color --time-style=long-iso"
alias less="less -cSR"
alias rm="rm -i"
alias lv="lv -c"
alias tmux="tmux -2"
alias ftp="ncftp"
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias mysql="mysql --pager='less -sSRXFN'"
alias vi="vim"
alias svndiff="svn diff -x -u -x --ignore-eol-style | vim -R -"
alias diff="colordiff -u"
alias javac="javac -J-Dfile.encoding=UTF-8"
alias javah="javah -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
alias weechat="TERM=screen-256color weechat-curses"
alias cpanm-local="cpanm --local-lib=~/.perl5"
alias wget="wget --no-check-certificate"
alias sudo="sudo -E"

alias home-mysql="mysql -h krallice.dip.jp -u hoshino -p08240824"
alias home-ftp-hoshino="ftp ftp://hoshino@krallice.dip.jp/"
alias home-ftp-web="ftp ftp://webuser@krallice.dip.jp/"

