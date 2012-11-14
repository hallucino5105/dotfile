autoload -U colors && colors
autoload -U compinit && compinit


# $BJd40J}K!Kh$K%0%k!<%W2=$9$k(B
#zstyle ':completion:*' format '%B%d%b'
#zstyle ':completion:*' group-name ''
# $BJd408uJd$K?'$rIU$1$k(B
zstyle ':completion:*:default' list-colors ""
# $BJd408tJd$r%a%K%e!<$+$iA*Br$9$k(B
zstyle ':completion:*:{processes}' menu yes select=2
# $BJd40J}K!$N@_Dj;XDj$7$?=gHV$K<B9T$9$k(B
# _oldlist $BA02s$NJd407k2L$r:FMxMQ$9$k(B
# _complete: $BJd40$9$k(B
# _match: glob$B$rE83+$7$J$$$G8uJd$N0lMw$+$iJd40$9$k(B
# _history: $B%R%9%H%j$N%3%^%s%I$bJd408uJd$H$9$k(B
# _ignored: $BJd408uJd$K$@$5$J$$$H;XDj$7$?$b$N$bJd408uJd$H$9$k(B
# _approximate: $B;w$F$$$kJd408uJd$bJd408uJd$H$9$k(B
# _prefix: $B%+!<%=%k0J9_$rL5;k$7$F%+!<%=%k0LCV$^$G$GJd40$9$k(B
zstyle ':completion:*' completer _complete _oldlist _match #_history _ignored _approximate _prefix
# $BJd408uJd$r%-%c%C%7%e$9$k(B
zstyle ':completion:*' use-cache yes
# $B>\:Y$J>pJs$r;H$&(B
#zstyle ':completion:*' verbose yes

# --prefix=~/local$B$H$$$&$h$&$K!V(B=$B!W$N8e$G$b%U%!%$%kL>E83+$r9T$&(B
setopt magic_equal_subst
# cd$B$G(Bpushd$B$9$k(B
setopt auto_pushd
# pushd$B$GF1$8%G%#%l%/%H%j$r=EJ#$7$F(Bpush$B$7$J$$(B
setopt pushd_ignore_dups
# no nomatch
setopt nonomatch
# $B8uJd$r$D$a$FI=<((B
setopt list_packed
# $B3HD%(Bglob
setopt extended_glob

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt no_flow_control

# $B2~9T$J$7$N9T$rI=<($5$;$k(B
unsetopt promptcr

# $BA4$F$N%f!<%6$N%m%0%$%s!&%m%0%"%&%H$r4F;k$9$k(B
#watch="all"
#log

# $B!V(B/$B!W$bC18l6h@Z$j$H$_$J$9(B
WORDCHARS=${WORDCHARS:s,/,,}

# prompt
PROMPT="[${USER}@${HOST%%.*} %1~]%(!.#.$) "
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<10->)* ]]; then
    autoload -Uz vcs_info

    zstyle ":vcs_info:git:*" check-for-changes true
    zstyle ":vcs_info:git:*" stagedstr '+'
    zstyle ":vcs_info:git:*" unstagedstr '*'
    zstyle ':vcs_info:(git|svn):*' formats '%R' '%S' '%b' '%c%u'
    zstyle ':vcs_info:(git|svn):*' actionformats '%R' '%S' '%b|%a' '%c%u'
    zstyle ':vcs_info:*' formats '%R' '%S' '%s:%b'
    zstyle ':vcs_info:*' actionformats '%R' '%S' '%s:%b|%a'

    precmd_vcs_info () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        repos=`print -nD "$vcs_info_msg_0_"`

        # psvar[1]$B$H(Bpsvar[2]$B$,$J$<$+(Bvcs$B0J30$N%G%#%l%/%H%j$K9T$C$F$b>C$($J$$$N$G(B
        # $B$3$N=gHV$rJQ99$7$J$$$h$&$K(B
        [[ -n "$repos" ]] && psvar[3]="$repos"
        [[ -n "$vcs_info_msg_1_" ]] && psvar[4]="$vcs_info_msg_1_"
        [[ -n "$vcs_info_msg_2_" ]] && psvar[1]="$vcs_info_msg_2_"
        [[ -n "$vcs_info_msg_3_" ]] && psvar[2]="$vcs_info_msg_3_"
    }
    
    typeset -ga precmd_functions
    precmd_functions+=precmd_vcs_info

    # %3(v|{a}|{b}): psvar$B$NG[NsD9$,(B3$B0J>e$J$i(B{a}$B!"$=$l0J30$J$i(B{b}$B$r<B9T(B
    local stage='%3(v|[%F{green}%2v%f]|)'
    local vcs='%3(v|[%25<\<<%F{yellow}%3v%f@%F{blue}%1v%f%<<]|)'
    #PROMPT="[${USER}@${HOST%%.*} %1~](%(?.%F{green}^-^%f.%F{red}@_@%f))%(!.#.$) "
    PROMPT="[${USER}@${HOST%%.*} %1~](%(?.^-^.@_@))%(!.#.$) "
    RPROMPT="$stage$vcs"
fi

#
compdef mosh=ssh

# alias
case ${OSTYPE} in
    linux*)
        alias ls="ls --color"
        alias ll="ls -la --color"
        ;;
    darwin*)
        alias ls="ls -G"
        alias ls="ls -laG"
        ;;
esac

