#!/bin/bash
sudo su
mkdir ~/Downloads
yay -S kitty polybar rofi bspwm-rounded-corners-git xdg-user-dirs nautilus xorg pavucontrol blueberry xfce4-power-manager feh lxappearance papirus-icon-theme file-roller gtk-engines gtk-engine-murrine neofetch imagemagick parcellite xclip maim gpick curl jq tint2 zsh moreutils recode dunst plank python-xdg redshift mate-polkit xfce4-settings mpv yaru-sound-theme fish alsa-utils slim xorg-xinit brightnessctl acpi mugshot playerctl python-pytz glava wmctrl i3lock-color jgmenu inter-font networkmanager-dmenu-git conky-lua bsp-layout zscroll noise-suppression-for-voice starship system76-power lsof gamemode lib32-gamemode xdo bluez bluez-utils bluez-libs bluez-tools
yay -S python-pip
pip install pylrc
yay -S rust-nightly-bin gtk3
cd ~/Downloads
git clone https://github.com/elkowar/eww.git
cd eww
cargo build --release -j $(nproc)
cd target/release
mv eww /usr/bin/eww
yay -S base-devel
cd ~/Downloads
git clone https://github.com/baskerville/xqp.git
cd xqp
make
sudo make install
yay -S sudo pacman -S libconfig libev libxdg-basedir pcre pixman xcb-util-image xcb-util-renderutil hicolor-icon-theme libglvnd libx11 libxcb libxext libdbus asciidoc uthash
cd ~/Downloads
git clone https://github.com/pijulius/picom.git
cd picom/
meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
sudo ninja -C build install
sudo usermod -aG adm $USER
sudo systemctl enable --now com.system76.PowerDaemon
sudo systemctl enable bluetooth
##2
cd ~/Downloads
git clone https://github.com/Fausto-Korpsvart/Tokyo-Night-GTK-Theme.git
cd Tokyo-Night-GTK-Theme/
mv themes/Tokyonight-Dark-BL /usr/share/themes/
##3
cd ~/Downloads
git clone https://github.com/syndrizzle/hotfiles.git -b bspwm
cd hotfiles
cp -r .config .scripts .local .cache .wallpapers ~/
cp .xinitrc .gtkrc-2.0 ~/
cd .fonts
mv * /usr/share/fonts
cd etc/
mv slim.conf environment /etc/
sudo cp -r usr/* /usr/
yay -S spicetify-cli-git
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
spicetify config current_theme Ziro
spicetify config color_scheme tokyonight
spicetify config extensions adblock.js
spicetify backup apply
##sppicing
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
##2
nano ~/.config/polybar/scripts/github
##Now, replace Your_Username in the USER field with your GitHub username. And then replace Your_PAT in the TOKEN field with your Personal Access Token.
xdg-user-dirs-update
xfconf-query -c xfce4-session -p /general/LockCommand -s "$HOME/.scripts/lock-run" --create -t string
