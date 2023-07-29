#! /usr/bin/bash

playerctl metadata -p vlc --format '{{xesam:title}} -  {{ vlc:nowplaying }}'
