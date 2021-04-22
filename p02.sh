#!/bin/bash
#Adrià Escarceller i Cid



if (( $EUID != 0 )) 
	then echo "El scrip se tene que ejecutar con permisos de Administrador"
	exit 1
	
	else
	
	function opcion(){
	
		echo -n 'Quieres continuar? (S - N) '
		read op
		
		if [[ $op == "S" ]]
		then
			main
		fi
		
		if [[ $op == "N" ]]
		then
			exit 5
		fi
	
	}
	
	function main(){
	clear
	
	echo -n "Escriber la carpeta a crear dentro de /var:"
	read dir
	
	if [ -d /var/$dir ]
	then
		cp /etc/sshd/sshd_config /var/$dir
		cp /etc/cups/cupsd.conf /var/$dir
		echo "Ficheros copiados"
		opcio
	else
		echo "La carpeta no existe"
	fi
	}
	
	main
fi
