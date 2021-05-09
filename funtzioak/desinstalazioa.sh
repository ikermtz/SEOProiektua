#! usr/bin/bash

###########################################################
#   1) Desinstalatu eta ezabatu dena.   
###########################################################

#source "$(dirname "$0")/funtzioak/instalatuta.sh"


#Desinstalatu PHP,PHPbb3, Apache, Searx, Python


function desinstalazioa(){

	dialog --backtitle ""\
		--title "Desinstalazioa"\
		--msgbox "Sakatu enter paketeak kentzeko" 10 50

	read

	sudo apt-get purge libapache2 -y > /dev/null
	sudo apt-get purge php* -y > /dev/null
	dialog --backtitle ""\
		--title "PHP"\
		--msgbox "PHPko paketeak desinstalatu dira" 10 50
	read

	#sudo apt-get remove  -y
	dialog --backtitle ""\
		--title "PHPbb3"\
		--msgbox "PHPbb3ko paketeak desinstalatu dira" 10 50
	read

	sudo apt-get remove apache2* -y > /dev/null
	dialog --backtitle ""\
		--title "Apache2"\
		--msgbox "Apacheko paketeak desinstalatu dira" 10 50
	read

	sudo apt-get purge searx -y > /dev/null
	dialog --backtitle ""\
		--title "Searx"\
		--msgbox "Searxeko paketeak desinstalatu dira" 10 50
	read

	sudo apt-get remove --auto-remove python3-virtualenv -y > /dev/null #Konprobatuta desins
	dialog --backtitle ""\
		--title "Python3 eta Virtualenv"\
		--msgbox "Python ingurune birtuala desinstalatu da" 10 50
	read


	#/etc-ko fitxategiak ezabatu
	#/var/www-ko fitxatgiak ezabatu
}