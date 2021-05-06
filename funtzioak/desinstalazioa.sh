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

	#sudo apt-get remove  -y
	dialog --backtitle ""\
		--title "PHP"\
		--msgbox "PHPko paketak desinstalatu dira" 10 50
	read

	#sudo apt-get remove  -y
	dialog --backtitle ""\
		--title "PHPbb3"\
		--msgbox "PHPbb3ko paketak desinstalatu dira" 10 50
	read

	sudo apt-get remove apache2* -y
	dialog --backtitle ""\
		--title "Apache2"\
		--msgbox "Apacheko paketak desinstalatu dira" 10 50
	read

	#sudo apt-get remove  -y
	dialog --backtitle ""\
		--title "Searx"\
		--msgbox "Searxeko paketak desinstalatu dira" 10 50
	read

	sudo apt-get remove --auto-remove python3-virtualenv -y #Konprobatuta desins
	dialog --backtitle ""\
		--title "Python3 eta Virtualenv"\
		--msgbox "Python ingurune birtuala desinstalatu da" 10 50
	read


	#/etc-ko fitxategiak ezabatu
	#/var/www-ko fitxatgiak ezabatu
}