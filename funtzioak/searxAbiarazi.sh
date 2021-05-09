#!/bin/bash

###########################################################
#   15) SEARX Abiarazi.                   
##########################################################


function searxAbiarazi ()
{
	git clone https://github.com/asciimoo/searx.git > /dev/null
	sed -i 's/ultrasecretkey/1234/g' searx/searx/settings.yml
	sudo python3 setup.py install
	python3 searx/webapp.py > /dev/null

	dialog --backtitle "Searx habiarazi"\
		--title "Menu"\
		--yesno "Searx martxan jarri da 127.0.0.1:8888 portuan. Ireki nahiko zenuke?" 10 50

	response=$?
	case $response in
	   0) firefox 127.0.0.1:8888;;
	esac
}
