#!/bin/bash

####
# Usage:  alacritty-use-theme <themename>
#
#   alacritty-use-theme: fn(<optional> themename)
#
#   This funciton will update the current alacritty configuration with the
#   selected theme.
#
# Examples:
#
#  - `alacritty-use-theme pencil-light`
#  - `alacritty-use-theme` #NOTE: This will use alacritty's default theme "Tomorrow-night"
#
# Exports:
#   `alacitty-use-theme` and  `configure-alacritty` to support legacy API call
###


# TODO What if we switched this to append an import statement that includes a link to the theme.
alacritty-use-theme() {
  local scriptDir=/usr/share/alacritty-use-theme

  local themeName;
  local userInput;

  local alacrittyDir=$HOME/.config/alacritty

  # Set the mood ;)
  # nan na-nan -- ba nan-na nan -- nan-na nan
  if (( $# == 1 )); then
    userInput=$1
  fi

  #check aliases
  eval $(yq -o=shell '.' ${alacrittyDir}/themes/aliases.toml)

  prefix="aliases_"
  lookup="${prefix}${userInput}";
  [ -v $lookup ] && themeName="${!lookup}"

  ###
  # **IF** $themeName is set a non-zero value AND $themeName is not 'default'
  # **ELSE IF** the userInput is a theme in the themes folder
  # **OTHERWISE** use the default theme
  ###

  if [ -n "$themeName" ] && [ "$themeName" != "default" ];  then
    ln -sf ${alacrittyDir}/themes/themes/${themeName}.toml ${alacrittyDir}/themes/selected.toml
  elif [ -f ${alacrittyDir}/themes/themes/${userInput}.toml ]; then
    ln -sf ${alacrittyDir}/themes/themes/${userInput}.toml ${alacrittyDir}/themes/selected.toml
  else
	  if ([ -n "$userInput" ] && [ ! -f ${alacrittyDir}/themes/themes/${userInput}.toml ]) && [ -z $themeName ]; then
	      echo -e "Theme:'${userInput}' was not found in ${alacrittyDir}/themes/themes/"
	  fi
    ln -sf ${scriptDir}/selected.toml.DEFAULT ${alacrittyDir}/themes/selected.toml
  fi

  touch -m ${alacrittyDir}/alacritty.toml #hack; Update files modify date
}

export -f alacritty-use-theme
