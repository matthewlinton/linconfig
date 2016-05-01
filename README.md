# linconfig #

Configure your Linux home directory with minimal effort

## Install ##

* Checkout: `git clone https://matthewlinton@bitbucket.org/matthewlinton/linconfig.git`
* Change into the linconfig directory `cd linconfig`
* run the script `./linconfig`

## Features ##

### Amix's Ultimate vimrc: ###

[https://github.com/amix/vimrc](https://github.com/amix/vimrc)

Amix's has created a very well thought out vim configuration file.
linconfig downloads this from his git repository and has vimrc source the basic 
configuration.

Normally, you would run one of the install scripts in the vim\_runtime, 
directory, but sourcing the basic file allows you to easily add your own
vim configuration options.

### Bash Functions ###

A collection of useful functions.
These have been collected over the years, and I don't know where they've come from.
Let me know if they look familiar, and I'll give you credit for them.

* extract <file>            Extract an archive based on file suffix
* fe <pattern> <command>    Find a file with <pattern> in its name
                            and execute <command>
* ff <pattern>              Find a file with <pattern> in it's name
* fstr <pattern> <files>    Find a pattern in a (set) of files
* maketar <directory>       Create a tar file from a given directory
* makezip <directory>       Create a zip file from a given directory
* swap <file> <file>        Swap 2 file names

### Bash Projects ###

Bash Projects is a bash configuration that allows you to more easily work with
and switch between projects. It provides the following

* cdwsp                 cd into the Workspace directory
* cdprj                 cd into the active project
* cpprj <src> <dest>    Copy a project to a new project
* helpprj               Display help for Bash Projects
* lsprj                 List projects within the workspace directory
* mkprj <project>       Create a new project
* mvprj <src> <dest>    Rename project and move
* prjon                 Turn Bash Projects on
* prjoff                Disable Bash Projects
* rmprj <project>       Remove (Delete) Project
* swprj <project>       Switch Project to <project>

### Bash Notes ###

Bash Notes helps you create and maintain notes from the command line

TODO: Implement Bash Notes

### Misc ###

* bash_aliases          A collection of helpfull bash aliases.
* dir_colors            Make your directory listings look pretty
* bashrc                Load all the bash features

