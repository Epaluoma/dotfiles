set $mod Mod4

new_window pixel 1
new_float normal

hide_edge_borders both

font pango:System San Francisco Display 10

floating_modifier $mod
bindsym $mod+Return exec i3-sensible-terminal

bindsym $mod+Shift+q kill

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+odiaeresis focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+odiaeresis move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# change workspace names&tags
set $workspace1 "1:"
set $workspace2 "2: "
set $workspace3 "3:"
set $workspace4 "4:"
set $workspace5 "5:"
set $workspace6 "6:"
set $workspace7 "7:"
set $workspace8 "8:"
set $workspace9 "9:"
set $workspace10 "10:"

# switch to workspace
bindsym $mod+1 workspace $workspace1
bindsym $mod+2 workspace $workspace2
bindsym $mod+3 workspace $workspace3
bindsym $mod+4 workspace $workspace4
bindsym $mod+5 workspace $workspace5
bindsym $mod+6 workspace $workspace6
bindsym $mod+7 workspace $workspace7
bindsym $mod+8 workspace $workspace8
bindsym $mod+9 workspace $workspace9
bindsym $mod+0 workspace $workspace10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $workspace1
bindsym $mod+Shift+2 move container to workspace $workspace2
bindsym $mod+Shift+3 move container to workspace $workspace3
bindsym $mod+Shift+4 move container to workspace $workspace4
bindsym $mod+Shift+5 move container to workspace $workspace5
bindsym $mod+Shift+6 move container to workspace $workspace6
bindsym $mod+Shift+7 move container to workspace $workspace7
bindsym $mod+Shift+8 move container to workspace $workspace8
bindsym $mod+Shift+9 move container to workspace $workspace9
bindsym $mod+Shift+0 move container to workspace $workspace10

# open programs in their respected workspaces
assign [class="Gnome-terminal"] $workspace1
assign [class="Firefox"] $workspace2
assign [class="Thunderbird"] $workspace3
assign [class="Spacefm"] $workspace4
assign [class="Emacs"] $workspace5
assign [class="Spotify"] $workspace10


# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym odiaeresis resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

set $bg-color 	         #2f343f
set $inactive-bg-color   #2f343f
set $text-color          #f3f4f5
set $inactive-text-color #676E7D
set $urgent-bg-color     #E53935

# window colors
#                       border              background         text                 indicator
client.focused          $bg-color           $bg-color          $text-color          #00ff00
client.unfocused        $iancative-bg-color $inactive-bg-color $inactive-text-color #00ff00
client.focused_inactive $iancative-bg-color $inactive-bg-color $inactive-text-color #00ff00
client.urgent	        $urgent-bg-color    $urgent-bg-color   $text-color          #00ff00


# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3blocks -c ~/.config/i3/i3blocks.conf
        tray_output primary
	colors {
		background $bg-color
	    	separator #757575
		#                  border             background         text
		focused_workspace  $bg-color          $bg-color          $text-color
		inactive_workspace $inactive-bg-color $inactive-bg-color $inactive-text-color
		urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
	} 
}



#Volume&Media bindings
  bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% 
  bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% 
  bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle
  bindsym XF86AudioPlay exec playerctl play-pause
  bindsym XF86AudioPause exec playerctl pause
  bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

#autostart programs
exec_always feh --bg-scale /home/jaakko/Pictures/wallpaper.jpg
exec_always compton
bindsym $mod+shift+x exec i3lock --color "$bg-color"
bindsym $mod+shift+f exec firefox
bindsym $mod+shift+z exec scrot -e 'mv $f ~/Pictures/.'
bindsym $mod+z exec --no-startup-id morc_menu
exec --no-startup-id nm-applet
exec_always --no-startup-id xfce4-power-manager
exec --no-startup-id dropbox start
exec --no-startup-id fluxgui

# start dmenu (a program launcher)
bindsym $mod+d exec rofi -show run -opacity "85" -bw 0 -bc "$bg-color" -bg "$bg-color" -fg "$text-color"
