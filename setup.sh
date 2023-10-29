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
