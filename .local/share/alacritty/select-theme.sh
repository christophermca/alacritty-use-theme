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
  local scriptDir=/usr/local/bin/alacritty

  local themeName;
  local dayNight;

  local alacrittyDir=$HOME/.config/alacritty

  #This function assumes this user will are use the default filename for the configfile eg(`alacritty.toml`)
  local configfile=${alacrittyDir}/alacritty.toml

  local dayTheme=$(cat ${alacrittyDir}/themes/aliases.toml | grep -oP '(?<=day = ")[a-z-]+')
  local nightTheme=$(cat ${alacrittyDir}/themes/aliases.toml | grep -oP '(?<=night = ")[a-z-]+')

  # Set the mood ;)
  # nan na-nan -- ba nan-na nan -- nan-na nan
  if (( $# == 1 )); then
    dayNight=$1
  fi

  case ${dayNight} in
    "night")
      # if not set, alacritty will use its default theme :: Tomorrow-night mixed
      # with Tomorrow-night-bright
      themeName=$nightTheme
      ;;
    "day")
      themeName=$dayTheme
      ;;
  esac

  if [ $themeName ];  then
    ln -sf ${alacrittyDir}/themes/themes/${themeName}.toml ${alacrittyDir}/themes/selected.toml
  else
    ln -sf ${scriptDir}/selected.toml.DEFAULT ${alacrittyDir}/themes/selected.toml
  fi

  touch -m ${alacrittyDir}/alacritty.toml #hack; Update files modify date
}

# Legacy API
configure-alacritty() {
 notify-send 'CALL to legacy alacritty configuration fn'
 alacritty-use-theme "$@"
}

export -f alacritty-use-theme
export -f configure-alacritty

