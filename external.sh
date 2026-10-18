#!/bin/sh
HTML_FILES=`sudo find / -name "*.sh" -print`
echo "$HTML_FILES" | grep "/first.sh$"
echo "$HTML_FILES" | grep "/for.sh$"
