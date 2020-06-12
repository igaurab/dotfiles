current_theme=$(gsettings get org.cinnamon.desktop.interface gtk-theme)
echo $current_theme
if [ current_theme = "Mint-Y-Darker" ];
then
    echo "Hey"
    gsettings set org.cinnamon.desktop.privacy remember-recent-files false
    gsettings set org.cinnamon.theme name "Mint-Y-Dark"
    gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Dark"
    gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-Y-Dark"
    gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y-Dark'
else
    #Doesn't remember recent files
    gsettings set org.cinnamon.desktop.privacy remember-recent-files false
    # This is Desktop in Theme
    gsettings set org.gnome.desktop.interface icon-theme 'Mint-Y'
    #This changes controls
    gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Darker"
    # This changes window borders
    gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-Y-Dark"
    #Icons for cinnamon desktop
    gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y'
    #gsettings set org.cinnamon.theme name "Mint-Y-Dark"
fi
