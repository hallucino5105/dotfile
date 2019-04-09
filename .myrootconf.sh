# .myrootconf.sh

stty stop undef


export LANG=ja_JP.UTF-8
export PS1="[\u@\h \W]\\$ "
export PATH=~/bin:${PATH}
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${HOME}/dotfile/udf:${PATH}
export LESS="-cgisSFMRX"
export PAGER="less -cgisSFMRX"
export GIT_PAGER="less -cgisSFMRX"
export MANPAGER="less -cgisSFMRX"
export EDITOR="vim -p"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:'
export LOGZERO_FORCE_COLOR="1"


alias l="ll"
alias ll="ls -la --color"
alias ls="ls --color"
alias less="less -cgisSFMRX"
alias rm="rm -i"
alias lv="lv -c"
alias tmux="tmux -2"
alias ftp="ncftp"
alias grep="grep --color=always -nI"
alias egrep="egrep --color=always -nI"
alias mysql="mysql --default-character-set=utf8 --pager='less -cgisSFMRX'"
alias vi="vim -p"
alias vim="vim -p"
alias diff="colordiff -u"
alias weechat="TERM=screen-256color weechat"
alias wget="wget --no-check-certificate"
alias sudo="sudo -H"
alias jq="jq -C"


git_export() {
    if [ -d ${1} ]; then
        echo "export git managed files '`pwd`' to '${1}'"
        git checkout-index -a -f --prefix=${1}/
    fi
}

getpid() {
    ps=`echo $1 | sed -e "s/^\(.\)/[\1]/g"`
    pids=`ps aux | sed -e 's/  */ /g' | grep -i $ps | cut -d' ' -f2`
    for pid in $pids; do
        echo $pid
    done
}


ress() {
    FILENAME=$1
    if [ $# -lt 1 ]; then
        echo "Usage: $0 FILENAME"
    else
        github-markup $FILENAME | w3m -T text/html
    fi
}

gofiles() {
    PWD=`pwd`
    echo ".DS_Store\n*.swp\n~*\n\ngo/bin/*\n!go/bin/.gitkeep\ngo/pkg/*\n!go/pkg/.gitkeep\nvendor" > $PWD/.gitignore
    echo "export GOPATH=\$(pwd)/go\nexport GO15VENDOREXPERIMENT=1" > $PWD/.envrc
	mkdir -p $PWD/go/{bin,pkg,src}
    touch $PWD/go/{bin,pkg,src}/.gitkeep
}

lstree() {
    pwd; find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'
}

#git_find_big() {
#    #set -x
#
#    # Shows you the largest objects in your repo's pack file.
#    # Written for osx.
#    #
#    # @see http://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
#    # @author Antony Stubbs
#
#    # set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
#    IFS=$'\n';
#
#    # list all objects including their size, sort by size, take top 10
#    objects=`git verify-pack -v .git/objects/pack/pack-*.idx | \grep -v chain | sort -k3nr | head`
#
#    echo "All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file."
#
#    output="size,pack,SHA,location"
#    for y in $objects
#    do
#        # extract the size in bytes
#        size=$((`echo $y | cut -f 5 -d ' '`/1024))
#        # extract the compressed size in bytes
#        compressedSize=$((`echo $y | cut -f 6 -d ' '`/1024))
#        # extract the SHA
#        sha=`echo $y | cut -f 1 -d ' '`
#        # find the objects location in the repository tree
#        other=`git rev-list --all --objects | grep $sha`
#        #lineBreak=`echo -e "\n"`
#        output="${output}\n${size},${compressedSize},${other}"
#    done
#
#    echo -e $output | column -t -s ', '
#}

