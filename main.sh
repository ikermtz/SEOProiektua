#########################################
#			Web Aplikazioa				#
#	SEO Proiektua 2o lauhil. 2021		#
#  Egileak: Martin Amezola				#
#			Andoni Olabarria			#
#			Jon Quintano				#
#			Unai Gonzalez				#
#			Gaizka Zuazo 				#
#										#
#########################################

#Beste fitxategietatik funztzioak inportatu
. ./funtzioak/desinstalazioa.sh
. ./funtzioak/apacheInstalatu.sh
. ./funtzioak/apacheAbiarazi.sh
. ./funtzioak/apache80PortuaBegiratu.sh
. ./funtzioak/irekiIndex.sh
. ./funtzioak/sortuWebPertsonala.sh
. ./funtzioak/sortuWebOstatu.sh
. ./funtzioak/apache8080PortuaBegiratu.sh
. ./funtzioak/PHPInstalatu.sh
. ./funtzioak/PHPTestatu.sh
. ./funtzioak/phpBB3Instalatu.sh
. ./funtzioak/PythonInstalatu.sh
. ./funtzioak/searxHasieratu.sh
. ./funtzioak/searxInstalatu.sh
. ./funtzioak/searxAbiarazi.sh
. ./funtzioak/urlAtzituenak.sh






#Konstanteen definizioa
FITX_AUK_MENU="temp/aukera.txt"

### Programaren Hasiera ###
menuAukerapPal=0

while test $menuAukerapPal -ne 17
do
	#Menua bistaratu
	dialog --backtitle "Web Aplikazioen Instalazioa 2021 - SEO" --title "Web Aplikazioen Instalazioa" \
			--menu "\n¿Zer egin nahi duzu?:" 20 70 20 \
			1 "Desinstalatu eta ezabatu dena."\
			2 "Apache instalatu."\
			3 "APache abiarazi."\
			4 "Apache-ren portua begiratu. (80 portua)"\
			5 "Ireki index.html"\
			6 "Sortu web pertsonala."\
			7 "Web-ostatu birtuala sortu."\
			8 "Apache-ren portua begiratu. (8080 portua)"\
			9 "PHP instalatu."\
			10 "PHP testatu"\
			11 "phpBB3 instalatu"\
			12 "Python ingurune birtuala instalatu"\
			13 "searx erabiltzailea eta ingurune birtuala sortu"\
			14 "searx instalatu"\
			15 "searx abiarazi"\
			16 "Apache-n hamar URL atzituenak"\
			17 "Irten. :)" \
			2> $FITX_AUK_MENU

	if test $? -eq 0
	then
		#Erabiltzaileak aukeratutako aukera atera
		menuAukerapPal=`more $FITX_AUK_MENU`

		#Fitxategi temporala (Erabiltzailearen erantzuna gordetzen duena) ezabatu.
		rm $FITX_AUK_MENU

		#Erabiltzaileak aukeratutakoaren arabera funtzio konkretu bat egin.
		case $menuAukerapPal in
			1) desinstalazioa ;; # Desinstalatu eta ezabatu dena.
			2) apacheInstalatu;;
			3) apacheAbiarazi;;
			4) apache80PortuaBegiratu;;
			5) irekiIndex;;
			6) sortuWebPertsonala;;
			7) sortuWebOstatu;;
			8) apache8080PortuaBegiratu;;
			9) PHPInstalatu ;;
			10) PHPTestatu ;;
			11) phpBB3Instalatu ;;
			12) PythonInstalatu ;;
			13) searxHasieratu ;; # searx erabiltzailea eta ingurune birtuala sortu
			14) searxInstalatu ;;
			15) searxAbiarazi ;;
			16) urlAtzituenak ;; # Apache-n hamar URL atzituenak
			*) ;;
		esac #Aukeratutako futzio konkretuaren amaiera.
	else
		menuAukerapPal=17
	fi

done #ppal buklearen amaiera

echo "Programa amaituta." 
exit 0 #Programaren amaiera.