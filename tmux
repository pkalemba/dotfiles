####
# Instructions
####

# BE SURE TO INSTALL TMUX Plugin Manager
# https://github.com/tmux-plugins/tpm
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# then Load tmux configurations
#> tmux source-file ~/.tmux.conf

# Once installed load plugins in your session with
#> ctrl-b + I
# Once installed:
# prefix + y = copy line to clipboard
# prefix + ctrl-s = Persist session
# prefix + ctrl-r = Resurect session

# For all other commands, see cheat sheet:
# http://www.dayid.org/comp/tm.html

####
# Settings including active mouse, scrolling and more ...
####

# 0 is too far from ` ;)
set -g base-index 1

#retreuve persisted tmux after restart
#https://github.com/tmux-plugins/tmux-resurrect
set -g @plugin 'tmux-plugins/tmux-resurrect'

# automaticually saves tmux session every 15mins
# https://github.com/tmux-plugins/tmux-continuum
set -g @continuum-restore 'on'
set -g @plugin 'tmux-plugins/tmux-sidebar'

#allow copy and paste from tmux
#https://github.com/tmux-plugins/tmux-yank
set -g @plugin 'tmux-plugins/tmux-yank'

# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on
set -g default-shell /bin/zsh
bind -n End send-key C-e
bind -n Home send-key C-a


set -g default-terminal screen-256color
set -g status-keys vi
set -g history-limit 10000

setw -g mode-keys vi
set -g mouse on
setw -g monitor-activity on

bind-key v split-window -h
bind-key s split-window -v

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R


# Use Alt-vim keys without prefix key to switch panes
bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# Use Alt-arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# No delay for escape key press
set -sg escape-time 0

# Reload tmux config
bind r source-file ~/.tmux.conf



# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-urlview'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'GROG/tmux-plugin-mem'

set -g @mem_high_percentage "80"
set -g @mem_low_percentage "40"
set -g @mem_ignore_cached "no"

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)

## COLORSCHEME: gruvbox dark
set-option -g status "on"

# default statusbar colors
set-option -g status-bg colour237 #bg1
set-option -g status-fg colour223 #fg1

# default window title colors
set-window-option -g window-status-style bg=colour214 #yellow
set-window-option -g window-status-style fg=colour237 #bg1

set-window-option -g window-status-activity-style bg=colour237 #bg1
set-window-option -g window-status-activity-style fg=colour248 #fg3

# active window title colors
set-window-option -g window-status-current-style bg=default
set-window-option -g window-status-current-style fg=colour237 #bg1

# pane border
set-option -g pane-active-border-style fg=colour250 #fg2
set-option -g pane-border-style fg=colour237 #bg1

# message infos
set-option -g message-style bg=colour239 #bg2
set-option -g message-style fg=colour223 #fg1

# writting commands inactive
set-option -g message-command-style bg=colour239 #fg3
set-option -g message-command-style fg=colour223 #bg1

# pane number display
set-option -g display-panes-active-colour colour250 #fg2
set-option -g display-panes-colour colour237 #bg1

# clock
set-window-option -g clock-mode-colour colour109 #blue

# bell
set-window-option -g window-status-bell-style fg=colour235,bg=colour167 #bg, red


## Theme settings mixed with colors (unfortunately, but there is no cleaner way)
set -g @batt_remain_short true
set-option -g status-style "none"
set-option -g status-justify "left"
set-option -g status-left-style "none"
set-option -g status-left-length "80"
set-option -g status-right-style "none"
set-option -g status-right-length "80"
set-window-option -g window-status-activity-style "none"
set-window-option -g window-status-style "none"
set-window-option -g window-status-separator ""

set-option -g status-left "#[fg=colour248, bg=colour241] #S #[fg=colour241, bg=colour237, nobold, noitalics, nounderscore]"
set-option -g status-right "#[fg=colour239, bg=colour237, nobold, nounderscore, noitalics]#[fg=colour246,bg=colour239] Memory:#{mem_percentage} Batt:#{battery_percentage} #{battery_remain} #[fg=colour246,bg=colour239] %Y-%m-%d  %H:%M #[fg=colour248, bg=colour239, nobold, noitalics, nounderscore]#[fg=colour237, bg=colour248] #h "

set-window-option -g window-status-current-format "#[fg=colour239, bg=colour248, :nobold, noitalics, nounderscore]#[fg=colour239, bg=colour214] #I #[fg=colour239, bg=colour214, bold] #W #[fg=colour214, bg=colour237, nobold, noitalics, nounderscore]"
set-window-option -g window-status-format "#[fg=colour237,bg=colour239,noitalics]#[fg=colour223,bg=colour239] #I #[fg=colour223, bg=colour239] #W #[fg=colour239, bg=colour237, noitalics]"
run '~/.tmux/plugins/tpm/tpm'
