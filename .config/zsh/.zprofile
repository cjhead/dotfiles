#!/bin/zsh

# Settings here are those which most likely will not be switched during run time.

# NVIDIA GPU only is enabled through the display_setup.sh file in etc/lightdm/
# and editing /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf

/home/carl/.fehbg &
picom -b
dunst &
udiskie &
easyeffects --gapplication-service &

# Turn off screen saver
xset s off

# Turn off Energy Star features
xset -dpms

# Add font paths for xorg
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/noto
xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/OTF
xset fp rehash

xrdb -merge ~/.Xresources

# Needs to be exported before statusbar runs so scripts are sourced in time.
export PATH=$PATH:~/.scripts:~/.local/bin:~/.local/bin/statusbar

# Status Bar
dwmblocks &

# Trick java programs into running
wmname compiz

# Turn on NumLock automatically
numlockx &

# Default Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$HOME/.config/zsh"

# For valgrind to work
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
