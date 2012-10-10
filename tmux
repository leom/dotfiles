#------------------------------
# vi: set sw=4 ts-4 ai:
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

# Set that stupid Esc-Wait off, so VI works again
set-option -sg  escape-time 0

# Set the prefix to Ctrl-A
set-option -g   prefix C-a
unbind-key C-b
bind-key a send-prefix

# Like screen!
bind-key C-a last-window
bind-key Space next-window
bind-key C-Space previous-window

# Set status bar
set -g status-bg black
set -g status-fg white
set -g status-left ‘#[fg=green]#H’
set -g   status-right ' | %Y-%m-%d %H:%M #[default]'

# Highlight active window
set-window-option -g window-status-current-bg red

