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

	if [ -n "$konprobatu" ] 
	then
				dialog --backtitle "Apache Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "Apache instalatuko da" 10 50
		# --yesno "Apache ez dago instalatuta, instalatu nahi duzu?" 10 50
		sudo apt install apache2 -y
		echo -e "Hay algo"
		#erantzuna=$?
		#case $erantzuna in
		#	0) sudo apt install apache2 -y;;
		#	1) echo "bale crac";;
		#	255) echo "pos vale sunormal";;
		#esac
	else
		dialog --title "Instalatuta"\
		 --msgbox "Apache instalatuta dago!" 10 50

	fi
	#quintano gitano redaun
}