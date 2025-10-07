echo "config sourcing"

for file in $(find ~/.config/zsh -type f); do
	source $file
done
