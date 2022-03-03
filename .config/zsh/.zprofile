#!/bin/zsh

# Settings here are those which most likely will not be switched during run time.

# NVIDIA GPU only is enabled through the display_setup.sh file in etc/lightdm/
# and editing /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf

/home/carl/.fehbg &
picom -b
dunst &
udiskie &

# Turn off screen saver
xset s off

# Turn off Energy Star features
xset -dpms

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
