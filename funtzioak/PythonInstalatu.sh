#!/bin/bash




###########################################################
#   Python ingurune birtual sortu
###########################################################

function PythonInstalatu()
{

	#konprobatu behar dugu virtualenv instalatuta dagoen edo ez
	konprobaketa=`dpkg --get-selections | grep virtualenv`
	
	if [ -z "$konprobaketa" ] #ez dagola instalatuta
	then 
		dialog --backtitle ""\
		 --title "--- PYTHON ---"\
		 --msgbox "Python paketea instalatuko da. Sakatu enter jarraitzeko" 10 50
		 
		 read
		 sudo apt-get install virtualenv -y > /dev/null
		
		konprobaketa=`dpkg --get-selections | grep virtualenv` 
		if [ -n "$konprobaketa" ]
		then
			dialog --backtitle ""\
		 --title "--- PYTHON ---"\
		 --msgbox "Python paketea instalatu da." 10 50
		else
			dialog --backtitle ""\
		 --title "--- PYTHON ---"\
		 --msgbox "Python paketea ez da instalatu." 10 50
		
		fi
	fi
	
	#python-virtualenv instalatu beharrezkoa izanez gero
	#:)
	
	
	konprobaketa=`dpkg --get-selections | grep 'python3-virtualenv'`
	
	if [ -z "$konprobaketa" ]
	then 
	
		dialog --backtitle ""\
		 --title "--- PYTHON ---"\
		 --msgbox "Python3-virtualenv paketea instalatuko da. Sakatu enter jarraitzeko" 10 50
		 
		 read
		 sudo apt-get install python3-virtualenv -y > /dev/null
		
		konprobaketa=`dpkg --get-selections | grep 'python3-virtualenv'` 
		if [ -n "$konprobaketa" ]
		then
			dialog --backtitle ""\
		 --title "--- PYTHON ---"\
		 --msgbox "Python-virtualenv paketea instalatu da." 10 50
		else
			dialog --backtitle ""\
		 --title "--- PYTHON ---"\
		 --msgbox "Python-virtaulenv paketea ez da instalatu." 10 50
		
		fi
		
	fi 
	
	#if [ ! -f /var/www/html/pythonBirtual ]
	#then
	
	
		
	
	
	#fi
	
	
	#Python3-rako ingurune birtual bat sortu
	#sudo virtualenv --python=python3 /var/local/searx &> /dev/null
	
	












}
