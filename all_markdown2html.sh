#/bin/bash

cd `dirname $0`
ls *.md | while read file; do echo $file;ruby markdown2html.rb $file > `basename $file .md`.html; done;
