#!/usr/bin/env bash

SCRIPT=_script.sh

URL_INSTALL_HOMEBREW_SCRIPT=https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

install_from () {
	echo "-> downloading from '$1'"
	curl -fsSLo $SCRIPT $1
        if [ $? -ne 0 ]; then
                echo "-> FIAILED to download '$1'"
		exit 1
        fi

        echo "-> installing"
        bash $SCRIPT
}

echo "Setting up this mac:"

echo "-> installing homebrew"
if [ ! "$(command -v brew)" ]; then
	install_from $URL_INSTALL_HOMEBREW_SCRIPT && echo "-> done"
else
	echo "-> already installed"
fi

if [ $? -eq 0 ]; then
	echo "-> installing brew packages and casks"
	brew bundle -v
fi
