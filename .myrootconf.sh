export LANG=ja_JP.UTF-8

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export AWS_HOME=/opt/local/aws

export EC2_HOME=${AWS_HOME}/ec2-api-tools
export EC2_AMITOOL_HOME=${AWS_HOME}/ec2-ami-tools
export AWS_ELB_HOME=${AWS_HOME}/elb-api-tools
export AWS_RDS_HOME=${AWS_HOME}/rds-api-tools
export AWS_R53_HOME=${AWS_HOME}/r53-api-tools

export EC2_PRIVATE_KEY=~/.key/testkey.pem
export EC2_CERT=~/.key/cert.pem

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

export ANDROID_SDK_HOME=/opt/local/share/java/android-sdk-macosx/tools
export ANDROID_SDK_HOME2=/opt/local/share/java/android-sdk-macosx/platform-tools
export ANDROID_NDK_HOME=/opt/local/share/java/android-ndk-macosx
export NDKROOT=${ANDROID_NDK_HOME}

export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=/opt/local/bin:/opt/local/sbin:${PATH}
export PATH=~/bin:${PATH}
export PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}
export PATH=${EC2_HOME}/bin:${EC2_AMITOOL_HOME}/bin:${AWS_ELB_HOME}/bin:${AWS_RDS_HOME}/bin:${AWS_R53_HOME}/bin:${PATH}
export PATH=${ANDROID_SDK_HOME}:${ANDROID_SDK_HOME2}:${ANDROID_NDK_HOME}:${PATH}
export MANPATH=/usr/local/man:/opt/local/share/man:/opt/local/man:${MANPATH}

export WORKON_HOME=~/local

export SVN_EDITOR="vim --noplugin"
export PAGER="less -sSR"
export GIT_PAGER="less -sSR"
export MANPAGER="less -sSR"
export DIFF="colordiff"

# $B@_Dj$9$k$H(Bzsh$B$,>!<j$K%(%G%#%?Iw$N%-!<%P%$%s%I$K$7$d$,$k(B
# .zshrc$B$K(Bbindkey -e
export EDITOR="vi"

#export PERL_CPANM_OPT="--local-lib=~/.perl5"
export PERL5LIB="${HOME}/.perl5/lib/perl5:${PERL5LIB}"

if [ -e /usr/share/terminfo/73/screen-256color ]; then
    export TERM=screen-256color
elif [ -e /usr/share/terminfo/s/screen-256color ]; then
    export TERM=screen-256color
elif [ -e /usr/share/terminfo/78/xterm-256color ]; then
    export TERM=xterm-256color
elif [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM=xterm-256color
else 
    export TERM=xterm
fi


#alias ls="ls -G"
#alias ll="ls -laG"
alias l="less -cSR"
alias rm="rm -i"
alias lv="lv -c"
alias tmux="tmux -2"
alias ftp="ncftp"
alias less="less -sSR"
alias grep="grep --color=always"
alias mysql="mysql --pager='less -sSR'"
alias g++="g++ -arch x86_64"
alias vi="vim"
alias svndiff="svn diff -x -u -x --ignore-eol-style | vim -R -"
alias diff="colordiff"
alias javac="javac -J-Dfile.encoding=UTF-8"
alias javah="javah -J-Dfile.encoding=UTF-8"
alias java="java -Dfile.encoding=UTF-8"
alias weechat="TERM=screen-256color weechat-curses"
alias cpanm-local="cpanm --local-lib=~/.perl5"
alias wget="wget --no-check-certificate"

alias home-mysql="mysql -h krallice.dip.jp -u hoshino -p08240824"
alias home-ftp-hoshino="ftp ftp://hoshino@krallice.dip.jp/"
alias home-ftp-web="ftp ftp://webuser@krallice.dip.jp/"

