#!/bin/bash
cd
git clone https://github.com/SolDoesTech/HyprV4
cd HyprV4
./set-hypr
yay -S rustc cargo rustup gtk3 gtk-layer-shell pango gdk-pixbuf2 cairo glib2 gcc-libs glibc
cd
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cd target/release
chmod +x ./eww
./eww daemon
cd
git clone -b eww https://github.com/Aylur/dotfiles.git
git clone https://github.com/Aylur/dotfiles.git
cp -r dotfiles/.config/eww ~/.config/eww
cp -r dotfiles/.config/hypr ~/.config/hypr
mv ~/.config/hypr/_hyprland.conf ~/.config/hypr/hyprland.conf
rm /.config/hypr/theme.conf
mv ~/EOSrice/theme.conf ~/.config/hypr/
