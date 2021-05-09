#! /usr/bin/bash

###########################################################
#   11) PHPBB3 instalatu.
###########################################################

	
function phpBB3Instalatu(){

	echo "sudadon"
	egoera= `dpkg --get-selections | grep '^phpBB*'`
	egoeraDe= `dpkg --get-selections | grep '^phpBB.*deinstall$'`


	if [ -z "$egoera" ]
	then #hutsik dago egoera aldagaia beraz, ez dago ezer ez, phpBB3 paketerik ez dago
		dialog --backtitle "phpBB3 Instalatu"\
		--title "Instalazioa"\
		--msgbox "PHPBB3 paketea instalatuko da. Sakatu enter jarraitzeko" 10 50

		read 
		#PHPBB3 zip fitxategia deskargatu eta deskonprimatu
		wget https://download.phpbb.com/pub/release/3.3/3.3.3/phpBB-3.3.3.zip 
		unzip phpBB-3.3.3.zip
		#/var/www/ direktorioan "foroak" karpeta sortu eta bertara mugitu phpBB3-ko fitxategi guztiak
		sudo mkdir /var/www/foroak
		sudo mv phpBB3/* /var/www/foroak/
		sudo mv phpBB3/* /var/www/foroak/

		#Ondoren, apache konfiguratu beharko dugu localhost:8080 nabigatzailean jartzean phpBB3 orria ateratzeko.
		sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/phpbb3.conf
		sudo sed -i 's/:80>/:8080>/' /etc/apache2/sites-available/phpbb3.conf #80 portua  zegoen tokian ,8080 jarriko dugu
		sudo sed -i 's/html/foroak/' /etc/apache2/sites-available/phpbb3.conf
		sudo sed -i "29i \n" /etc/apache2/sites-available/phpbb3.conf #lerro zuri bat gehitu 29. lerroan
		sudo sed -i  "29i <Directory /var/www/foroak>\nOptions Indexes FollowSymLinks MultiViews\nAllowOverride All\nOrder allow,deny\nallow from all\n</Directory>" /etc/apache2/sites-available/phpbb3.conf #29. lerroan textua pegatu

		sudo sed -i 's/Listen 80/Listen 80 \nListen 8080/' /etc/apache2/ports.conf
		sudo a2ensite phpbb3.conf

		#apache berrabiarazi
		sudo systemctl reload apache2
		sudo firefox localhost:8080

	else 
		if[ -n "$egoeraDe" ]
		then #ez dago hutsik, paketeak desinstalatuta daude
			dialog --title "phpBB3 Instalatu"\
			--msgbox "PHPBB3 paketea instalatuko da. Sakatu enter jarraitzeko" 10 50

			read 
			#PHPBB3 zip fitxategia deskargatu eta deskonprimatu
			wget https://download.phpbb.com/pub/release/3.3/3.3.3/phpBB-3.3.3.zip 
			unzip phpBB-3.3.3.zip
			#/var/www/ direktorioan "foroak" karpeta sortu eta bertara mugitu phpBB3-ko fitxategi guztiak
			sudo mkdir /var/www/foroak
			sudo mv phpBB3/* /var/www/foroak/
			sudo mv phpBB3/* /var/www/foroak/

			#Ondoren, apache konfiguratu beharko dugu localhost:8080 nabigatzailean jartzean phpBB3 orria ateratzeko.
			sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/phpbb3.conf
			sudo sed -i 's/:80>/:8080>/' /etc/apache2/sites-available/phpbb3.conf #80 portua  zegoen tokian ,8080 jarriko dugu
			sudo sed -i 's/html/foroak/' /etc/apache2/sites-available/phpbb3.conf
			sudo sed -i "29i \n" /etc/apache2/sites-available/phpbb3.conf #lerro zuri bat gehitu 29. lerroan
			sudo sed -i  "29i <Directory /var/www/foroak>\nOptions Indexes FollowSymLinks MultiViews\nAllowOverride All\nOrder allow,deny\nallow from all\n</Directory>" /etc/apache2/sites-available/phpbb3.conf #29. lerroan textua pegatu

			sudo sed -i 's/Listen 80/Listen 80 \nListen 8080/' /etc/apache2/ports.conf
			sudo a2ensite phpbb3.conf

			#apache berrabiarazi
			sudo systemctl reload apache2
			sudo firefox localhost:8080
		else
			dialog --title "PHP Instalatuta"\
			--msgbox "Dagoeneko PHP instalatuta zenuen" 10 50
		fi
	fi
}









#PHPBB3 instalatu eta konfiguratzeko:
#-----------------------------------#


#PHPBB3 zip fitxategia deskargatu eta deskonprimatu
#wget https://download.phpbb.com/pub/release/3.3/3.3.3/phpBB-3.3.3.zip 
#unzip phpBB-3.3.3.zip
#/var/www/ direktorioan "foroak" karpeta sortu eta bertara mugitu phpBB3-ko fitxategi guztiak
#sudo mkdir /var/www/foroak
#sudo mv phpBB3/* /var/www/foroak/

#Ondoren, apache konfiguratu beharko dugu localhost:8080 nabigatzailean jartzean phpBB3 orria ateratzeko.

#konfigurazio fitxategia sortu eta editatu
#sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/phpbb3.conf
#editatu--> sed komandoak fitxategiak terminaletik editatzea ahalbideratzen du
#sudo sed -i 's/:80>/:8080>/' /etc/apache2/sites-available/phpbb3.conf #80 portua  zegoen tokian ,8080 jarriko dugu

#sudo sed -i 's/html/foroak/' /etc/apache2/sites-available/phpbb3.conf

#sudo sed -i "29i \n" /etc/apache2/sites-available/phpbb3.conf #lerro zuri bat gehitu 29. lerroan

#sudo sed -i  "29i <Directory /var/www/foroak>\nOptions Indexes FollowSymLinks MultiViews\nAllowOverride All\nOrder allow,deny\nallow from all\n</Directory>" /etc/apache2/sites-available/phpbb3.conf #29. lerroan textua pegatu

#portuen fitxategian 8080-a entzuten jarri
#sudo sed -i 's/Listen 80/Listen 80 \nListen 8080/' /etc/apache2/ports.conf
#"balioztatu"
#sudo a2ensite phpbb3.conf

#apache berrabiarazi
#sudo systemctl reload apache2
#sudo firefox localhost:8080


#BADAGO
