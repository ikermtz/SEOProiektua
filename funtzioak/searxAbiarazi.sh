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


	sudo python3 ./setup.py install > /dev/null &
	ID=$!
	wait "$ID"

	dialog --backtitle "Searx habiarazi"\
		--title "Menu"\
		--yesno "Searx martxan jarri da 127.0.0.1:8888 portuan. Ireki nahiko zenuke?" 10 50


	response=$?
	case $response in
	   0) barruan;;
	esac


}

function barruan(){

	sudo python3 searx/webapp.py &> /dev/null &
	firefox 127.0.0.1:8888
}
