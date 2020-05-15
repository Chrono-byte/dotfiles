#!/bin/sh

class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon=""

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
  if [[ ${#info} > 40 ]]; then
    info=$(echo $info | cut -c1-40)"..."
  fi
  text=$icon" "$info
elif [[ $class == "paused" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
  text="$icon \uf04c"
elif [[ $class == "stopped" ]]; then
  text="\uf04d well fuck this wasn't supposed to happen"
fi

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"
