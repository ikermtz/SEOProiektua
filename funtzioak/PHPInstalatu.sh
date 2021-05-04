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

konprobaketa=`sudo aptitude show php | grep "Estado:"`
	konprobaketa2=`echo $konprobaketa | grep "sin"`
	if [ -n "$konprobaketa2" ]
	then 
		echo -e "\nphp paketea instalatuko da"
		echo -e "Sakatu enter jarraitzeko"
		read
		sudo apt install php 
		#sudo apt install php -y
		konprobaketa=`sudo aptitude show php | grep "Estado:"`
		konprobaketa2=`echo $konprobaketa | grep "instalado"`
		
		if [ -n "$konprobaketa2" ]
		then
			echo -e "\nphp paketea instalatu da"
		else
			echo -e "\nphp paketea ez da instalatu"
		fi
	else
		echo -e "\nphp paketea instalatuta dago "
	
	fi
	echo -e "Sakatu enter jarraitzeko eta libapache instalatzeko"
	read
	
	#libapache2-mod-php paketea instalatu
	konprobaketa=`sudo aptitude show libapache2-mod-php | grep "Estado:"`
	konprobaketa2=`echo $konprobaketa | grep "sin"`
	
	if [ -n "$konprobaketa2" ]
	then
		echo -e "libapache2-mod-php paketea instalatuko da"
		echo -e "Sakatu enter jarraitzeko"
		read
		sudo apt install libapache2-mod-php
		konprobaketa=`sudo aptitude show libapache2-mod-php | grep "Estado:"`
		konprobaketa2=`echo $konprobaketa | grep "instalado"`
		if [ -n "$konprobaketa2" ]
		then 
			echo -e "\nlibapache instalatu egin da"
		else
			echo -e "\nlibapache ez da instalatu"
		fi
	else
		echo -e "libapache2-mod-php jada instalatuta daukazu" 
	
	fi
}
