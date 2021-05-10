#!/bin/bash

###########################################################
#   15) SEARX Abiarazi.                   
##########################################################


function searxAbiarazi ()
{
	git clone https://github.com/asciimoo/searx.git > /dev/null &
	pid=$!
	wait "$pid"

	sed -i 's/ultrasecretkey/1234/g' searx/searx/settings.yml > /dev/null

	sleep 1s

	cd ./searx

	make install > /dev/null


	python3 searx/setup.py install &
	ID=$!
	wait "$ID"

	python3 searx/webapp.py 

	dialog --backtitle "Searx habiarazi"\
		--title "Menu"\
		--yesno "Searx martxan jarri da 127.0.0.1:8888 portuan. Ireki nahiko zenuke?" 10 50

	response=$?
	case $response in
	   0) firefox 127.0.0.1:8888;;
	esac


}
