#! usr/bin/bash

###########################################################
#   5) Ireki index.html
###########################################################




function irekiIndex(){
	ipFiltratugabe=$(ip addr | grep -E "inet .*brd")
	echo $ipFiltratugabe
	ipIaFiltratua=$(echo ${ipFiltratugabe:9:50})
	echo $ipIaFiltratua
	ip=$(echo $ipIaFiltratua | cut -d"/" -f1)
	

	firefox "$ip"/index.html
}