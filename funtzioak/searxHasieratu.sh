#!/bin/bash

###########################################################
#   13) SEARX Hasieratu. (Erabiltzailea eta ingurune birtuala sortu.)               
##########################################################


function searxHasieratu ()
{

	dialog --title "SEARX"\
		 --msgbox "Sakatu ENTER Searx hasieratzeko." 10 50


	read # Itxaron erabiltzaileak enter eman arte.

	sudo searx-run
}
