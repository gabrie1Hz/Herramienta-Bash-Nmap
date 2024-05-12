#!/bin/bash

# Logo de bienvenida
echo "
       _      _  _   _   _____                     
 _ __ / |_ __| || | | |_|___ / ___  ___ __ _ _ __  
| '_ \| | '__| || |_| __| |_ \/ __|/ __/ _\` | '_ \ 
| |_) | | |  |__   _| |_ ___) \__ \ (_| (_| | | | |
| .__/|_|_|     |_|  \__|____/|___/\___\__,_|_| |_|
|_|                                                
"

# Función para realizar el escaneo con Nmap
function nmap_scan {
    # Solicitar la página a escanear
    read -p "Ingrese la página a escanear: " target_page

    # Menú de opciones de escaneo
    echo "Seleccione el tipo de escaneo que desea realizar:"
    echo "1. Escaneo básico"
    echo "2. Escaneo de tipo SYN con detección de servicios y sistemas operativos"
    echo "3. Escaneo completo de puertos con versión detallada"
    echo "4. Escaneo agresivo con detección de scripts y trazado de ruta"
    echo "5. Escaneo sigiloso con el fin de evadir la detección"

    # Leer la opción seleccionada por el usuario
    read -p "Ingrese el número de opción: " option

    # Realizar el escaneo según la opción seleccionada
    case $option in
        1) echo "Realizando escaneo básico..."
           sudo nmap $target_page ;;
        2) echo "Realizando escaneo de tipo SYN con detección de servicios y sistemas operativos..."
           sudo nmap -sS -sV -O $target_page ;;
        3) echo "Realizando escaneo completo de puertos con versión detallada..."
           sudo nmap -p- -sV $target_page ;;
        4) echo "Realizando escaneo agresivo con detección de scripts y trazado de ruta..."
           sudo nmap -T4 -A --script=default,discovery $target_page ;;
        5) echo "Realizando escaneo sigiloso con el fin de evadir la detección..."
           sudo nmap -sS -T2 -Pn --randomize-hosts -D RND:5 $target_page ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
    esac
}

# Menú principal
function main_menu {
    echo "Seleccione una opción:"
    echo "1. Realizar escaneo con Nmap"
    echo "2. Salir"

    # Leer la opción seleccionada por el usuario
    read -p "Ingrese el número de opción: " option

    case $option in
        1) nmap_scan ;;  # Llamar a la función para realizar el escaneo con Nmap
        2) echo "Saliendo..." ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
    esac
}

# Ejecutar el menú principal
main_menu

