#! usr/bin/bash

###########################################################
#   2) Apache Instalatu.  
###########################################################


function apacheInstalatu(){
	dialog --backtitle "Apache Instalatu"\
	 --title "Menu"\
	 --msgbox "Apacheren egoera konprobatzen..." 10 50

	#dpkg-ren bidez paketeak begriratuko ditugu, grep-ekin flitratuz. Hau, konpr aldagaietan gordez
	konprobatu=`dpkg --get-selections | grep '^apache*'`
	konprobaDe=`dpkg --get-selections | grep '^apache.*deinstall$'`
	#konpro01=0
	
	if [ -z "$konprobatu" ] # -z ren bidez konprobatu hutsa den bergiratzen da
	then	# Hutsik Badago => Ez dago apache paketerik
		dialog --backtitle "Apache Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "Apache instalatuko da. Sakatu enter jarraitzeko." 10 50
		# --yesno "Apache ez dago instalatuta, instalatu nahi duzu?" 10 50
		read
		sudo apt-get install apache2 -y > /dev/null

	else	# Hutsik ez badago => Badaude apache paketeak
		if [ -n "$konprobaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik => Paketeak daude baina desinstalatuta
			dialog --title "Apache Instalatu"\
		 	--msgbox "Apache instalatuko da. Sakatu enter jarraitzeko." 10 50
			read 
			sudo apt-get install apache2 -y > /dev/null
		else
			dialog --title "Apache Instalatuta"\
		 	--msgbox "Dagoeneko Apache instalatuta zenuen" 10 50
		fi


	fi

	#Amaierako konprobazioak, ea instalazioak ondo joan diren
	konprobatu=`dpkg --get-selections | grep '^apache*'`
	konprobaDe=`dpkg --get-selections | grep '^apache.*deinstall$'`
	if [ -n "$konprobatu" ] # Prozesuaren osteko konprobazioa
	then	#Ez dago hutsik k1
		if [ -n "$konprobaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik k2
			dialog --title "--- Apache ---"\
		 	--msgbox "Apache2 paketea ez da instalatu. Arazo bat egon da." 10 50
		else	# Hutsik dago k2
			dialog --title "--- Apache ---"\
			--msgbox "Apache2 paketeatearen instalazioa amaitu da." 10 50
		fi

	else	#Hutsik dago k1
		dialog --title "--- Apache ---"\
	 	--msgbox "Apache2 paketea ez da instalatu. Arazo bat egon da." 10 50
	fi

}