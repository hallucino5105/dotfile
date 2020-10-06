# .profile_nix.sh

### export
# common
export PATH=/usr/local/bin:$HOME/.fzf/bin:$PATH
export DISPLAY=192.168.1.10:0.0
export LIBGL_ALWAYS_INDIRECT=1


### alias
# common
alias ls="ls -v --color"
alias l="ls -lav --color"
alias ll="ls -lav --color"
alias vi="nvim -p"
alias vim="nvim -p"


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

