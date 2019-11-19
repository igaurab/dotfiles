My dotfiles for vim, tmux and i3

## Vim Setup

Vim-plug for plugin management.

Copy the `.vimrc` and `.vim` folder to your `$HOME` directory

Run `PlugInstall` to install all the plugins

The plugins are located under a seperate file named `plug.vim` inside the `.vim` directory

## tmux setup

tmux setup is preety straightforward. I have used a starter pack from [Oh My Tmux](https://github.com/gpakosz/.tmux). Follow the installation directions and just replace the `.tmux.conf.local` file in the `$HOME` directory.


> The necessary fonts are located on .fonts folder. Copy the fonts to ~/.fonts
If you are using gnmoe, the fonts installed will not show on your preferences of your terminal.
You will have to install `Gnome Tweaks` and setup the system wise fonts. The font I have used is `Fura Code Mono Medium"

# Final Screenshot
<div style="text-align: center"><table><tr>
  <td style="text-align: center">
  <a href="https://github.com/igaurab/dotfiles/blob/master/Screenshot.png">
    <img src="https://github.com/igaurab/dotfiles/blob/master/Screenshot.png"/></a>
</td>
</tr></table></div>

## Troubleshoot
You should also install xbacklight and pulseaudio for your volume keys and brightness control keys to work.
```
#For volume controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl -- set-sink-volume 0 +5% #increas    e sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl -- set-sink-volume 0 -5% #decreas    e sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound
   
#Sreen brightness controls
bindsym XF86MonBrightnessDown exec xbacklight -inc 5
bindsym XF86MonBrightnessUp exec xbacklight -dec 5 
```

Also check this article to configure touch to click for touchpad
https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/

If your xbacklight does not work by default and using intel graphics
Add these to your /etc/X11/xorg.conf file, if it does not exist by default create one.
For further troubleshooting check this thread:

https://askubuntu.com/questions/715306/xbacklight-no-outputs-have-backlight-property-no-sys-class-backlight-folder

```
 Section "Device"                                                                         
           Identifier      "Intel Graphics"
           Driver          "intel"
           Option          "Backlight" "intel_backlight"
  EndSection


```
