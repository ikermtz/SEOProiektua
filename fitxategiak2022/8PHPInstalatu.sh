#! /usr/bin/bash  --> Hashtag harriduraren ostean zure bin-aren
#						path-a jarri (zein de ikusteko => which bash)

###########################################################
#   9) PHP Instalatu.                    
###########################################################

#source "$(dirname "$0")/funtzioak/instalatuta.sh"

function phpInstalatu()
{
	dialog --backtitle "PHP Instalatu"\
	 --title "Menu"\
	 --msgbox "PHPren egoera konprobatzen..." 10 50

	#Bi aldagaien PHP-ren paketeak konprobatzeko
	konprobaketa=`dpkg --get-selections | grep '^php*'`
	konprobaketaDe=`dpkg --get-selections | grep '^php.*deinstall$'`

	if [ -z "$konprobaketa" ] #konprobaketa aldagaian dagoen string-aren length 0 bada... (php ez dago instalatuta)
	then	#Hutsik badago => Ez dago PHP paketerik
		dialog --backtitle "PHP Instalatu"\
		 --title "Instalazioa"\
		 --msgbox "PHP paketea instalatuko da. Sakatu enter jarraitzeko." 10 50

		read
		sudo apt-get install php -y > /dev/null

	else	# Hutsik ez badago => Badaude PHP paketeak
		if [ -n "$konprobaketaDe" ] #
		then	# Ez dago hutsik => Pakteak daude baina desinstalatuta
			dialog --title "PHP Instalatu"\
			--msgbox "PHP instalatuko da. Sakatu enter jarraitzeko." 10 50
			read
			sudo apt-get install php -y > /dev/null
		else
			dialog --title "PHP Instalatuta"\
			--msgbox "Dagoeneko PHP instalatuta zenuen" 10 50
		fi
	
	fi
	
	dialog --backtitle "Libapache Instalatu"\
	 --title "Menu"\
	 --msgbox "Libapacheren egoera konprobatzen..." 10 50

	#libapache2-mod-php paketea instalatu
	konprobaketaL=`dpkg --get-selections | grep '^libapache2*'`
	konprobaketaLDe=`dpkg --get-selections | grep '^libapache.*deinstall$'`
	
	if [ -z "$konprobaketaL" ]
	then
		dialog --t
		title "Libapache Instalatu"\
		 --msgbox "Sakatu enter jarraitzeko eta libapache instalatzeko." 10 50

		read # ENTER sakatzean irakurriko du.
		sudo apt-get install libapache2-mod-php -y > /dev/null
		
	else
		if [ -n "$konprobaketaLDe" ] #
		then	# Ez dago hutsik => Pakteak daude baina desinstalatuta
			dialog --title "Libapache Instalatu"\
			--msgbox "Libapache instalatuko da. Sakatu enter jarraitzeko." 10 50
			read
			sudo apt-get install libapache2-mod-php -y > /dev/null
		else
			dialog --title "PHP Instalatuta"\
			--msgbox "Dagoeneko Libapache instalatuta zenuen" 10 50
		fi
	
	fi

	#Konprobazioak
	konprobaketa=`dpkg --get-selections | grep '^php*'`
	konprobaketaDe=`dpkg --get-selections | grep '^php.*deinstall$'`
	
	if [ -n "$konprobaketa" ] # Prozesuaren osteko konprobazioa
	then	#Ez dago hutsik k1
		if [ -n "$konprobaketaDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik k2
			dialog --title "--- PHP ---"\
		 	--msgbox "PHP paketea ez da instalatu. Arazo bat egon da." 10 50
		else	# Hutsik dago k2
			dialog --title "--- PHP ---"\
			--msgbox "PHP paketearen instalazioa amaitu da." 10 50
		fi

	else	#Hutsik dago k1
		dialog --title "--- PHP ---"\
	 	--msgbox "PHP paketea ez da instalatu. Arazo bat egon da." 10 50
	fi
	
	konprobaketaL=`dpkg --get-selections | grep 'libapache2'`
	konprobaketaLDe=`dpkg --get-selections | grep 'libapache.*deinstall$'`
	
	if [ -n "$konprobaketaL" ] # Prozesuaren osteko konprobazioa
	then	#Ez dago hutsik k1
		if [ -n "$konprobaLDe" ]	# -n ren bidez konprobaDe hutsik ez dagoen begiratu
		then	# Ez dago hutsik k2
			dialog --title "--- LibApache ---"\
		 	--msgbox "Libapache paketea ez da instalatu. Arazo bat egon da." 10 50
		else	# Hutsik dago k2
			dialog --title "--- Libpache ---"\
			--msgbox "Libapache paketearen instalazioa amaitu da." 10 50
		fi

	else	#Hutsik dago k1
		dialog --title "--- Apache ---"\
	 	--msgbox "Libapache paketea ez da instalatu. Arazo bat egon da." 10 50
	fi

	#echo -e "Orain apache berrabiaraziko da"

	sudo service apache2 restart > /dev/null
}
