#!/bin/bash


###########################################################
#   6) PHP TESTEATU
###########################################################

#Aukera hau soilik egin dezakezu Apache instalatuta badago.
#Konprobatu egingo dugu
function PHPTestatu()
{
	konprobaketa=`dpkg --get-selections | grep apache`
	if [ -n "$konprobaketa" ] #aldagaian string-aren luzera 0 ez 	bada..Apache instalatuta egongo da
	then 
		#Aukera hau egiteko firefox instalatuta 
		konprobaketa=`dpkg --get-selections | grep firefox`
		if [ -n "$konprobaketa" ] #firefox instalatuta dagola konprobatzeko
		then 
			#PHP eta libapache2-mod-php instalatuta egon behar da
			konprobaketa=`dpkg --get-selections | grep '^php*'`
			konprobaketa1=`dpkg --get-selections | grep 'libapache2'`
			if [ -n "$konprobaketa" ] && [ -n "$konprobaketa1" ]
			then 
				#Konprobatuko dugu apache martxan badago edo ez
				konprobaketa=`ps -eo comm,etime,user | grep apache`
				#konprobaketa=`systemctl is-active apache2`
				if [ -n "$konprobaketa" ]
				then
					#Agian baita ere konprobatu beharko dugu zein portutik entzuten duen...
					#Konprobatuko dugu test.php fitxategia existitzen den edo ez	
					if [ ! -f /var/www/html/test.php ]
					then
						sudo echo -e "<?php phpinfo(); ?>" > /var/www/html/test.php
						sudo chown www-data /var/www/html/test.php
						sudo chgrp www-data /var/www/html/test.php
					
					fi
					dialog --title "-- PHP TESTEATU --"\
		 			--msgbox "Sakatu enter Firefox irekitzeko" 10 50
					firefox http://localhost:80/test.php
					
				else
					dialog --backtitle ""\
		 		--title "--- PHP TESTEATU ---"\
		 		--msgbox "Ez daukazu Apache aktibatuta" 10 50
					
				
				fi
				
			else
				dialog --title "--- PHP TESTEATU ---"\
		 		--msgbox "PHP edo/eta ez daukazu instalatuta" 10 50
			fi
		else
			dialog --backtitle ""\
		 --title "--- PHP TESTEATU ---"\
		 --msgbox "Firefox instalatuta edukitzea beharrezkoa da aukera hau egikaritzeko" 10 50
		fi
		
		
	else
		dialog --backtitle ""\
		 --title "--- PHP TESTEATU ---"\
		 --msgbox "Apache instalatuta edukitzea behareezkoa da aukera hau egikaritzeko" 10 50
	fi
}

