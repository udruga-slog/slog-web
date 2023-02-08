#!/bin/bash
cd "${0%/*}"

for FILE in ../Original/*
do
  convert "../Original/${FILE##*/}" -resize 416 -quality 95 "../Resized/r-${FILE##*/}"
done

for FILE in ../Resized/*
do
  cwebp -q 95 "../Resized/${FILE##*/}" -o "../Webp/${FILE##*/}.webp"
done

for FILE in ../Webp/*
do
  echo "<img src=\"assets/images/album/Webp/${FILE##*/}\" class=\"w-100 rounded mb-4\" alt=\"slika\" />" >> html-out.txt
done

