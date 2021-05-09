#!/bin/bash

###########################################################
#   14) SEARX Instalatu.                    
##########################################################


function searxInstalatu ()
{
	dialog --backtitle "Searx Instalatu"\
		--title "Menu"\
		--msgbox "Searx-en egoera konprobatzen..." 10 50

	konprobaketa=`dpkg --get-selections | grep '^searx'`
	konprobaDe=`dpkg --get-selections | grep '^searx.*deinstall$'`
	# Konprobaketa aldagaian gordetzen da komando honen emaitza.


	if [ -z "$konprobaketa" ] # konprobaketa aldagaian String-a 0 luzeera badu...
	then 
		# Hemen sartu bada, esan nahi du ez dagoela instalatuta.

		dialog --backtitle "Searx Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "SEARX paketea instalatuko da. Sakatu enter jarraitzeko." 10 50

		read
		sudo apt-get install searx -y > /dev/null


	else
		if [ -n "$konprobaDe" ]
		then
			dialog --title "Searx Instalatu"\
			--msgbox "Searx instalatuko da. Sakatu enter jarraitzeko." 10 50
			read
			sudo apt-get install searx -y > /dev/null
		else
			dialog --title "Searx Instalatuta"\
			--msgbox "Dagoeneko Searx instalatuta zenuen" 10 50
		fi
	fi

	#Amaierako konprobazioak
	konprobaketa=`dpkg --get-selections | grep '^searx'`
	konprobaDe=`dpkg --get-selections | grep '^searx.*deinstall$'`
	if [ -n "$konprobaketa" ] # Prozesuaren osteko konprobazioa
	then	#Ez dago hutsik k1
		if [ -n "$konprobaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik k2
			dialog --title "--- Searx ---"\
		 	--msgbox "SEARX paketea ez da instalatu. Arazo bat egon da." 10 50
		else	# Hutsik dago k2
			dialog --title "--- Searx ---"\
			--msgbox "SEARX paketeren instalazio prozesua amaitu da." 10 50
		fi

	else	#Hutsik dago k1
		dialog --title "--- Searx ---"\
	 	--msgbox "SEARX paketea ez da instalatu. Arazo bat egon da." 10 50
	fi
}