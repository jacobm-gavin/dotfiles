function yts {
	source ~/Developer/yt-search-download/.env/bin/activate;
	python3 ~/Developer/yt-search-download/search.py;
	deactivate;
}
function yd {
	yt-dlp $1 -x --audio-format mp3 --embed-thumbnail --embed-metadata -P ~/audio2 --restrict-filenames;
}


function watch {
	if [[ $# -lt 2 ]]; then
		echo "Usage: watch <file> <command>"
		return 1
	fi

	local file="$1"
	shift
	local cmd="$*"

	if ! command -v fswatch >/dev/null; then
		echo "error: fswatch is not installed"
		return 1
	fi

	echo "Watching $file"
	fswatch -o "$file" | while read -r; do
		eval "$cmd \"$file\""
	done
}



function fuck {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
