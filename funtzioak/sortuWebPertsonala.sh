#! usr/bin/bash

###########################################################
#   6) Sortu Web Pertsonala.
###########################################################



function sortuWebPertsonala(){
	sudo cp -r taldea* /var/www/html/

	ipFiltratugabe=$(ip addr | grep -E "inet .*brd")
	ipIaFiltratua=$(echo ${ipFiltratugabe:9:50})
	ip=$(echo $ipIaFiltratua | cut -d"/" -f1)

	firefox "$ip"/taldea.html

}