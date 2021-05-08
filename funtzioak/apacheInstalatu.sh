#konprobatu(){
#	egoera=$(dpkg --get-selections | grep apache)
#
#
#
#	if [ -n "$egoera" ]
#	then #[["$egoera" == *"install"* ]]
#		echo 0
#	else 
#		echo 1
#	fi;
#
#}

function apacheInstalatu(){
	dialog --backtitle "Apache Instalatu"\
	 --title "Menu"\
	 --msgbox "Apacheren egoera konprobatzen..." 10 50

	#dpkg-ren bidez paketeak begriratuko ditugu, grep-ekin flitratuz. Hau, konpr aldagaietan gordez
	konprobatu=`dpkg --get-selections | grep '^apache*'`
	konprobaDe=`dpkg --get-selections | grep '^apache.*deinstall$'`
	konpro01=0
	
	if [ -z "$konprobatu" ] # -z ren bidez konprobatu hutsa den bergiratzen da
	then	# Hutsik Badago => Ez dago apache paketerik
		dialog --backtitle "Apache Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "Apache instalatuko da. Sakatu enter jarraitzeko." 10 50
		# --yesno "Apache ez dago instalatuta, instalatu nahi duzu?" 10 50
		read
		sudo apt install apache2 -y

	else	# Hutsik ez badago => Badaude apache paketeak
		if [ -n "$konprobaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsikn => Paketeak daude baina desinstalatuta
			dialog --title "Apache Instalatu"\
		 	--msgbox "Apache instalatuko da. Sakatu enter jarraitzeko." 10 50
			read 
			sudo apt install apache2 -y	
		else
			dialog --title "Apache Instalatuta"\
		 	--msgbox "Dagoeneko Apache instalatuta zenuen" 10 50
		fi


	fi

	#Amaierako konprobazioak, ea instalazioak ondo joan diren
	konprobatu=`dpkg --get-selections | grep '^apache*'`
	konprobaDe=`dpkg --get-selections | grep '^apache.*deinstall$'`
	if [ -z "$konprobaketa" ] # Prozesuaren osteko konprobazioa
	then	#Ez dago hutsik k1
		if [ -n "$konprobaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik k2
			dialog --title "--- Apache ---"\
		 	--msgbox "Apache2 paketea ez da instalatu. Arazo bat egon da." 10 50
		else	# Hutsik dago k2
			dialog --title "--- Apache ---"\
			--msgbox "Apache2 paketea ondo instalatu da." 10 50
		fi

	else	#Hutsik dago k1
		dialog --title "--- Apache ---"\
	 	--msgbox "Apache2 paketea ez da instalatu.vxcv Arazo bat egon da." 10 50
	fi

}