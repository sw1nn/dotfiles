#!/bin/sh

youtube_detection=true
netflix_detection=true
prime_video_detection=true
iplayer_detection=true
all4_detection=true
itvhub_detection=true
twitch_detection=true

xprop_active_info () {
    xprop -id "$(xprop -root _NET_ACTIVE_WINDOW | awk '{print $5}')"
}

we_are_fullscreen () {
    xprop_active_info | grep -q _NET_WM_STATE_FULLSCREEN
}

delay_screensaver () {
  if we_are_fullscreen; then
    if xset -q | grep -q 'DPMS is Enabled'; then
        # reset (deactivate and reactivate) DPMS status:
        xset +dpms
        xset -dpms
    fi
    pgrep xscreensaver >& /dev/null && xscreensaver-command -deactivate
  fi
}

app_is_running() {
    active_win_title=$(xprop_active_info | awk -F= '/\BWM_NAME\(UTF8_STRING\)\B/{print $2}')
    $verbose && echo "  active window title: $active_win_title"

    if $youtube_detection; then
        if [[ $active_win_title = *YouTube* ]]; then
            $verbose && echo "  active win seems to be YouTube"
            return 0
        fi
    fi

    if $netflix_detection; then
        if [[ $active_win_title = *Netflix* ]]; then
            $verbose && echo "  active win seems to be Netflix"
            return 0
        fi
    fi

    if $prime_video_detection; then
        if [[ $active_win_title = *Prime\ Video* ]]; then
            $verbose && echo "  active win seems to be Prime Video"
            return 0
        fi
    fi

    if $iplayer_detection; then
        if [[ $active_win_title = *BBC\ iPlayer* ]]; then
            $verbose && echo "  active win seems to be BBC iPlayer"
            return 0
        fi
    fi

    if $all4_detection; then
        if [[ $active_win_title = *On\ Demand\ -\ All\ 4\ -\ Google\ Chrome* ]]; then
            $verbose && echo "  active win seems to be All4"
            return 0
        fi
    fi

    if $all4_detection; then
        if [[ $active_win_title = *ITV\ Hub\ -\ Google\ Chrome* ]]; then
            $verbose && echo "  active win seems to be ITV Hub"
            return 0
        fi
    fi

    if $twitch_detection; then
        if [[ $active_win_title = *Twitch* ]]; then
            $verbose && echo "  active win seems to be Twitch"
            return 0
        fi
    fi

    return 1;
}

maybe_delay_screensaver () {
    if we_are_fullscreen; then
        $verbose && echo "detected fullscreen"
        if app_is_running; then
            $verbose && echo "app is running too, delaying"
            delay_screensaver
        else
            $verbose && echo "but no relevant app detected"
        fi
    fi
}

delay=${1:-50}

if [[ $delay = *[^0-9]* || $delay = 0 ]]; then
    cat <<EOF
The argument \"$delay\" is invalid, expecting a positive integer
Please use the time in seconds you want the checks to repeat. You want
it to be less than the time it takes your screensaver or DPMS to
activate.
EOF
    exit 1
fi

while true; do
    maybe_delay_screensaver
    sleep "$delay"
done
