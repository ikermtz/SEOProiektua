#!/bin/bash

###########################################################
#   14) SEARX INSTALATU                     
##########################################################


function searxInstalatu ()
{
	konprobaketa=`dpkg --get-selections | grep '^searx'`
	# Konprobaketa aldagaian gordetzen da komando honen emaitza.


	if [ -z "$konprobaketa" ] # konprobaketa aldagaian String-a 0 luzeera badu...
	then 
		# Hemen sartu bada, esan nahi du ez dagoela instalatuta.

		dialog --backtitle ""\
		 --title "--- SEARX ---"\
		 --msgbox "SEARX paketea instalatuko da. Sakatu enter jarraitzeko." 10 50

		read
		sudo apt install searx -y

		# instalatu eta gero berriro konprobatzen dugu ea instalatu den ala ez
		# komando berdina egiten
		konprobaketa=`dpkg --get-selections | grep '^searx'`

		if [ -n "$konprobaketa" ] # konprobaketa aldagaian String-a luzeera > 0 bada...
		then 
		# Hemen sartu bada, esan nahi du instalatu dela.

		dialog --title "--- SEARX ---"\
		 --msgbox "SEARX paketea instalatu da."  10 50

	else
		dialog --title "--- SEARX ---"\
		 --msgbox "SEARX paketea instalatzean arazo bat egon da." 10 50
	fi

	else
		dialog --title "--- SEARX ---"\
		 --msgbox "SEARX paketea instalatuta dago!" 10 50
	fi
}