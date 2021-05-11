#!/bin/bash

function azterketa(){
	entzuten=$(grep "Listen 8080" /etc/apache2/ports.conf)

	if [ -n "$entzuten" ]
	then
		sudo systemctl stop apache2
		sudo rm /etc/apache2/sites-available/foroa.conf #aurretiaz sortutako fitxeroa
		sudo systemctl start apache2
	else
		echo mierda
	fi
}