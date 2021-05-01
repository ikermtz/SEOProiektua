konprobatu(){
	egoera=$(dpkg --get-selections | grep apache)



	if [ -n "$egoera" ]
	then #[["$egoera" == *"install"* ]]
		echo 0
	else 
		echo 1
	fi;

}

apacheInstalatu(){
	dialog --backtitle "Apache Instalatu"\
	 --title "Menu"\
	 --msgbox "Apacheren egoera konprobatzen..." 10 50


	echo "kaixo2"
	ins=$(konprobatu)
	echo "$ins"

	if [ "$ins" == 0 ] 
	then
		dialog --backtitle "Instalatuta"\
		 --title "Bobobobo"\
		 --msgbox "Apache instalatuta dago!" 10 50
	else
		dialog --backtitle "Apache Instalatu"\
		 --title "Instalazioa"\
		 --yesno "Apache ez dago instalatuta, instalatu nahi duzu?" 10 50

		erantzuna=$?
		case $erantzuna in
			0) sudo apt install apache2 -y;;
			1) echo "bale crac";;
			255) echo "pos vale sunormal";;
		esac
	fi;

}