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
	#echo "kaixo2"
	#ins=$(konprobatu)
	#echo "$ins"
	konprobatu =`dpkg --get-selections | grep '^apache*'`
	konprobaDe =`dpkg --get-selections | grep '^apache.*deinstall$'`
	#quintano gitano redaun
	if [ -z "$konprobatu" ] # -z comprueba si el tamaño es 0 // -n si no es 0
	then
		dialog --backtitle "Apache Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "Apache instalatuko da" 10 50
		# --yesno "Apache ez dago instalatuta, instalatu nahi duzu?" 10 50
		read
		sudo apt install apache2 -y
		#erantzuna=$?
		#case $erantzuna in
		#	0) sudo apt install apache2 -y;;
		#	1) echo "bale crac";;
		#	255) echo "pos vale sunormal";;
		#esac
	else
		if [ -z "$konprobaDe" ]
		then
			dialog --title "Instalatuta"\
		 --msgbox "Apache instalatuta dago!" 10 50
		else
			dialog --title "Apache Instalatu"\
		 --msgbox "Apache instalatuko da!" 10 50
			read 
			sudo apt install apache2 -y	
		fi
	fi

	konprobatu =`dpkg --get-selections | grep '^apache*'`
	konprobaDe =`dpkg --get-selections | grep '^apache.*deinstall$'`
	if [ -n "$konprobaketa" ] # Prozesuaren osteko konprobazioa
		then
			dialog --title "--- Apache ---"\
		 	--msgbox "Apache2 paketea ez da instalatu. Arazo bat egon da." 10 50
			
		else
			dialog --title "--- Apache ---"\
		 	--msgbox "Apache2 paketea instalatu egin da." 10 50
	fi

}