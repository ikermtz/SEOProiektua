#! usr/bin/bash

###########################################################
#   4) Apacheren 80 portua begiratu.
###########################################################



function apache80PortuaBegiratu(){
	begiratua=$(sudo netstat -anp | grep -E '80.*apache')

	if [ -n begiratua ]
	then
		dialog --backtitle "Apache portuan"\
	 	 --title "Apache portuan" \
	 	 --msgbox "Apache 80 portura begira dago!" 10 20
	else
		dialog --backtitle "Apache ez dago"\
	 	 --title "Apache ez dago" \
	 	 --msgbox "Apache ez dago 80 portura begira!" 10 20
	fi;

}