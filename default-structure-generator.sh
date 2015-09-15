#!/bin/bash

#------------------------------------------------------------------------------
# Name:    default-structure-generator
# Purpose: Creates a default directory structure with some of the basics files
#           for a basic web application.
# Author:  Nicholas Leite, https://www.twitter.com/nicklleite
# Info:    https://github.com/nicklleite/default-structure-generator
# License: MIT
#------------------------------------------------------------------------------

declare -r TRUE=0
declare -r FALSE=1

function isYes() {
  local x=$1
  [ "$x" = "y" ] && echo $TRUE; return
  [ "$x" = "Y" ] && echo $TRUE; return
  [ "$x" = "yes" ] && echo $TRUE; return
echo $FALSE
}

echo "This script creates a default directory structure for a basic web application."
echo "Coded by Nicholas <nicklleite@gmail.com>"
echo "---- @nicklleite (twitter|github)"

while [ $TRUE ]; do

  read -p "Directory/Project Name (MyFirstProject): " directoryName
  directoryName=${directoryName:-MyFirstProject}

  read -p "Which CSS preprocessor will be used? (sass/less): " cssPreprocessor
  cssPreprocessor=${cssPreprocessor}

  read -p "Create .gitignore File? (Y/n): " createGitignore
  createGitignore=${createGitignore:-yes}

  read -p "Create README.md File? (Y/n): " createReadme
  createReadme=${createReadme:-yes}

  echo ""
  echo "-----------------------------------------------"
  echo "Directory/Project Name: $directoryName"
  echo "CSS preprocessor: $cssPreprocessor"
  echo "Create .gitignore File?: $createGitignore"
  echo "Create README.md File?: $createReadme"
  echo "-----------------------------------------------"

  echo ""
  read -p "Create Project? (Y/n): " createProject
  createProject=${createProject:-yes}

  [ "$(isYes "$createProject")" = "$TRUE" ] && break

done

#------------------------------
# Directory structure
#------------------------------
# -- assets/
#     -- css/
#     -- [ssas|less]/
#         -- components/
#             -- layout.[ssas|less]
#             -- header.[ssas|less]
#             --
#         -- lib/
#             -- functions.[ssas|less]
#             -- constants.[ssas|less]
#         -- main.[ssas|less]
#     -- js/
#         -- plugins/
#         -- lib/
#         -- main.js
#     -- coffeescript/
#     -- images/

#------------------------------
# Creating the directories & files
#------------------------------
if [ "$cssPreprocessor" = "less" ]; then
    # Folders
    mkdir -p ${directoryName}/assets/{css,less,js,coffeescript,images}
    mkdir -p ${directoryName}/assets/less/{components,lib}

    # Files
    touch ${directoryName}/assets/less/main.less
elif [ "$cssPreprocessor" = "sass" ]; then
    # Folders
    mkdir -p ${directoryName}/assets/{css,sass,js,coffeescript,images}
    mkdir -p ${directoryName}/assets/sass/{components,lib}

    # Files
    touch ${directoryName}/assets/sass/main.sass
else
    # Folders
    mkdir -p ${directoryName}/assets/{css,js,images}
fi
mkdir -p ${directoryName}/assets/js/{plugins,lib}
touch ${directoryName}/assets/js/main.js


#------------------------------
# Create .gitignore
#------------------------------
if [ "$(isYes "$createGitignore")" = "$TRUE" ]; then
touch "${directoryName}"/.gitignore
fi

#-----------------------------
# Create README.me
#-----------------------------
if [ "$(isYes "$createReadme")" = "$TRUE" ]; then
touch "${directoryName}"/README.md
fi

echo ""
echo "Structure created!"
echo "Thanks for using Default Structure Generator."
