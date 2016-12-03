#/bin/bash

cd `dirname $0`

find . -mmin -1 -regex ".*odekakeshimasyo\.\(js\|css\)" | grep -v odekakeshimasyo.min || exit 0

cat ./odekakeshimasyo.css | sed s/"\t"//g | tr '\n' ' ' > odekakeshimasyo.min.css
cat ./odekakeshimasyo.js | sed s/"\t"//g | tr '\n' ' ' > odekakeshimasyo.min.js

