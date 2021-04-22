#!/bin/bash
#Adrià Escarceller i Cid

clear

if (( $EUID != 0 ))
then
	echo "El scrip se tene que ejecutar con permisos de Administrador"
	exit 1
fi

cat /etc/fstab | grep '^UUID=' | cut -d " " -f 1
awk 'BEGIN {count=0;} /^UUID=/ {count+=1;} END {printf "%d UUIDs trobats\n",count;}' /etc/fstab

exit 0
clear
