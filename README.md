# sw1nn dotfiles

## What's here

Various config files accumulated over the years

* bash - nice(r) prompts, useful utils etc
 * os specific stuff in .bashrc.<os-id>
* emacs - allows elpa and local install
* vim - syntax tweaks
* X - color tweaks for dark background
* MacOS X environment variables for non terminal apps via
environment.plist see [Apple developer site](http://developer.apple.com/library/mac/#documentation/MacOSX/Conceptual/BPRuntimeConfig/Articles/EnvironmentVars.html)

## Installation

    git clone https://github.com/sw1nn/dotfiles.git
    cd dotfiles
    ./install.sh

Should install symlinks as appropriate, backing up anything that was previously there. Caveat Emptor!
