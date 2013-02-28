#------------------------------
# Config: tmux.conf
# Leo Mendoza
# 
# Let's try switching from screen to tmux!
#
# Inspiration(s):
# http://tonkersten.com/2011/07/104-switching-to-tmux/
# http://blog.hawkhost.com/2010/07/02/tmux-%E2%80%93-the-terminal-multiplexer-part-2/#rebinding-action-key
# https://github.com/eevee/rc/blob/master/.tmux.conf
#------------------------------

# Highlight active window
set-window-option -g window-status-current-bg red

# Switch me back to ^A, thanks
set-option -g prefix C-a
unbind-key C-b
bind-key a send-prefix

# I miss ^A^A and ^ASpace
# standard Screen shortcuts
unbind C-a
bind C-a last-window

unbind Space
bind Space next-window
unbind BSpace
bind BSpace previous-window


# Options
set-option -sg escape-time 50  # this makes vim fucking awful to use
set-option -g default-terminal screen-256color
set-option -g lock-command vlock
set-window-option -g xterm-keys on  # to make ctrl-arrow, etc. work

set-option -g set-titles on
set-option -g set-titles-string '[#S:#I #H] #W'  # use screen title

# COLORS.
# For reference, the xterm color cube points are: 00, 5F, 87, AF, D7, FF
# Status bar has a dim gray background
set-option -g status-bg colour234
set-option -g status-fg colour0
# Left shows the session name, in blue
set-option -g status-left '[#I:#W]'
set-option -g status-left-bg default
set-option -g status-left-fg colour74
# Right is some CPU stats, so terminal green
set-option -g status-right-bg default
set-option -g status-right-fg colour71
# Windows are medium gray; current window is white
set-window-option -g window-status-fg colour244
set-window-option -g window-status-current-fg '#ffffff'
set-window-option -g window-status-current-bg '#000000'
#
# Trim window titles to a reasonable length
set-window-option -g window-status-format '#[fg=yellow]#F#I#[default] #32W '
set-window-option -g window-status-current-format '#[fg=yellow] #I#[default] #32W '

set -g bell-action any
set -g visual-bell on

# reload tmux.conf
unbind r
bind r source-file ~/.tmux.conf
