# dotfiles

My personal Linux configuration files.

## Installation

1. Install base Arch Linux system
1. Install ansible `pacman -S ansible`
1. Clone dotfiles repository to `/root/dotfiles`
1. Run `ansible-playbook install.yml`
1. Set user password
1. Reboot

## Initial User Configuration

1. Log in as user 'paul'
1. Clone dotfiles repository under `~/.dotfiles`
1. Run `ansible-playbook user.yml`

## Update System and User Configuration

1. Log in as user 'paul'
1. Run `ansible-playbook install.yml --ask-become-pass`
1. Run `ansible-playbook user.yml`
