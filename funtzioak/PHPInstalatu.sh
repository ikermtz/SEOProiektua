#! /usr/bin/bash  --> Hashtag harridurareb ostean zure bin-aren
#						path-a jarri (zein de ikusteko => which bash)

###########################################################
#   5) PHP INSTALATU                       
###########################################################
#gonalo
#source "$(dirname "$0")/funtzioak/instalatuta.sh"

function phpInstalatu()
{
	#Bi aldagaien PHP-ren paketeak konprobatzeko
	konprobaketa=`dpkg --get-selections | grep '^php*'`
	konprobaketaDe=`dpkg --get-selections | grep '^php.*deinstall$'`

	if [ -z "$konprobaketa" ] #konprobaketa aldagaian dagoen string-aren length 0 bada... (php ez dago instalatuta)
	then	#Hutsik badago => Ez dago PHP paketerik
		dialog --backtitle "PHP Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "PHP paketea instalatuko da. Sakatu enter jarraitzeko." 10 50

		read
		sudo apt install php -y

	else	# Hutsik ez badago => Badaude PHP paketeak
		if [ -n "$konprobaketaDe" ] #
		then
			dialog --
	
	fi

	konprobaketa=`dpkg --get-selections | grep '^php*'` # Konprobatuko du ea instalatuta dagoen php. Eta komando
	# honen emaitza konprobaketa aldagaian gordeko du.
	if [ -n "$konprobaketa" ]
	then
		dialog --title "--- PHP ---"\
	 	--msgbox "PHP paketea instalatu egin da." 10 50
			
	else
		dialog --title "--- PHP ---"\
	 	--msgbox "PHP paketea ez da instalatu. Arazo bat egon da." 10 50
		
	fi

	
	
	#libapache2-mod-php paketea instalatu
	konprobaketaL=`dpkg --get-selections | grep 'libapache2'`
	konprobaketaLDe=`dpkg --get-selections | grep 'libapache.*deinstall$'`
	
	if [ -z "$konprobaketa" ]
	then
		dialog --title "-- libapache --"\
		 --msgbox "Sakatu enter jarraitzeko eta libapache instalatzeko." 10 50
		
		#echo -e "libapache2-mod-php paketea instalatuko da"
		#echo -e "Sakatu enter jarraitzeko"
		read # ENTER sakatzean irakurriko du.
		sudo apt install libapache2-mod-php
		konprobaketa=`dpkg --get-selections | grep libapache2-mod-php`

		if [ -n "$konprobaketa" ]
		then 
			dialog --title "-- libapache --"\
		 	--msgbox "libapache instalatu egin da. " 10 50
			#echo -e "\nlibapache instalatu egin da"
		else
			dialog --title "-- libapache --"\
		 	--msgbox "libapache ez da instalatu, arazo bat egon da. " 10 50
			#echo -e "\nlibapache ez da instalatu"
		fi
	else
		dialog --title "-- libapache --"\
		 --msgbox "libapache2-mod-php jada instalatuta daukazu." 10 50
		#echo -e "libapache2-mod-php jada instalatuta daukazu" 
	
	fi
	echo -e "Orain apache berrabiaraziko da"
	
	
	
	sudo service apache2 restart
}
