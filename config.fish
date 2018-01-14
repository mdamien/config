alias p python3
alias p2 python2
alias b bpython
 
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
 
#alias python="python3"
alias m='python manage.py'
 
alias serv="python3 -m http.server"
 
alias ga="git add -A ."
alias gs="git status"
alias gca="git commit -a -S"
alias gd="git diff HEAD"
alias gdc="git diff --cached"
alias gc="git commit"
alias gp="git push"

alias xxxg="xgamma -gamma"
alias xxx="xrandr --output eDP-1  --brightness"

alias inst="sudo apt-get install"
alias fsubl="fzf | read -l result; and subl $result"
 
eval (python3 -m virtualfish)
function fish_greeting
end

set -gx PATH "$HOME/.cargo/bin" $PATH;


if begin set -q DISPLAY ;and test -e /usr/bin/xprop; end
  function preexec_test --on-event fish_preexec
      set -g preexec_time (date --iso-8601=seconds)
      set -g MY_WINDOW_ID (xprop -root _NET_ACTIVE_WINDOW ^/dev/null)
  end

  function postexec_test --on-event fish_postexec
      set -l RET "$status"
      set -l postexec_time (date --iso-8601=seconds)
      set -l ACTIVE_WINDOW (xprop -root _NET_ACTIVE_WINDOW ^/dev/null)
      if [ "$ACTIVE_WINDOW" != "$MY_WINDOW_ID" ]
          notify-send "[finished] $argv -- $RET"
      end
  end
end
# https://github.com/qznc/dot/blob/master/config/fish/config.fish#L58
