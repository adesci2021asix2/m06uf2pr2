#!/bin/bash
#Adrià Escarceller i Cid

if (( $EUID != 0 )) 
	then echo "El scrip se tene que ejecutar con permisos de Administrador"
	exit 1
	
	else

function correo {
	clear
	REGEX='^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$'
	RUTA="/etc/blackmail.list"
	
	echo -n "Escribe tu correo: "
	read mail
	
if [[ $mail =~ $REGEX ]]
	then
		
	if [ -f $RUTA ]
	then
		echo $mail >> $RUTA
	else
		sudo touch $RUTA
		echo $mail >> $RUTA
	fi	
exit 0
	
	else
		echo "El mail no es correcto."
		exit 5
	fi
	
	}


correo
