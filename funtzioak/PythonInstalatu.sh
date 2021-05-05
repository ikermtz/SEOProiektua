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
		 sudo apt-get install virtualenv -y
		
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













}
