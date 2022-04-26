#########################################
#			Web Aplikazioa				#
#	SEO Proiektua 2. lauhil. 2022				#
#  	Egileak: Iker Martinez-Ayo				#
#		 Imanol Ganzedo					#
#		 Iker Mugika					#
#		 Gorka del Rio					#
#								#
#########################################

#Beste fitxategietatik funztzioak inportatu#
. ./fitxategiak2022/1apacheInstalatu.sh
. ./fitxategiak2022/2apacheAbiarazi.sh
. ./fitxategiak2022/3apache80PortuaBegiratu.sh
. ./fitxategiak2022/4irekiIndex.sh
. ./fitxategiak2022/5sortuWebPertsonala.sh
. ./fitxategiak2022/6sortuWebOstatu.sh
. ./fitxategiak2022/7virtualHostCheck.sh
. ./fitxategiak2022/8PHPInstalatu.sh
. ./fitxategiak2022/9PHPTestatu.sh
. ./fitxategiak2022/10pythonInguruneVirtualaSortu.sh
. ./fitxategiak2022/11ubuntuPaketeakInsatalatu.sh
. ./fitxategiak2022/12pythonLiburutegiak.sh
. ./fitxategiak2022/13LagunTestInstalatu.sh
. ./fitxategiak2022/14jabetzaWWW.sh
. ./fitxategiak2022/15checkWebprocess.sh
. ./fitxategiak2022/16aplikazioaBistaratu.sh
. ./fitxategiak2022/17apacheLog.sh
. ./fitxategiak2022/18.sh
. ./fitxategiak2022/19sshSaiakeraKontrola.sh
. ./fitxategiak2022/20irten.sh




#Konstanteen definizioa
FITX_AUK_MENU="temp/aukerak"

### Programaren Hasiera ###
menuAukerapPal=0

while test $menuAukerapPal -ne 22
do
	#Menua bistaratu	
	dialog --backtitle "Web Aplikazioen Instalazioa 2021 - SEO" --title "Web Aplikazioen Instalazioa" \
			--menu "\n¿Zer egin nahi duzu?:" 20 70 20 \
			1 "Desinstalatu eta ezabatu dena."\
			2 "Apache instalatu."\
			3 "Apache abiarazi."\
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
			17 ":)" \
			18 ""\
			19 ""\
			20 "azterketa"\
			21 ""\
			22 "Irten"\
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
			4) apache80PortuaBegiratu ;;
			5) irekiIndex;;
			6) sortuWebPertsonala ;;
			7) sortuWebOstatu ;;
			8) apache8080PortuaBegiratu;;
			9) phpInstalatu ;;
			10) PHPTestatu ;;
			11) phpBB3Instalatu;;
			12) PythonInstalatu ;;
			13) searxHasieratu ;; # searx erabiltzailea eta ingurune birtuala sortu
			14) searxInstalatu ;;
			15) searxAbiarazi ;;
			16) urlAtzituenak ;; # Apache-n hamar URL atzituenak
			17) ;;
			18) ;;
			19) ;;
			20) azterketa ;;
			21) ;;
			*) ;;
		esac #Aukeratutako futzio konkretuaren amaiera.
	else
		menuAukerapPal=17
	fi

done #ppal buklearen amaiera

echo "Programa amaituta." 
clear
exit 0 #Programaren amaiera.
