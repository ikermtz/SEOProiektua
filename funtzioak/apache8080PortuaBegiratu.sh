function apache8080PortuaBegiratu(){

	badago=$(grep "Listen 8080" /etc/apache2/ports.conf)

	if [ -z "$badago" ]
	then
		sed '4iListen 8080' /etc/apache2/ports.conf | sudo tee /etc/apache2/ports.conf > /dev/null

		sudo systemctl restart apache2
	fi;


	ipFiltratugabe=$(ip addr | grep -E "inet .*brd")
	ipIaFiltratua=$(echo ${ipFiltratugabe:9:50})
	ip=$(echo $ipIaFiltratua | cut -d"/" -f1)
	

	firefox "$ip":8080/index.html
}