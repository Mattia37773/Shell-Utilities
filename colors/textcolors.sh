#!/usr/bin/env bash

# Green Color 
color_green() {
    tput setaf 46
    echo "$1"
    tput sgr0
}

# Red Color
color_darkblue() {
    tput setaf 21        # 21 is a vibrant Blue in 256-color mode
    echo "$1"
    tput sgr0
}

# Vibrant Purple
color_purple() {
    tput setaf 165
    echo "$1"
    tput sgr0
}
color_purple "my color"
# Light Blue / Cyan
color_lightblue() {
    tput setaf 51  # Vibrant Sky Blue
    echo "$1"
    tput sgr0
}

colorize() {
    tput setaf "$1"
    echo "$2"
    tput sgr0
}

# Examples:
colorize 21 "This is blue"
colorize 196 "This is red"