#!/bin/bash

set -e
exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

dotfiles_dir="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$dotfiles_dir"

link() {
    orig_file="$dotfiles_dir/$1"
    if [ -n "$2" ]; then
        dest_file="$HOME/$2"
    else
        dest_file="$HOME/$1"
    fi

    mkdir -p "$(dirname "$orig_file")"
    mkdir -p "$(dirname "$dest_file")"

    rm -rf "$dest_file"
    ln -s "$orig_file" "$dest_file"
    echo "$dest_file -> $orig_file"
}

is_chroot() {
    ! cmp -s /proc/1/mountinfo /proc/self/mountinfo
}

systemctl_enable_start() {
    echo "systemctl --user enable --now "$1""
    systemctl --user enable --now "$1"
}

echo "==========================="
echo "Setting up user dotfiles..."
echo "==========================="

link ".zshrc"
link ".zprofile"

link ".config/rofi"
link ".config/sway"
link ".config/swaylock"
link ".config/waybar"
link ".config/wofi"

echo ""
echo "======================================="
echo "Finishing various user configuration..."
echo "======================================="

if is_chroot; then
    echo >&2 "=== Running in chroot, skipping GTK file chooser dialog configuration..."
else
    echo "Configuring Nautlius"
    gsettings set org.gnome.nautilus.preferences sort-directories-first true
    echo "Configuring GTK file chooser dialog"
    gsettings set org.gtk.Settings.FileChooser sort-directories-first true
fi