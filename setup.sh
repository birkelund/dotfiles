#!/bin/bash

# bash 'strict mode'
set -euo pipefail
IFS=$'\n\t'

# stow convenience function
_stow() {
  stow -t ~ $1
}

_add() {
  case "$1" in
    git )
      mkdir -p ~/.gitconfig.d

      _stow git
      ;;

    ssh )
      mkdir -p ~/.ssh/config.d
      mkdir -p ~/.config/systemd/user
      echo "SSH_AUTH_SOCK DEFAULT=/run/user/$(id -u)/ssh-agent.socket" \
        > $HOME/.pam_environment

      _stow ssh

      systemctl --user enable ssh-agent.service
      systemctl --user start ssh-agent.service
      ;;

    * )
      _stow "$1"
      ;;
  esac
}

# main
case "$1" in
  workstation )
    for m in code tmux; do
      _add "$m"
    done

    ;& # fallthrough

  remote )
    for m in git gdb ssh vim zsh; do
      _add "$m"
    done

    ;;
esac

# vim: set expandtab ts=2 sts=2 sw=2:
