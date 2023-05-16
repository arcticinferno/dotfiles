nvidia-settings --load-config-only &
source /etc/environment
pulseaudio -D
picom --experimental-backends & 
~/.fehbg
killall mpd
mpd
export GOPATH=$(go env GOPATH)
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
export EDITOR=nvim
xset r rate 300 50
exec dbus-run-session xmonad


