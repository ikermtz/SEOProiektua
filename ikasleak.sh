#!/bin/bash

	
	less ~/SEO/proiektua/gaizka/ikasleak.txt | sed 's/;/ /g' > proba.txt
	
	awk '{print $1,$4}' ~/SEO/proiektua/gaizka/proba.txt > erabiltzailea.txt

	n=$(wc -l ~/SEO/proiektua/gaizka/erabiltzailea.txt | awk '{print $1}')



for i in $(seq 1 $n);do

lerroa=$(sed -n ${i}p erabiltzailea.txt)

izena=$(echo $lerroa | awk '{print $1}')
password=$(echo $lerroa | awk '{print $2}')
echo " $izena eta password : ${password}"

sudo groupadd maila2
sudo useradd -m -g maila2 "$izena"
echo "$izena:${password}" | sudo chpasswd

done











