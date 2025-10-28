#!/usr/bin/env bash
set -e

# confirm $XDG_CONFIG_HOME is set
if [ -z "$XDG_CONFIG_HOME" ]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi
echo "XDG_CONFIG_HOME is set to $XDG_CONFIG_HOME"
install_config() {
  local cfg="$1"
  # move config to ~/.config/$cfg
  # check if ~/.config/$cfg exists
  if [ -d "$XDG_CONFIG_HOME/$cfg" ]; then
    # if it does, back it up
    echo "$XDG_CONFIG_HOME/$cfg already exists, backing it up to $XDG_CONFIG_HOME/$cfg.bak"
    mv "$XDG_CONFIG_HOME/$cfg" "$XDG_CONFIG_HOME/$cfg.bak"
    cp -r "$cfg" "$XDG_CONFIG_HOME/$cfg"
    echo "$cfg config installed"
  else
    echo "moving $cfg config to $XDG_CONFIG_HOME/$cfg"
    mkdir -p "$XDG_CONFIG_HOME"
    cp -r "$cfg" "$XDG_CONFIG_HOME/$cfg"
  fi
}

install_home_file() {
  local file="$1"
  local target="$HOME/$file"
  if [ -f "$target" ] || [ -L "$target" ]; then
    echo "$target already exists, backing it up to $target.bak"
    mv "$target" "$target.bak"
    cp "$file" "$target"
    echo "$file installed to $HOME"
  else
    echo "moving $file to $target"
    cp "$file" "$target"
  fi
}



install_config "nvim"
install_config "zsh"
install_config "yabai"
install_home_file ".zshrc"

