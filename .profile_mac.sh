# .profile_mac_sh

### export
# common
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib

# brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# java
export JAVA_HOME=`/usr/libexec/java_home -v "11"`
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"
export PATH=$JAVA_HOMEg/bin:$PATH

# android
export ANDROID_SDK_ROOT=/Volumes/subvol2/android-sdk
export ANDROID_SDK_HOME=$ANDROID_SDK_ROOTg
export ANDROID_HOME=$ANDROID_SDK_ROOTg
export PATH=$ANDROID_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

# fzf
export FZF_DEFAULT_OPTS="--extended --cycle --reverse --ansi --select-1 --exit-0 --multi"

# misc
export EDITOR="nvim -p"
export PAGER="less -csSXMi"


### alias
# common
alias ls="ls -vG"
alias l="ls -lavG"
alias ll="ls -lavG"
alias vi="nvim -p"
alias vim="nvim -p"
alias mvim="mvim --remote-tab-silent"
alias gvim="mvim --remote-tab-silent"
alias mysql="mysql --pager='less -csiSFXM'"

# android
alias installapp='find . -name *.apk | peco | xargs adb install -r'
alias uninstallapp='adb-peco shell pm list package | sed -e s/package:// | peco | xargs adb-peco uninstall'


### env
# python
if [ -e $HOME/.pyenv ]; then
    export PATH=$HOME/.pyenv/bin:$PATH
    eval "$(pyenv init -)"
fi

# node
if [ -e $HOME/.nodenv ]; then
    export PATH="$HOME/.nodenv/bin:$PATH"
    eval "$(nodenv init -)"
    export PATH="$HOME/.nodenv/versions/*/bin:$PATH"
fi

# go
if [ -e $HOME/.goenv ]; then
    export PATH="$HOME/.goenv/bin:$PATH"
    export GOENV_DISABLE_GOPATH=1
    eval "$(goenv init -)"
    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
fi
