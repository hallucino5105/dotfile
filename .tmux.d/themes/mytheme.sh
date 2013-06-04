if patched_font_in_use; then
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="⮂"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="⮃"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="⮀"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="⮁"
else
    TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
    TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
    TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
    TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-'16'}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-'247'}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}


# Format: segment_name background_color foreground_color [non_default_separator]

window_width=$(${TMUX_POWERLINE_DIR_USER_SEGMENTS}/../window-width.sh)
# window_title=$(tmux display -p '#W')
vim_cwd=$(tmux showenv $(tmux display -p 'TMUX_VIM_CWD_#D' | tr -d '%') 2> /dev/null)
vim_cwd=${vim_cwd#*=}

if [ -n "$vim_cwd" ]; then
    if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
            "tmux_session_info 148 234" \
            "hostname 63 255" \
            "vcs_branch 29 88" \
            "vcs_compare 60 255" \
            "vcs_staged 64 255" \
            "vcs_modified 9 255" \
            "vcs_others 245 0" \
            )
    fi

    if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
        TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
            "pwd 89 211" \
            #"vim-cwd 21 231" \
            "used-mem 58 107" \
            "date-full-en 235 136" \
            )
    fi
else
    ## ver1
    #if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=()
    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("tmux_session_info 148 234")
    #    #if [ "$window_width" -ge 170 ]; then
    #        TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("hostname 128 255")
    #    #fi
    #    #if [ "$window_width" -ge 200 ]; then
    #    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("whoami 69 238")
    #    #fi
    #    #if [ "$window_width" -ge 140 ]; then
    #        TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("ostype 237 252")
    #    #fi
    #    #TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}")
    #    #TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("wan_ip 24 255")
    #    #if [ "$window_width" -ge 190 ]; then
    #    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("vcs_branch 29 88")
    #    #fi
    #    #if [ "$window_width" -ge 250 ]; then
    #    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("vcs_compare 60 255")
    #    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("vcs_staged 64 255")
    #    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("vcs_modified 9 255")
    #    #    TMUX_POWERLINE_LEFT_STATUS_SEGMENTS+=("vcs_others 245 0")
    #    #fi
    #fi

    #if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
    #    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=()
    #    ##if [ "$window_width" -ge 180 ]; then
    #    ##    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("earthquake 3 0")
    #    ##    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("mailcount 9 255")
    #    ##fi
    #    ##if [ "$window_width" -ge 220 ]; then
    #    ##    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("now_playing 234 37")
    #    ##fi
    #    ##if [ "$window_width" -ge 122 ]; then
    #    ##    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("lang 95 248")
    #    ##fi
    #    #if [ "$window_width" -ge 150 ]; then
    #        TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("uptime 24 255")
    #    #fi
    #    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("load 64 255")
    #    #if [ "$window_width" -ge 168 ]; then
    #        TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("used-mem-full 89 211")
    #    #else
    #    #    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("used-mem 58 107 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}")
    #    #fi
    #    #if [ "$window_width" -ge 180 ]; then
    #    #    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("battery 137 127")
    #    #fi
    #    ##if [ "$window_width" -ge 160 ]; then
    #    #    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("weather 37 255")
    #    ##fi
    #    TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS+=("date-full-en 235 136")
    #fi

    # ver2
    if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
        TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
            "tmux_session_info 16 250 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
            "hostname 16 184 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
            "ostype 16 112 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
            )
    fi

    if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
        TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
            "uptime 16 74 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
            "load 16 70 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
            "used-mem-full 16 208 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
            "date-full-en 16 162 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
            )
    fi
fi
