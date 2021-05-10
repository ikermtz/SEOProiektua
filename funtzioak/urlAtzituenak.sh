#! usr/bin/bash

###########################################################
#   16) Apacheren hamar URL atzituenak.
###########################################################


function urlAtzituenak(){
	
	url=`less /var/log/apache2/access.log | grep '.html\|.php' | head -n 10` 
	dialog --backtitle "URL"\
	--title "URL Atzituenak"\
	--msgbox "$url" 40 100
}

