# .myrootconf.sh

stty stop undef

export LANG=ja_JP.UTF-8

export PS1="[\u@\h \W]\\$ "

export PATH=~/bin:${PATH}
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH=${HOME}/dotfile/udf:${PATH}
export MANPATH=${MANPATH}:/usr/local/man
export PYTHONPATH=${PYTHONPATH}:/home/hoshino/my_lib:/Users/hoshino/my_lib
export PYTHONPATH=${PYTHONPATH}:/home/hoshino/ym0_lib:/Users/hoshino/ym0_lib

export LESS="-cgisSFMRX"
export PAGER="less -cgisSFMRX"
export GIT_PAGER="less -cgisSFMRX"
export MANPAGER="less -cgisSFMRX"

# 設定するとzshが勝手にエディタ風のキーバインドにしやがる
# .zshrcにbindkey -e
export EDITOR="vim"
export SVN_EDITOR="vim --noplugin"

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

#export LS_COLORS="no=00:fi=00:di=34:ln=01;36:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=32:*.exe=00:*.com=00:*.app=00:*.bin=00:*Makefile=01;32:*.txt=37:*.org=37:*.md=37:*.mkd=37:*.tex=37:*.pod=37:*.csv=37:*.json=37:*.doxygen=37:*.h=33:*.hpp=33:*.inc=33:*.patch=33:*.diff=33:*.asm=01;33:*.c=01;33:*.cc=01;33:*.cpp=01;33:*.cxx=01;33:*.objc=01;33:*.d=01;33:*.java=01;33:*.f=01;33:*.l=01;33:*.lex=01;33:*.ll=01;33:*.lxx=01;33:*.m=01;33:*.ml=01;33:*.mll=01;33:*.mly=01;33:*.scala=01;33:*.sql=01;33:*.v=01;33:*.vhd=01;33:*.vhdl=01;33:*.xpm=01;33:*.y=01;33:*.yy=01;33:*.yxx=01;33:*.yacc=01;33:*.sh=01;32:*.bash=01;32:*.csh=01;32:*.zsh=01;32:*.tcl=01;32:*.bat=01;32:*.cmd=01;32:*.vbs=01;32:*.wsh=01;32:*.erl=01;32:*.fsx=01;32:*.l=01;32:*.lisp=01;32:*.lazy=01;32:*.hs=01;32:*.lhs=01;32:*.p=01;32:*.pas=01;32:*.scm=01;32:*.el=01;32:*.vim=01;32:*.cgi=01;32:*.jsp=01;32:*.js=01;32:*.pl=01;32:*.pm=01;32:*.py=01;32:*.rb=01;32:*.php=01;32:*.asp=01;32:*.htm=01;35:*.html=01;35:*.shtml=01;35:*.xml=01;35:*.sgm=01;35:*.sgml=01;35:*.tld=01;35:*.xaml=01;35:*.yaml=01;35:*.yml=01;35:*.rdf=01;35:*.css=35:*.xsl=35:*.xslt=35:*.so=31:*.sl=31:*.lib=31:*.a=31:*.dll=31:*.o=01;31:*.obj=01;31:*.cmx=01;31:*.class=01;31:*.pyc=01;31:*.pyo=01;31:*.elc=01;31:*.cmo=01;31:*.config=01;37:*.conf=01;37:*.cfg=01;37:*.*shrc=01;37:*.ini=01;37:*.inf=01;37:*.reg=01;37:*.recipe=01;37:*.repo=01;37:*.mf=01;37:*.mk=01;37:*.allow=01;37:*.deny=01;37:*.htaccess=01;37:*.htpasswd=01;37:*.loc=01;37:*.pid=01;37:*.mo=01;37:*.cvs*=01;30:*.svn*=01;30:*.git*=01;30:*.hg*=01;30:*.man=37:*.map=37:*.ram=37:*.rom=37:*.db=37:*.pcap=37:*.0=00:*.1=00:*.2=00:*.3=00:*.4=00:*.5=00:*.6=00:*.7=00:*.8=00:*.9=00:*.n=00:*.rc=00:*.cmi=00:*.mli=00:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.ico=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.raw=33:*.ARW=33:*.CRW=33:*.CR2=33:*.DNG=33:*.KDC=33:*.ERF=33:*.MRW=33:*.NEF=33:*.ORF=33:*.PEF=33:*.RAF=33:*.RAW=33:*.SR2=33:*.X3F=33:*.exif=33:*.aac=01;35:*.au=01;35:*.flac=01;35:*.mid=01;35:*.midi=01;35:*.mka=01;35:*.mp3=01;35:*.mpa=01;35:*.mpeg=01;35:*.mpg=01;35:*.ogg=01;35:*.ra=01;35:*.rcp=01;35:*.wav=01;35:*.cue=01;35:*.anx=01;33:*.asf=01;33:*.avi=01;33:*.axv=01;33:*.flc=01;33:*.fli=01;33:*.flv=01;33:*.gl=01;33:*.m2v=01;33:*.m4v=01;33:*.mkv=01;33:*.mov=01;33:*.mp4=01;33:*.mp4v=01;33:*.mpeg=01;33:*.mpg=01;33:*.nuv=01;33:*.ogm=01;33:*.ogv=01;33:*.ogx=01;33:*.qt=01;33:*.rm=01;33:*.rmvb=01;33:*.swf=01;33:*.vob=01;33:*.wmv=01;33:*.ts=01;33:*.otf=35:*.ttc=35:*.ttf=35:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.xlt=31:*.xltx=31:*.ppt=31:*.pptx=31:*.pot=31:*.potx=31:*.vsd=31:*.vss=31:*.vst=31:*.vdx=31:*.vsx=31:*.vtx=31:*.fla=31:*.psd=31:*.xcf=31:*.xdw=31:*.7z=01;31:*.apk=01;31:*.arj=01;31:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.deb=01;31:*.dmg=01;31:*.gem=01;31:*.gz=01;31:*.iso=01;31:*.img=01;31:*.jar=01;31:*.lzh=01;31:*.msi=01;31:*.rar=01;31:*.rpm=01;31:*.tar=01;31:*.tbz=01;31:*.tbz2=01;31:*.tgz=01;31:*.tx=01;31:*.war=01;31:*.xpi=01;31:*.xz=01;31:*.z=01;31:*.Z=01;31:*.zip=01;31:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=37:*~=00:*#=00:*.bak=00:*.BAK=00:*.old=00:*.OLD=00:*.org_archive=00:*.off=00:*.OFF=00:*.dist=00:*.DIST=00:*.orig=00:*.ORIG=00:*.swp=00:*.swo=00:*,v=00:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.pub=34:*.crt=34:*.key=34:*.rsa=34:*.sig=34:"
export LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:'

#alias ls="ls -vF --color --time-style=long-iso"
#alias ll="ls -lavF --color --time-style=long-iso"
#alias ls="ls -vF --group-directories-first --color --time-style=long-iso"
#alias ll="ls -lavF --group-directories-first --color --time-style=long-iso"
alias l="ll"
alias less="less -cgisSFMRX"
alias rm="rm -i"
alias lv="lv -c"
alias tmux="tmux -2"
alias ftp="ncftp"
alias grep="grep --color=always -n"
alias egrep="egrep --color=always -n"
alias mysql="mysql --default-character-set=utf8 --pager='less -cgisSFMRX'"
alias vi="vim"
alias svndiff="svn diff -x -u -x --ignore-eol-style | vim -R -"
alias diff="colordiff -u"
alias weechat="TERM=screen-256color weechat"
alias cpanm-local="cpanm --local-lib=~/.perl5"
alias wget="wget --no-check-certificate"
alias sudo="sudo -H"
alias G=" | grep -i"
alias L=" | less"

alias home-mysql="mysql -h krallice.dip.jp -u hoshino -p08240824"
alias home-ftp-hoshino="ftp ftp://hoshino@krallice.dip.jp/"
alias home-ftp-web="ftp ftp://webuser@krallice.dip.jp/"


git-export() {
    if [ -d ${1} ]; then
        echo "export git managed files '`pwd`' to '${1}'"
        git checkout-index -a -f --prefix=${1}/
    fi
}

