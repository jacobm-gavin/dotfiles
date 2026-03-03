#!/usr/bin/env bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

say() {
	printf '%s\n' "$1"
}

warn() {
	printf 'warning: %s\n' "$1" >&2
}

timestamp() {
	date +"%Y%m%d%H%M%S"
}

backup_target() {
	local target_path="$1"
	local backup_path="${target_path}.backup.$(timestamp)"

	mv "$target_path" "$backup_path"
	say "Backed up $target_path to $backup_path"
}

link_target() {
	local source_path="$1"
	local target_path="$2"

	mkdir -p "$(dirname "$target_path")"

	if [ "$source_path" = "$target_path" ]; then
		say "Already using $target_path"
		return 0
	fi

	if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
		say "Already linked: $target_path"
		return 0
	fi

	if [ -e "$target_path" ] || [ -L "$target_path" ]; then
		backup_target "$target_path"
	fi

	ln -s "$source_path" "$target_path"
	say "Linked $target_path -> $source_path"
}

install_neovim_linux() {
	local arch
	local download_url
	local local_bin_dir="$HOME/.local/bin"
	local target_path="$local_bin_dir/nvim"

	arch="$(uname -m)"

	case "$arch" in
		aarch64|arm64)
			download_url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-arm64.appimage"
			;;
		x86_64|amd64)
			download_url="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage"
			;;
		*)
			warn "Unsupported Linux architecture: $arch"
			return 1
			;;
	esac

	mkdir -p "$local_bin_dir"

	if command -v curl >/dev/null 2>&1; then
		curl -fsSL -o "$target_path" "$download_url"
	elif command -v wget >/dev/null 2>&1; then
		wget -qO "$target_path" "$download_url"
	else
		warn "curl or wget is required to install Neovim automatically"
		return 1
	fi

	chmod +x "$target_path"
	say "Installed Neovim to $target_path"

	case ":$PATH:" in
		*":$local_bin_dir:"*)
			;;
		*)
			warn "$local_bin_dir is not on PATH yet; add it before using nvim"
			;;
	esac
}

ensure_neovim() {
	if command -v nvim >/dev/null 2>&1; then
		say "Neovim already installed"
		return 0
	fi

	say "Neovim not found; installing it now"

	case "$(uname -s)" in
		Darwin)
			if command -v brew >/dev/null 2>&1; then
				if brew install neovim; then
					say "Installed Neovim with Homebrew"
				else
					warn "Homebrew failed to install Neovim"
				fi
			else
				warn "Homebrew is required to install Neovim automatically on macOS"
			fi
			;;
		Linux)
			if ! install_neovim_linux; then
				warn "Could not install Neovim automatically on Linux"
			fi
			;;
		*)
			warn "Unsupported platform: $(uname -s)"
			;;
	esac
}

install_configs() {
	local dotfiles_target="$XDG_CONFIG_HOME/dotfiles"
	local nvim_target="$XDG_CONFIG_HOME/nvim"
	local zsh_target="$XDG_CONFIG_HOME/zsh"
	local tmux_target="$HOME/.tmux.conf"

	mkdir -p "$XDG_CONFIG_HOME"

	link_target "$SCRIPT_DIR" "$dotfiles_target"
	link_target "$SCRIPT_DIR/nvim" "$nvim_target"
	link_target "$SCRIPT_DIR/zsh" "$zsh_target"
	link_target "$SCRIPT_DIR/.tmux.conf" "$tmux_target"
}

main() {
	say "Welcome to Jacob's installer"
	ensure_neovim
	install_configs
	say "Install complete"
}

main "$@"
