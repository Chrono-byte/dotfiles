#!/bin/sh

class=''
icon="RPM"

text=$(cat /proc/acpi/ibm/fan | grep speed: | awk '{print $2}')
text="$icon $text"

echo -e "{\"text\":\""$text"\", \"class\":\""$class"\"}"