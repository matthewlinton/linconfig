###############################################################################
#   Copyright 2014 Matthew Linton
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
###############################################################################
#!/bin/bash
# linconfig.sh - Initialize a linux home directory

SSH_KEYSTRENGTH=4096

SC_DIR="$(dirname "$(readlink -f "$0")")"
SC_SKEL="$SC_DIR/skel"

# download amix ultimate vim config
# https://github.com/amix/vimrc
echo "Downloading amix ultimate vimrc"
if [ ! -d "${HOME}/.vim_runtime" ]; then
    git clone "git://github.com/amix/vimrc.git" "${HOME}/.vim_runtime"
fi

# Copy over files in the skel directory
echo "Configuring home directory... "
# Overwrite these files
cp "$SC_SKEL/bash_functions" "${HOME}/.bash_functions"
cp "$SC_SKEL/bash_aliases" "${HOME}/.bash_aliases"
cp "$SC_SKEL/bash_projects" "${HOME}/.bash_projects"
cp "$SC_SKEL/bash_notes" "${HOME}/.bash_notes"
cp "$SC_SKEL/projectsrc" "${HOME}/.projectsrc"
cp "$SC_SKEL/notesrc" "${HOME}/.notesrc"

# Update these files
cp "$SC_SKEL/bashrc" "${HOME}/.bashrc"
cp "$SC_SKEL/vimrc" "${HOME}/.vimrc"
cp "$SC_SKEL/dir_colors" "${HOME}/.dir_colors"

# add common directories
echo "Adding common directories... "
mkdir -p "${HOME}/.ssh"
mkdir -p "${HOME}/workspace"
mkdir -p "${HOME}/notes"
mkdir -p "${HOME}/public"
mkdir -p "${HOME}/public_html"

# configure ssh private and public keys
echo "Setting up SSH keys... "
if [ ! -f "${HOME}/.ssh/id_dsa" ]; then
    echo "   Creating DSA key... "
    ssh-keygen -t dsa
fi

if [ ! -f "${HOME}/.ssh/id_rsa" ]; then
    echo "   Creating rsa key... "
    ssh-keygen -t rsa -b $SSH_KEYSTRENGTH
fi

# Fix permissions for things that can be problematic
echo "Fixing Permissions... "
chmod 700 "${HOME}/.ssh"

# Done. Give user configuration instructions
cat << FINISHED_INSTRUCTIONS

Istalation complete.

Bash Projects : for more information run the command "prjhelp"
  To enable Bash Projects, run the following commands
    $ swwsp /home/<user>/<workspace>
    $ prjon

Bash Notes : To enable Bash Notes, edit the configuration file
    ".notesrc" in your home directory.

Finally, restart your session or run the command "source ~/.bashrc"
    To make sure everything is correctly loaded.

FINISHED_INSTRUCTIONS
