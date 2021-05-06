#! usr/bin/bash

###########################################################
#   1) Dena Desinstalatu               
###########################################################

#source "$(dirname "$0")/funtzioak/instalatuta.sh"


#Desinstalatu PHP,PHPbb3, Apache, Searx, Python


function desinstalazioa(){

	dialog --backtitle ""\
		--title "Desinstalazioa"\
		--msgbox "Sakatu enter paketak kentzeko" 10 50

	read

	sudo apt-get remove apache2* -y
	dialog --backtitle ""\
		--title "Apache2"\
		--msgbox "Apacheko paketak desinstalatu dira" 10 50
	read




	dialog --backtitle ""\
		--title "Sakatu"\
		--msgbox "Hemen komandoka joango ziren" 10 50

}