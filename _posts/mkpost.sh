#!/bin/sh

DATE=$1
TITLE=$2

( cd ../images/$DATE
  mkdir thumbnails
  mogrify -verbose -auto-orient -strip -path thumbnails -thumbnail 10% *.JPG
  mogrify -verbose -auto-orient -strip -thumbnail 50% *.JPG
) 

PICS=$(cd ../images/$DATE; ls *.JPG)
POST=$DATE-$TITLE.markdown

(
echo "---"
echo "layout: post"
echo "title: $2"
echo "---"
echo

for p in $PICS
do
    echo "<a href=\"/images/$DATE/$p\"><img src=\"/images/$DATE/thumbnails/$p\" /></a>"
done
) > $POST

