#!/bin/bash

###########################################################
#   5) PHP INSTALATU                       
###########################################################

#source "$(dirname "$0")/funtzioak/instalatuta.sh"

function phpInstalatu()
{
#echo "#################### phpInstalatu funtzioa"

#instalatuta php #&> /dev/null
#if [ "$?" = "0" ]; then
#	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
#                --msgbox "PHP INSTALATUKO DA" 10 50
	
#	yes | sudo apt install php 

#	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
#                --msgbox "INSTALATUTA" 10 50
#else
#	dialog --backtitle "TESTU KONPLEXUTASUNA NEURTZEKO WEB APLIKAZIOA" --title "TESTU KONPLEXUTASUNA" \
#                --msgbox "PHP JADANIK INSTALATUTA DAGO" 10 50
#fi

# service apache2 restart &>/dev/null 

	konprobaketa=`dpkg --get-selections | grep '^php*'` # Konprobatuko du ea instalatuta dagoen php. Eta komando
	# honen emaitza konprobaketa aldagaian gordeko du.
	#konprobaketa2=`echo $konprobaketa | grep "sin"` --> Zuazo-k egina, uste dut ez dela behar.
	if [ -z "$konprobaketa" ] #konprobaketa aldagaian dagoen string-aren length 0 bada... (php ez dago instalatuta)
	then 
		dialog --backtitle ""\
		 --title "--- PHP ---"\
		 --msgbox "PHP paketea instalatuko da. Sakatu enter jarraitzeko." 10 50
		#echo -e "\nphp paketea instalatuko da"
		#echo -e "Sakatu enter jarraitzeko"
		read
		sudo apt install php -y
		#sudo apt install php -y
		konprobaketa=`dpkg --get-selections | grep '^php*'` # Konprobatuko du ea instalatuta dagoen php. Eta komando
		# honen emaitza konprobaketa aldagaian gordeko du.
		
		if [ -n "$konprobaketa" ]
		then
			dialog --title "--- PHP ---"\
		 	--msgbox "PHP paketea instalatu egin da." 10 50
			#echo -e "\nphp paketea instalatu da"
		else
			dialog --title "--- PHP ---"\
		 	--msgbox "PHP paketea ez da instalatu. Arazo bat egon da." 10 50
			#echo -e "\nphp paketea ez da instalatu"
		fi
	else
		dialog --title "--- PHP ---"\
		 --msgbox "PHP paketea instalatuta dago!" 10 50
	
	fi
	#dialog --title "--- libapache ---"\
	#	 --msgbox "Konprobatzen ea libapache instalatuta duzun edo ez..." 10 50
	#echo -e "Sakatu enter jarraitzeko eta libapache instalatzeko"
	
	
	#libapache2-mod-php paketea instalatu
	konprobaketa=`dpkg --get-selections | grep 'libapache2'`
	#konprobaketa=`sudo aptitude show libapache2-mod-php | grep ":"`
	#konprobaketa2=`echo $konprobaketa | grep "sin"`
	
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
}
