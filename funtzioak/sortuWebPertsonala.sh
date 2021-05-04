function sortuWebPertsonala(){
	sudo cp -r taldea* /var/www/html/

	ipFiltratugabe=$(ip addr | grep -E "inet .*brd")
	echo $ipFiltratugabe
	ipIaFiltratua=$(echo ${ipFiltratugabe:9:50})
	echo $ipIaFiltratua
	ip=$(echo $ipIaFiltratua | cut -d"/" -f1)

	firefox "$ip"/taldea.html

}