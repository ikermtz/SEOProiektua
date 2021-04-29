#########################################
#			Web Aplikazioa				#
#	SEO Proiektua 2o lauhil. 2021		#
#  Egileak: Martin Amezola				#
#			Andoni Olabarria			#
#			Jon Quintano				#
#			Unai Gonzalez				#
#			Gaizka Zuazo 				#
#										#
#########################################


#Importar funciones de otros ficheros
#. ./funciones/realizarCopiaAgenda.sh
#. ./funciones/vaciarAgenda.sh
#. ./funciones/despedirse.sh
#. ./funciones/pedirAnadirContacto.sh
#. ./funciones/eliminar.sh
#. ./funciones/existe.sh
#. ./funciones/modificarContacto.sh
#. ./funciones/verTodosContactos.sh
#. ./funciones/mostrarContacto.sh

#Konstanteen definizioa
#FICH_AUK_MENU="temp/aukera.txt"

### Comienzo del programa ###
opcionMenuPpal=0

while test $opcionMenuPpal -ne 17
do
	#Menua bistaratu
	dialog --backtitle "Web Aplikazioen Instalazioa 2021 - SEO" --title "Web Aplikazioen Instalazioa" \
			--menu "\n¿Zer egin nahi duzu?:" 20 70 20 \
			1 "Desinstalatu eta ezabatu dena."\
			2 "Apache instalatu."\
			3 "APache abiarazi."\
			4 "Apache-ren portua begiratu."\
			5 "Ireki index.html"\
			6 "Sortu web pertsonala."\
			7 "Web-ostatu birtuala sortu."\
			8 "Apache-ren portua begiratu."\
			9 "PHP instalatu."\
			10 "PHP testatu"\
			11 "phpBB3 instalatu"\
			12 "Python ingurune birtuala instalatu"\
			13 "searx erabiltzailea eta ingurune birtuala sortu"\
			14 "searx instalatu"\
			15 "searx abiarazi"\
			16 "Apache-n hamar URL atzituenak"\
			17 "Irten. :)" \
			2> $FICH_AUK_MENU

	if test $? -eq 0
	then
		#Extraer opcion marcada por el usuario
		opcionMenuPpal=`more $FICH_AUK_MENU`

		#Borrar el fichero temporal con la respuesta del usuario
		rm $FICH_AUK_MENU

		#Realizar accion especifica en base a la eleccion del usuario
		case $opcionMenuPpal in
			1) pedirContacto;;
			2) eliminarContactoUsuario;;
			3) mostrarContacto;;
			4) modificarContacto;;
			5) realizarCopia;;
			6) vaciarAgenda;;
			7) verTodosContactos;;
			8) despedirse;;
			*) ;;
		esac #Fin seleccion de accion especifica del usuario
	else
		opcionMenuPpal=17
	fi

done #Fin del bucle ppal

echo "Programa amaituta." #Fin del programa
exit 0 #Fin del programa