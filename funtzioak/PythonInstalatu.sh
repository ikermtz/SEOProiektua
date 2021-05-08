#!/bin/bash




###########################################################
#   Python ingurune birtual sortu
###########################################################

function PythonInstalatu()
{

	#konprobatu behar dugu virtualenv instalatuta dagoen edo ez
	konprobaketa=`dpkg --get-selections | grep '^.*virtualenv*'`
	konprobaDe=`dpkg --get-selections | grep '^.*virtualenv.*deinstall$'`
	
	if [ -z "$konprobaketa" ] #ez dagola instalatuta
	then 
		dialog --backtitle "Python Virtualenv Instalatu"\
		 --title "--- PYTHON ---"\
		 --msgbox "Python paketea instalatuko da. Sakatu enter jarraitzeko" 10 50
		 
		 read
		 sudo apt-get install virtualenv -y > /dev/null
		
	else
		if [ -n "$konprobaDe" ]
		then
			dialog --title "Python Instalatu"\
		 	--msgbox "Python paketea instalatuko da. Sakatu enter jarraitzeko." 10 50
			read
			sudo apt-get install virtualenv -y > /dev/null
		else
			dialog --title "Python Instalatuta"\
		 	--msgbox "Python paketea instalatuta zenuen" 10 50
		
		fi
	fi
	
	#python-virtualenv instalatu beharrezkoa izanez gero
	#:)
	
	
	
	konprobaketa=`dpkg --get-selections | grep '^.*virtualenv*'`
	konprobaDe=`dpkg --get-selections | grep '^.*virtualenv.*deinstall$'`
	if [ -z "$konprobaketa" ]
	then 
		if [ -n "$konprobaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik k2
			dialog --title "--- Python ---"\
		 	--msgbox "Pythhon paketea ez da instalatu. Arazo bat egon da." 10 50
		else	# Hutsik dago k2
			dialog --title "--- Python ---"\
			--msgbox "Python paketea ondo instalatu da." 10 50
		fi
	else
		dialog --title "---  Python ---"\
		--msgbox "Python pakete ez da instalatu. Arazo bat egon da." 10 50
	fi 
	
	#if [ ! -f /var/www/html/pythonBirtual ]
	#then
	
	
		
	
	
	#fi
	
	
	#Python3-rako ingurune birtual bat sortu
	#sudo virtualenv --python=python3 /var/local/searx &> /dev/null
	
	












}
