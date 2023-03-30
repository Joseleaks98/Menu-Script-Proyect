#!/bin/bash
menu_principal(){
    # Funcion para mostrar el menu principal
    clear
    echo    "██████╗░██╗███████╗███╗░░██╗██╗░░░██╗███████╗███╗░░██╗██╗██████╗░░█████╗░"
    echo    "██╔══██╗██║██╔════╝████╗░██║██║░░░██║██╔════╝████╗░██║██║██╔══██╗██╔══██╗"
    echo    "██████╦╝██║█████╗░░██╔██╗██║╚██╗░██╔╝█████╗░░██╔██╗██║██║██║░░██║██║░░██║"
    echo    "██╔══██╗██║██╔══╝░░██║╚████║░╚████╔╝░██╔══╝░░██║╚████║██║██║░░██║██║░░██║"
    echo    "██████╦╝██║███████╗██║░╚███║░░╚██╔╝░░███████╗██║░╚███║██║██████╔╝╚█████╔╝"
    echo    "╚═════╝░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚══╝╚═╝╚═════╝░░╚════╝░"
    echo -e "\n\n"
    echo    "*************************************************************************"
    echo    "*************************************************************************"
    echo    "**            ¿Que desea hacer, seleccione un numero?                  **"
    echo    "**                                                                     **"
    echo    "**                    1. Comandos Básicos                              **"
    echo    "**                    2. Gestión de Ficheros                           **"
    echo    "**                    3. Gestión de Directorios                        **"
    echo    "**                    4. Gestión de Permisos                           **"
    echo    "**                    5. Gestión de Usuarios                           **"
    echo    "**                    6. Gestión de Red                                **"
    echo    "**                    7. Calculadora                                   **"
    echo    "**                    8. Juego                                         **"
    echo    "**                    9. Salir                                         **"
    echo    "**                                                                     **"
    echo    "*************************************************************************"
    echo    "*************************************************************************"
    echo    " "
    read -p "$1Introduzca una opción: " opcion
    clear
    case $opcion in
        1)menu_comandos_basicos;;
        2)menu_comandos_ficheros;;
        3)menu_comandos_directorios;;
        4)menu_comandos_permisos;;
        5)menu_comandos_usuarios;;
        6)menu_comandos_red;;
        7)menu_comandos_calculadora;;
        8)menu_juego;;
        9)salir;;
        *) menu_principal "Opcion incorrecta. ";;
    esac
}
menu_comandos_basicos(){
    # Funcion para mostrar el menu de comandos basicos
    clear
    echo " "
    echo    "              ----- ＣＯＭＡＮＤＯＳ ＢＡＳＩＣＯＳ -----              "
    echo    " "
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " **                                                               **"
    echo    " **               1. Mostrar la ruta actual                       **" #pwd
    echo    " **               2. Mostrar procesos en ejecucion                **" #ps
    echo    " **               3. Matar un proceso                             **" #pwd
    echo    " **               4. Actualizar los repositorios                  **" #update upgrade
    echo    " **               5. Mostrar la hora y el dia                     **" #date
    echo    " **               6. Ver el calendario                            **" #cal
    echo    " **               7. Mostrar el manual                            **" #man
    echo    " **               8. Mostrar el historial de comandos             **" #history
    echo    " **               9. Mostrar información del sistema              **" #uname 
    echo    " **              10. Mostrar el nombre de la maquina              **" #hostname Muestra el uso de memoria en el sistema
    echo    " **              11. Mostrar el uso de memoria del sistema        **" #free
    echo    " **              12. Apagar el sistema                            **" #shutdow
    echo    " **              13. Reiniciar el sistema                         **" #reboot
    echo    " **              14. Volver al menu principal                     **" #volver
    echo    " **              15. Salir                                        **" #salir
    echo    " **                                                               **"
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " "
    read -p "$1Introduzca una opción: " opcion_comandos_basicos
    clear
    case $opcion_comandos_basicos in
        1) encabezado # Es una funcion para mejorar la apariencia del menu
        echo -e "\nTu ruta absoluta actual es:  $(pwd) \n" #pwd nos mostrar la ruta absoluta actual
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos # Vuelve al menu de comandos basicos
        ;; # Fin del comando 1

        2) encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Quieres aplicar un filtro para buscar un proceso en concreto? (s/n): " filtro_proceso 
        if [ "$(echo $filtro_proceso | tr '[:upper:]' '[:lower:]')" == "s" ] # Convierte a minusculas la variable filtro_proceso y compara si es igual a "s"
        then
            echo " "
            read -p "Que nombre de proceso quieres buscar?: " busqueda_proceso
            echo ""
            if [ $(ps -A | grep "$busqueda_proceso" | wc -l) -eq 0 ]  # wc -l cuenta las lineas que hay en el resultado de la busqueda si es 0 es que no hay coincidencias
            then
            echo -e "\nNo hay procesos que coincidan con la busqueda \n"
            else 
            echo -e "\nLos procesos que se estan ejecutando son:\n\n $(ps -A | grep "$busqueda_proceso") \n"
            fi

        elif [ "$(echo $filtro_proceso | tr '[:upper:]' '[:lower:]')" == "n" ] # Convierte a minusculas la variable filtro_proceso y compara si es igual a "n"
        then
            echo -e "\nLos procesos que se estan ejecutando son:\n\n $(ps -A) \n"
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos # Vuelve al menu de comandos basicos
        ;;

        3) 
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Que numero (ID) de proceso quieres matar?: " proceso
        echo ""
        if [ ! -z $proceso ] && [[ $proceso =~ ^[0-9]+$ ]] # Si la variable proceso no esta vacia y si es un numero 
        then
            if [ $(ps -A | grep $proceso 2> /dev/null | wc -l) -eq 0 ] # Si no hay coincidencias con el numero de proceso
            then
                echo -e "\nEste numero de proceso no existe \n"
                
            elif [ $(kill $proceso 2>/dev/null; echo $?) -gt 0 ] # Matamos el proceso y si el codigo de salida es mayor que 0 es que no se ha podido matar el proceso
                then
                    echo -e "\nNo tienes los permisos necesarios para eliminar este proceso \n\n"
                    read -p "¿Quieres usar el superusuario para poder eliminar el proceso? (s/n) : " opcion_admin_proceso
                    if [ "$(echo $opcion_admin_proceso | tr '[:upper:]' '[:lower:]')" == "s" ] 
                        then
                            sudo kill $proceso
                            echo -e "\nEliminado correctamente\n"
                    elif [ "$(echo $opcion_admin_proceso | tr '[:upper:]' '[:lower:]')" == "n" ] # Convierte a minusculas la variable filtro_proceso y compara si es igual a "n"
                        then
                            echo -e "\nPerfecto, no usaremos el superusuario por lo que no eliminaremos el proceso\n"
                    else
                        echo -e "\nOpcion incorrecta , escriba (s/n) \n" 
                    fi
            else
                echo -e "\nEliminado correctamente\n"
                
            fi
        else
            echo -e "\nNo has introducido ningun numero de proceso \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos # Vuelve al menu de comandos basicos
        ;;

        4)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Usaremos el superusuario para ejecutar esta orden. ¿Nos das permisos? (s/n): " opcion_admin_update
        if [ "$(echo $opcion_admin_update | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            clear;sudo apt-get update; sudo apt update; sudo apt-get upgrade;sudo apt upgrade;clear # Actualizamos los repositorios
    
            encabezado # Es una funcion para mejorar la apariencia del menu
            echo -e "\nTodo actualizado correctamente\n"
            
        elif [ "$(echo $opcion_admin_update | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            clear
            encabezado # Es una funcion para mejorar la apariencia del menu
            echo -e "\nSin superusuario no podemos ejecutar la orden\n"
            
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        5) encabezado # Es una funcion para mejorar la apariencia del menu
        echo -e "\nLa hora y la fecha actual es:  $(date) \n"
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        6)
        if [ $(apt -qq list ncal 2>/dev/null | grep "inst" | wc -l) -eq 0 ] # Si no esta instalado ncal lo instalamos
        then
            encabezado # Es una funcion para mejorar la apariencia del menu
            echo -e "\nInstalando ncal ... \n"
            sudo apt-get install ncal 2> /dev/null
        fi
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Quieres aplicar un filtro para seleccionar un mes y año?: (s/n) " opcion_calendario
        if [ "$(echo $opcion_calendario | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            read -p "Selecione el mes que desea mostrar (MM): " mes_calendario
            read -p "Selecione el año que desea mostrar (YYYY) : " anio_calendario
            echo -e "\nEl calendario es: \n\n $(cal $mes_calendario $anio_calendario) \n" # Mostramos el calendario con el filtro
            
        elif [ "$(echo $opcion_calendario | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            echo -e "\nEl calendario es: \n\n $(cal) \n"
            
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        7)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Dime que de comando quieres el manual? : " opcion_manual
        if [ ! -z $opcion_manual ] # Si la variable no esta vacia
        then
            man $opcion_manual 2> /dev/null 
        else
            echo -e "\nNo has introducido ningun comando \n"
        fi
        echo " "
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        8)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo -e "\nTu historial de comandos es:  \n\n $(cat -n  ~/.bash_history) \n" # El archivo ~/.bash_history contiene el historial de comandos
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        9)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Quieres aplicar algun tipo de modificador a la informacion del sistema?(s/n): " opcion_modificador
        if [ "$(echo $opcion_modificador | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            read -p "Quieres mostrar el tipo de arquitectura que se esta utilizando? (s/n): " opcion_modificador_arquitectura
            read -p "Quieres mostrar el nombre de la maquina? (s/n): " opcion_modificador_maquina
            read -p "Quieres mostrar la version del kernel? (s/n): " opcion_modificador_kernel
            modificador_uname=""
            if [ $( echo $opcion_modificador_arquitectura | tr '[:upper:]' '[:lower:]') == "s" ]
            then
                modificador_uname+="-m " # -m es el modificador para mostrar la arquitectura
            fi
            if [ $( echo $opcion_modificador_maquina | tr '[:upper:]' '[:lower:]') == "s" ]
            then
                modificador_uname+="-s " # -s es el modificador para mostrar el nombre de la maquina
            fi
            if [ $( echo $opcion_modificador_kernel | tr '[:upper:]' '[:lower:]') == "s" ]
            then
                modificador_uname+="-r " # -r es el modificador para mostrar la version del kernel
            fi
            echo -e "\nLa informacion del sistema es:  \n\n $(uname $modificador_uname) \n"

        elif [ "$(echo $opcion_modificador | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            echo -e "\nEsta es toda la informacion sobre el sistema:  \n\n $(uname -a) \n"

        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        10)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo -e "\nEl nombre de tu maquina es: $(hostname) \n"
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        11)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo -e "\nLa capacidad del disco duro es: \n\n $(free) \n"
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        12)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Seguro que quieres apagar el sistema (s/n): " opcion_apagar

        if [ "$(echo $opcion_apagar | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            poweroff
        elif [ "$(echo $opcion_apagar | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            echo -e "\nVolviendo al menu anterior"
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;

        13)
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo " "
        read -p "Seguro que quieres reiniciar el sistema (s/n): " opcion_reiniciar

        if [ $(echo $opcion_reiniciar | tr '[:upper:]' '[:lower:]') == "s" ]
        then
            reboot
        elif [ $(echo $opcion_reiniciar | tr '[:upper:]' '[:lower:]') == "n" ]
        then
            echo -e "\nVolviendo al menu anterior"
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
        echo -e "\nPulse una tecla para continuar ... \n" 
        encabezado # Es una funcion para mejorar la apariencia del menu
        read
        menu_comandos_basicos
        ;;
        14)menu_principal;;
        15)salir;;
        *) menu_comandos_basicos "Opcion incorrecta. ";;
    esac
}
menu_comandos_ficheros(){
    # Funcion para mostrar el menu de comandos de ficheros
    clear
    echo -e "Estos son todos los ficheros del directorio actual: \n"
    ls -lp | grep -v /  # Comando para mostrar solo los ficheros del directorio actual
    echo -e "\n\n"
    echo    "           ----- ＣＯＭＡＮＤＯＳ ＦＩＣＨＥＲＯＳ -----              "
    echo    " "
    echo    "*******************************************************************"
    echo    "*******************************************************************"
    echo    "**                                                               **"
    echo    "**              1. Buscar ficheros                               **" #find
    echo    "**              2. Crear ficheros                                **" #touch
    echo    "**              3. Borrar ficheros                               **" #rm
    echo    "**              4. Mostrar contenido de ficheros                 **" #cat / more /less /etc
    echo    "**              5. Copiar ficheros                               **" #cp
    echo    "**              6. Mover ficheros                                **" #mv
    echo    "**              7. Cambiar nombre                                **" #mv
    echo    "**              8. Añadir texto a un fichero                     **" #echo ...
    echo    "**              9. Buscar texto dentro de un fichero             **" #grep ...
    echo    "**             10. Editar el fichero con nano                    **" #nano
    echo    "**             11. Mostar todos los ficheros del directorio      **" #ls
    echo    "**             12. Volver al menu principal                      **" 
    echo    "**             13. Salir                                         **" 
    echo    "**                                                               **"
    echo    "*******************************************************************"
    echo    "*******************************************************************"
    echo    " "
    read -p "$1Introduzca una opcion: " opcion_comandos_ficheros
    clear
    case $opcion_comandos_ficheros in
    1)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres buscar?: " buscar_fichero
        if [ ! -z $buscar_fichero ]
        then
            echo " "
            j=1
            for i in $(find / -type f -name $buscar_fichero 2> /dev/null) # find es un comando que busca archivos en el sistema -type -f para solo archivos -name para buscar por nombre
            do # hago un for solomente para que quede mas estetico la salida
                echo -e "$j) $i"
                j=$(( j + 1 ))
            done
            if [ $(find / -type f -name $buscar_fichero 2> /dev/null | wc -l) -eq 0 ] # wc -l es para contar las lineas
            then
                echo -e "\nNo se ha encontrado ningun archivo con ese nombre \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
        fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    2)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres crear: " crear_fichero
    echo " "
    if [ "$(echo $crear_fichero | cut -c 1)" == "/" ] || [ "$(echo $crear_fichero | cut -c 1)" == "." ] # Compruebo si el usuario ha escrito la ruta completa o solo el nombre del archivo
    then
        if [ ! -f $crear_fichero ] # Compruebo si el archivo existe
        then
            touch $crear_fichero 2> /dev/null
            comprobacion "El archivo se ha creado correctamente" "No se ha podido crear el archivo (Permisos insuficientes o ruta no existente)" "$crear_fichero" "f" # Compruebo si se ha creado el archivo con el estado de salida del comando touch
        else
            echo -e "\nEl archivo ya existe \n"
        fi
    elif [ ! -z $crear_fichero ] # Compruebo si el usuario ha escrito algo
    then
    read -p "El archivo lo quieres crear en este directorio? (s/n): " opcion_ruta_crear_fichero 
        if [ "$(echo $opcion_ruta_crear_fichero | tr '[:upper:]' '[:lower:]')" == "s" ] # Convierto la opcion a minusculas para que el usuario pueda escribirlo en mayusculas o minusculas
        then 
            if [ ! -f $crear_fichero ] # Compruebo si el archivo existe
            then
                touch $crear_fichero 2> /dev/null
                comprobacion "El archivo se ha creado correctamente" "No se ha podido crear el archivo (Permisos insuficientes o ruta no existente)" "$crear_fichero"  # Compruebo si se ha creado el archivo con el estado de salida del comando touch
            else
                echo -e "\nEl archivo ya existe \n"
            fi
        elif [ "$(echo $opcion_ruta_crear_fichero | tr '[:upper:]' '[:lower:]')" == "n" ] # Convierto la opcion a minusculas para que el usuario pueda escribirlo en mayusculas o minusculas
        then
            read -p "Dime la ruta donde quieres crear el archivo: " ruta_crear_fichero

            if [ "$(echo $1 | rev | cut -c 1 )" == "/" ] 
            then
                ruta_crear_fichero=$(echo $ruta_crear_fichero | rev | cut -c 2- | rev)
            fi

            if [ ! -z $ruta_crear_fichero ]
            then
                if [ ! -f $crear_fichero ] # Compruebo si el archivo existe
                then
                    touch $ruta_crear_fichero/$crear_fichero 2> /dev/null
                    comprobacion "El archivo se ha creado correctamente" "No se ha podido crear el archivo (Permisos insuficientes o ruta no existente)" "$ruta_crear_fichero" "d" # Compruebo si se ha creado el archivo con el estado de salida del comando touch
                else
                    echo -e "\nEl archivo ya existe \n"
                fi
            else
                echo -e "\nEscriba la ruta del archivo \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    3)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres borrar: " borrar_fichero 
    echo " "
    if [ "$(echo $borrar_fichero | cut -c 1)" == "/" ] || [ "$(echo $borrar_fichero | cut -c 1)" == "." ] # Vuelvo a comprobar si el usuario ha escrito la ruta completa o solo el nombre del archivo
    then
        if [ -f $borrar_fichero ] # Compruebo si el archivo existe
        then
            rm $borrar_fichero 2> /dev/null
            comprobacion "El archivo se ha borrado correctamente" "No se ha podido borrar el archivo (Permisos insuficientes o ruta no existente)" "$borrar_fichero" "f" # Compruebo si se ha borrado el archivo con el estado de salida del comando rm
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $borrar_fichero ]
    then
    read -p "El archivo esta en este directorio? (s/n): " opcion_ruta_borrar_fichero
        if [ "$(echo $opcion_ruta_borrar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ] # Convierto la opcion a minusculas para que el usuario pueda escribirlo en mayusculas o minusculas
        then
            if [ -f $borrar_fichero ] # Compruebo si el archivo existe
            then
                rm $borrar_fichero 2> /dev/null
                comprobacion "El archivo se ha borrado correctamente" "No se ha podido borrar el archivo (Permisos insuficientes o el fichero no existe)" "$borrar_fichero"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        elif [ "$(echo $opcion_ruta_borrar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta donde esta el fichero: " ruta_borrar_fichero
            if [ "$(echo $1 | rev | cut -c 1 )" == "/" ] 
            then
                ruta_borrar_fichero=$(echo $ruta_borrar_fichero | rev | cut -c 2- | rev) # Si el usuario ha escrito la ruta completa le quito la ultima barra para que no de error al ejecutar el comando rm
            fi
            
            if [ ! -z $ruta_borrar_fichero ] # Compruebo si el usuario ha escrito algo en la ruta
            then
                if [ -f $ruta_borrar_fichero/$borrar_fichero ] # Compruebo si el archivo existe
                then
                    rm $ruta_borrar_fichero/$borrar_fichero 2> /dev/null
                    comprobacion "El archivo se ha borrado correctamente" "No se ha podido borrar el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_borrar_fichero" "d" 
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            else
                echo -e "\nOpcion incorrecta , escriba la ruta del archivo \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    4)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres mostrar: " mostrar_fichero
    echo " "
    read -p "Quieres aplicar algun tipo de modificador? (s/n):" opcion_modificador_mostrar_fichero
    echo " "
    if [ "$(echo $mostrar_fichero | cut -c 1)" == "/" ] || [ "$(echo $mostrar_fichero | cut -c 1)" == "." ] # Vuelvo a comprobar si el usuario ha escrito la ruta completa o solo el nombre del archivo
    then
        if [ "$(echo $opcion_modificador_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ] # Convierto la opcion a minusculas para que el usuario pueda escribirlo en mayusculas o minusculas
        then
            if [ -f $mostrar_fichero ] # Compruebo si el archivo existe
            then
                mostrar_fichero_funcion " " "$mostrar_fichero" # Llamo a la funcion mostrar_fichero_funcion y le paso los parametros que necesita
                comprobacion "El archivo se ha mostrado correctamente" "No se ha podido mostrar el archivo (Permisos insuficientes o el fichero no existe)" 
            else
                echo -e "\nEl archivo no existe \n"
            fi
        elif [ "$(echo $opcion_modificador_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ] # Convierto la opcion a minusculas para que el usuario pueda escribirlo en mayusculas o minusculas
        then
            if [ -f $mostrar_fichero ] # Compruebo si el archivo existe
            then
                echo -e "\nEl contenido del archivo es: \n"
                cat $mostrar_fichero 2> /dev/null
                comprobacion "El archivo se ha mostrado correctamente" "No se ha podido mostrar el archivo (Permisos insuficientes o el fichero no existe)"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi 
    elif [ ! -z $mostrar_fichero ] # Compruebo si el usuario ha escrito algo
    then
       read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_mostrar_fichero # Pregunto si el archivo esta en el directorio actual
        if [ "$(echo $opcion_ruta_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ] # Convierto la opcion a minusculas para que el usuario pueda escribirlo en mayusculas o minusculas
        then
            if [ "$(echo $opcion_modificador_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                if [ -f $mostrar_fichero ] # Compruebo si el archivo existe
                then
                    mostrar_fichero_funcion " " "$mostrar_fichero" # Llamo a la funcion mostrar_fichero_funcion y le paso los parametros que necesita
                    comprobacion "El archivo se ha mostrado correctamente" "No se ha podido mostrar el archivo (Permisos insuficientes o el fichero no existe)"
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            elif [ "$(echo $opcion_modificador_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
            then
                if [ -f $mostrar_fichero ] # Compruebo si el archivo existe
                then
                    echo -e "\nEl contenido del archivo es: \n" # Muestro el contenido del archivo con este mensaje
                    cat $mostrar_fichero 2> /dev/null
                    comprobacion "El archivo se ha mostrado correctamente" "No se ha podido mostrar el archivo (Permisos insuficientes o el fichero no existe)" 
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            else
                echo -e "\nOpcion incorrecta , escriba (s/n) \n"
            fi
        elif [ "$(echo $opcion_ruta_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta donde esta el fichero: " ruta_mostrar_fichero
            if [ "$(echo $opcion_modificador_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                if [ -f $ruta_mostrar_fichero/$mostrar_fichero ] # Compruebo si el archivo existe
                then
                    mostrar_fichero_funcion "$ruta_mostrar_fichero" "$mostrar_fichero" # Llamo a la funcion mostrar_fichero_funcion y le paso los parametros que necesita
                    comprobacion "El archivo se ha mostrado correctamente" "No se ha podido mostrar el archivo (Permisos insuficientes o el fichero no existe)" 
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            elif [ "$(echo $opcion_modificador_mostrar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
            then
                if [ -f $ruta_mostrar_fichero/$mostrar_fichero ] # Compruebo si el archivo existe
                then
                    echo -e "\nEl contenido del archivo es: \n"
                    cat $ruta_mostrar_fichero/$mostrar_fichero 2> /dev/null
                    comprobacion "El archivo se ha mostrado correctamente" "No se ha podido mostrar el archivo (Permisos insuficientes o el fichero no existe)" 
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            else
                echo -e "\nOpcion incorrecta , escriba (s/n) \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    5)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres copiar: " copiar_fichero
    echo " "
    read -p "Dime el nombre que le daras al archivo copiado: " copiar_fichero_destino
    echo " "
    if ( [ "$(echo $copiar_fichero | cut -c 1)" == "/" ] || [ "$(echo $copiar_fichero | cut -c 1)" == "." ] ) && ( [ "$(echo $copiar_fichero_destino | cut -c 1)" == "/" ] || [ "$(echo $copiar_fichero_destino | cut -c 1)" == "." ] ) # Compruebo si el usuario ha escrito la ruta completa o solo el nombre del archivo
    then
        if [ -f $copiar_fichero ] # Compruebo si el archivo existe
        then
            cp $copiar_fichero $copiar_fichero_destino 2> /dev/null
            comprobacion "El archivo se ha copiado correctamente" "No se ha podido copiar el archivo (Permisos insuficientes o el fichero no existe)" "$copiar_fichero_destino" "f"
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $copiar_fichero ] && [ ! -z $copiar_fichero_destino ] # Compruebo si el usuario ha escrito algo en los dos campos
    then
        read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_copiar_fichero
        if [ "$(echo $opcion_ruta_copiar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            read -p "Quieres copiar el archivo en este directorio? (s/n):" opcion_ruta_copiar_fichero_destino # Pregunto si quiere copiar el archivo en el mismo directorio
            if [ "$(echo $opcion_ruta_copiar_fichero_destino | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                if [ -f $copiar_fichero ] # Compruebo si el archivo existe
                then
                    cp $copiar_fichero $copiar_fichero_destino 2> /dev/null
                    comprobacion "El archivo se ha copiado correctamente" "No se ha podido copiar el archivo (Permisos insuficientes o el fichero no existe)" "$copiar_fichero_destino"
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            elif [ "$(echo $opcion_ruta_copiar_fichero_destino | tr '[:upper:]' '[:lower:]')" == "n" ] # Pregunto si quiere copiar el archivo en otro directorio
            then
                read -p "Dime la ruta donde quieres copiar el archivo: " ruta_copiar_fichero_destino
                if [ -f $copiar_fichero ] # Compruebo si el archivo existe
                then
                    cp $copiar_fichero $ruta_copiar_fichero_destino/$copiar_fichero_destino 2> /dev/null
                    comprobacion "El archivo se ha copiado correctamente" "No se ha podido copiar el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_copiar_fichero_destino" "d"
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            else
                echo -e "\nOpcion incorrecta , escriba (s/n) \n"
            fi
        elif [ "$(echo $opcion_ruta_copiar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ] # Pregunto si quiere copiar el archivo de otro directorio
        then
            read -p "Dime la ruta donde esta el fichero: " ruta_copiar_fichero
            echo " "
            read -p "Quieres copiar el archivo en este directorio? (s/n):" opcion_ruta_copiar_fichero_destino
            if [ "$(echo $opcion_ruta_copiar_fichero_destino | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                if [ -f $ruta_copiar_fichero/$copiar_fichero ] # Compruebo si el archivo existe
                then
                    cp $ruta_copiar_fichero/$copiar_fichero $copiar_fichero_destino 2> /dev/null
                    comprobacion "El archivo se ha copiado correctamente" "No se ha podido copiar el archivo (Permisos insuficientes o el fichero no existe)" "$copiar_fichero_destino"
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            elif [ "$(echo $opcion_ruta_copiar_fichero_destino | tr '[:upper:]' '[:lower:]')" == "n" ]
            then
                read -p "Dime la ruta donde quieres copiar el archivo: " ruta_copiar_fichero_destino
                if [ -f $ruta_copiar_fichero/$copiar_fichero ] # Compruebo si el archivo existe
                then
                    cp $ruta_copiar_fichero/$copiar_fichero $ruta_copiar_fichero_destino/$copiar_fichero_destino 2> /dev/null
                    comprobacion "El archivo se ha copiado correctamente" "No se ha podido copiar el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_copiar_fichero_destino" "d"
                else
                    echo -e "\nEl archivo no existe \n"
                fi
            else
                echo -e "\nOpcion incorrecta , escriba (s/n) \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    6)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres mover: " mover_fichero
    echo " "
    read -p "A que directorio quieres moverlo (ruta): " ruta_mover_fichero
    echo " "
    if ( [ "$(echo $mover_fichero | cut -c 1)" == "/" ] || [ "$(echo $mover_fichero | cut -c 1)" == "." ] ) && ( [ "$(echo $ruta_mover_fichero | cut -c 1)" == "/" ] || [ "$(echo $ruta_mover_fichero | cut -c 1)" == "." ] )
    then
        if [ -f $mover_fichero ] # Compruebo si el archivo existe
        then
            mv $mover_fichero $ruta_mover_fichero
            comprobacion "El archivo se ha movido correctamente" "No se ha podido mover el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_mover_fichero" "d" # Es una funcion para mejorar la apariencia del menu
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $mover_fichero ]
    then
        read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_mover_fichero
        if [ "$(echo $opcion_ruta_mover_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -f $mover_fichero ] # Compruebo si el archivo existe
            then
                mv $mover_fichero $ruta_mover_fichero
                comprobacion "El archivo se ha movido correctamente" "No se ha podido mover el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_mover_fichero" "d" # Es una funcion para mejorar la apariencia del menu
            else
                echo -e "\nEl archivo no existe \n"
            fi
        elif [ "$(echo $opcion_ruta_mover_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta donde esta el fichero: " ruta_mover_fichero2
            if [ -f $ruta_mover_fichero2/$mover_fichero ] # Compruebo si el archivo existe
            then
                mv $ruta_mover_fichero2/$mover_fichero $ruta_mover_fichero # Muevo el archivo
                comprobacion "El archivo se ha movido correctamente" "No se ha podido mover el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_mover_fichero" "d"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    7)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres renombrar: " renombrar_fichero 
    echo " "
    read -p "Dime el nuevo nombre del archivo: " renombrar_fichero_nuevo
    echo " "
    if [ "$(echo $renombrar_fichero | cut -c 1)" == "/" ] || [ "$(echo $renombrar_fichero | cut -c 1)" == "." ] && [ "$(echo $renombrar_fichero_nuevo | cut -c 1)" == "/" ] || [ "$(echo $renombrar_fichero_nuevo | cut -c 1)" == "." ]
    then
        if [ -f $renombrar_fichero ] # Compruebo si el archivo existe
        then
            mv $renombrar_fichero $renombrar_fichero_nuevo
            comprobacion "El archivo se ha renombrado correctamente" "No se ha podido renombrar el archivo (Permisos insuficientes o el fichero no existe)" "$renombrar_fichero" "f"
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $renombrar_fichero ] && [ ! -z $renombrar_fichero_nuevo ] # Compruebo si el usuario ha escrito algo en los dos campos
    then
        read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_renombrar_fichero
        if [ "$(echo $opcion_ruta_renombrar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -f $renombrar_fichero ] # Compruebo si el archivo existe
            then
                mv $renombrar_fichero $renombrar_fichero_nuevo
                comprobacion "El archivo se ha renombrado correctamente" "No se ha podido renombrar el archivo (Permisos insuficientes o el fichero no existe)" "$renombrar_fichero"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        elif [ "$(echo $opcion_ruta_renombrar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta donde esta el fichero: " ruta_renombrar_fichero
            if [ -f $ruta_renombrar_fichero/$renombrar_fichero ] # Compruebo si el archivo existe
            then
                mv $ruta_renombrar_fichero/$renombrar_fichero $ruta_renombrar_fichero/$renombrar_fichero_nuevo
                comprobacion "El archivo se ha renombrado correctamente" "No se ha podido renombrar el archivo (Permisos insuficientes o el fichero no existe)" "$ruta_renombrar_fichero" "d"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    8)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo al que quieras añadir texto: " insertar_fichero
    echo " "
    if [ "$(echo $insertar_fichero | cut -c 1)" == "/" ] || [ "$(echo $insertar_fichero | cut -c 1)" == "." ] # Compruebo si el usuario ha escrito algo en los dos campos y si la ruta empieza por "/" o "."
    then
        if [ -f $insertar_fichero ] # Compruebo si el archivo existe
        then
            read -p "Dime el texto que quieres insertar: " texto_insertar
            echo " "
            echo $texto_insertar >> $insertar_fichero # >> es para añadir texto al final del archivo
            comprobacion "El texto se ha insertado correctamente" "No se ha podido insertar el texto (Permisos insuficientes o el fichero no existe)" 
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $insertar_fichero ]
    then
        read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_insertar_fichero
        if [ "$(echo $opcion_ruta_insertar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -f $insertar_fichero ] # Compruebo si el archivo existe
            then
                read -p "Dime el texto que quieres insertar: " texto_insertar
                echo " "
                echo $texto_insertar >> $insertar_fichero # >> es para añadir texto al final del archivo
                comprobacion "El texto se ha insertado correctamente" "No se ha podido insertar el texto (Permisos insuficientes o el fichero no existe)"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        elif [ "$(echo $opcion_ruta_insertar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ] 
        then
            if [ -f $ruta_insertar_fichero/$insertar_fichero ] # Compruebo si el archivo existe
            then
                read -p "Dime el texto que quieres insertar: " texto_insertar
                echo " "
                echo $texto_insertar >> $ruta_insertar_fichero/$insertar_fichero # >> es para añadir texto al final del archivo
                comprobacion "El texto se ha insertado correctamente" "No se ha podido insertar el texto (Permisos insuficientes o el fichero no existe)"
            else
                echo -e "\nEl archivo no existe \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    9)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime que fragmento de texto quieres buscar: " buscar_fichero
    echo " "
    read -p "Dime el nombre del archivo donde quieres buscar: " nombre_fichero
    if [ "$(echo $nombre_fichero | cut -c 1)" == "/" ] || [ "$(echo $nombre_fichero | cut -c 1)" == "." ] # Compruebo si el usuario ha escrito algo en los dos campos y si la ruta empieza por "/" o "."
    then
        if [ -f $nombre_fichero ] # Compruebo si el archivo existe
        then
            echo " "
            grep $buscar_fichero $nombre_fichero # Busco el texto en el archivo
            comprobacion "El texto se ha encontrado correctamente" "No se ha podido encontrar el texto (Permisos insuficientes o el fichero no existe)" 
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $nombre_fichero ] # Compruebo si la variable esta vacia
    then
        read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_buscar_fichero
        if [ "$(echo $opcion_ruta_buscar_fichero | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -f $nombre_fichero ] # Compruebo si el archivo existe
            then
                echo " "
                grep $buscar_fichero $nombre_fichero # Busco el texto en el archivo
                comprobacion "El texto se ha encontrado correctamente" "No se ha podido encontrar el texto (Permisos insuficientes o el fichero no existe)" 
            else
                echo -e "\nEl archivo no existe \n"
            fi 
        elif [ "$(echo $opcion_ruta_buscar_fichero | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            if [ -f $ruta_buscar_fichero/$nombre_fichero ] # Compruebo si el archivo existe
            then
                echo " "
                grep $buscar_fichero $ruta_buscar_fichero/$nombre_fichero # Busco el texto en el archivo
                comprobacion "El texto se ha encontrado correctamente" "No se ha podido encontrar el texto (Permisos insuficientes o el fichero no existe)" 
            else
                echo -e "\nEl archivo no existe \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    10)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del archivo que quieres editar con nano: " editar_fichero_nano
    echo " "
    if [ "$(echo $editar_fichero_nano | cut -c 1)" == "/" ] || [ "$(echo $editar_fichero_nano | cut -c 1)" == "." ]
    then
        if [ -f $editar_fichero_nano ] # Compruebo si el archivo existe
        then
            nano $editar_fichero_nano # Abro el archivo con nano
            comprobacion "El archivo se ha editado correctamente" "No se ha podido editar el archivo (Permisos insuficientes o el fichero no existe)" 
        else
            echo -e "\nEl archivo no existe \n"
        fi
    elif [ ! -z $editar_fichero_nano ]
    then
        read -p "El archivo esta en este directorio? (s/n):" opcion_ruta_editar_fichero_nano
        if [ "$(echo $opcion_ruta_editar_fichero_nano | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
         if [ -f $editar_fichero_nano ] # Compruebo si el archivo existe
            then
                nano $editar_fichero_nano # Abro el archivo con nano
                comprobacion "El archivo se ha editado correctamente" "No se ha podido editar el archivo (Permisos insuficientes o el fichero no existe)" 
            else
                echo -e "\nEl archivo no existe \n"
            fi
        elif [ "$(echo $opcion_ruta_editar_fichero_nano | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta donde esta el fichero: " ruta_editar_fichero_nano
            if [ -f $ruta_editar_fichero_nano/$editar_fichero_nano ] # Compruebo si el archivo existe
            then
                nano $ruta_editar_fichero_nano/$editar_fichero_nano # Abro el archivo con nano
                comprobacion "El archivo se ha editado correctamente" "No se ha podido editar el archivo (Permisos insuficientes o el fichero no existe)" 
            else
                echo -e "\nEl archivo no existe \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nOpcion incorrecta , escriba el nombre de un archivo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    11)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Quieres mostrar los ficheros de este directorio? (s/n): " opcion_mostrar_ficheros_directorio
    if [ "$(echo $opcion_mostrar_ficheros_directorio | tr '[:upper:]' '[:lower:]')" == "s" ]
    then
        echo -e "\nLos ficheros del directorio son: \n"
        ls -lap | grep -v / # Muestro los ficheros unicamente del directorio 
        comprobacion "Los ficheros se han mostrado correctamente" "No se han podido mostrar los ficheros (Permisos insuficientes o el directorio no existe)" 
    elif [ "$(echo $opcion_mostrar_ficheros_directorio | tr '[:upper:]' '[:lower:]')" == "n" ]
    then
        read -p "Dime la ruta del directorio: " ruta_mostrar_ficheros_directorio
        echo -e "\nLos ficheros del directorio son: \n"
        ls -lap $ruta_mostrar_ficheros_directorio | grep -v /  # Muestro los ficheros unicamente del directorio
        comprobacion "Los ficheros se han mostrado correctamente" "No se han podido mostrar los ficheros (Permisos insuficientes o el directorio no existe)" 
    else
        echo -e "\nOpcion incorrecta , escriba (s/n) \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_ficheros
    ;;

    12)
    menu_principal
    ;;
    13)salir;;
    *) menu_comandos_ficheros "Opcion incorrecta. ";;

    esac

}
menu_comandos_directorios(){
    # Funcion para mostrar el menu de comandos de directorios
    clear
    echo " "
    echo    "           ----- ＣＯＭＡＮＤＯＳ ＤＩＲＥＣＴＯＲＩＯ -----           "
    echo    " "
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " **                                                               **"
    echo    " **               1. Mostrar contenido del directorio             **" #ls
    echo    " **               2. Cambiar de directorio                        **" #cd
    echo    " **               3. Crear directorio                             **" #mkdir
    echo    " **               4. Borrar directorio                            **" #rm
    echo    " **               5. Renombrar directorio                         **" #mv
    echo    " **               6. Copiar directorio                            **" #cp
    echo    " **               7. Mover directorio                             **" #mv 
    echo    " **               8. Volver al menu principal                     **" #
    echo    " **               9. Salir                                        **" #
    echo    " **                                                               **"
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " "
    read -p "$1Introduzca una opción: " opcion_comandos_directorios
    clear
    case $opcion_comandos_directorios in
    1) 
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Quieres mostrar el contenido del directorio actual (s/n): " opcion_mostrar_directorio
    echo " "
    read -p "Quieres aplicar algun tipo de modificador en el comando (s/n): " opcion_filtro_directorio
    echo " "
    read -p "Quieres buscar algun archivo dentro del directorio seleccionado (s/n): " opcion_grep_directorio
    echo " "
    if ( [ "$(echo $opcion_mostrar_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] || [ "$(echo $opcion_mostrar_directorio | tr '[:upper:]' '[:lower:]')" == "n" ] ) && ( [ "$(echo $opcion_filtro_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] || [ "$(echo $opcion_filtro_directorio | tr '[:upper:]' '[:lower:]')" == "n" ] ) && ( [ "$(echo $opcion_grep_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] || [ "$(echo $opcion_grep_directorio | tr '[:upper:]' '[:lower:]')" == "n" ] )
    then
            if [ "$(echo $opcion_filtro_directorio | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                echo " "
                read -p "Quieres mostrar los archivos ocultos (s/n): " opcion_filtro_ocultos_directorio
                echo " "
                read -p "Quieres mostrar los archivos con permisos, usuarios, grupos y fecha (s/n): " opcion_filtro_permisos_directorio
                modificador_ls=""
                if [ "$(echo $opcion_filtro_ocultos_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s, se le añade el modificador -a
                then
                    modificador_ls+=" -a " # Se le añade el modificador -a
                fi
                if [ "$(echo $opcion_filtro_permisos_directorio | tr '[:upper:]' '[:lower:]')" == "s" ]
                then
                    modificador_ls+=" -l " # Se le añade el modificador -l
                fi
            elif [ "$(echo $opcion_filtro_directorio | tr '[:upper:]' '[:lower:]')" == "n" ]
            then
                modificador_ls="" # Si no se le añade ningun modificador
            fi           
        if [ "$(echo $opcion_mostrar_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s, se muestra el contenido del directorio actual
        then
            if [ "$(echo $opcion_grep_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s, se busca un archivo dentro del directorio actual
            then
                read -p "Dime el nombre del archivo que quieres buscar: " nombre_archivo
                if [ -z $nombre_archivo ]
                then
                    echo -e "\nNo has introducido ningun nombre de archivo \n"
                else 
                echo " "
                ls $modificador_ls | grep "$nombre_archivo"
                fi
            elif [ "$(echo $opcion_grep_directorio | tr '[:upper:]' '[:lower:]')" == "n" ]
            then
                echo " "
                ls $modificador_ls 2> /dev/null
            fi
        elif [ "$(echo $opcion_mostrar_directorio | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio: " ruta_directorio
            if [ -d $ruta_directorio ]
            then
                if [ "$(echo $opcion_grep_directorio | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s, se busca un archivo dentro del directorio seleccionado
                then
                    read -p "Dime el nombre del archivo que quieres buscar: " nombre_archivo
                    if [ -z $nombre_archivo ]
                    then
                        echo -e "\nNo has introducido ningun nombre de archivo \n"
                    else
                    echo " "
                    ls $modificador_ls $ruta_directorio | grep "$nombre_archivo"
                    fi
                elif [ $(echo $opcion_grep_directorio | tr '[:upper:]' '[:lower:]') == "n" ]
                then
                    echo " "
                    ls $modificador_ls $ruta_directorio 2> /dev/null
                fi
            else
                echo -e "\nNo existe el directorio $ruta_directorio \n"
            fi
        fi
    else
        echo -e "\nOpcion incorrecta , escriba (s/n) \n"
    fi
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    2)
    encabezado # Es una funcion para mejorar la apariencia del menu 
    echo " "
    read -p "Dime al directorio al que quieres cambiar: " directorio_cambiar
    if [ -z $directorio_cambiar ]
    then
        echo -e "\nNo has introducido ningun directorio \n"
    elif [ ! -d $directorio_cambiar ]
    then
        echo -e "\nNo existe el directorio $directorio_cambiar \n"
    else
        cd $directorio_cambiar 2> /dev/null
        comprobacion "Se ha cambiado de directorio correctamente" "No se ha podido cambiar de directorio"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    3)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del directorio que quieres crear: " directorio_crear
    echo " "
    if [ "$(echo $directorio_crear | cut -c 1)" == "/" ] || [ "$(echo $directorio_crear | cut -c 1)" == "." ] # Si el primer caracter es "/" o "." , se crea el directorio en la ruta que se ha introducido
    then
        if [ ! -d $directorio_crear ]
        then
            mkdir $directorio_crear 2> /dev/null
            comprobacion "Se ha creado el directorio correctamente" "No se ha podido crear el directorio" "$directorio_crear" "f"
        else
            echo -e "\nEl directorio $directorio_crear ya existe \n"
        fi
    elif [ ! -z $directorio_crear ]
    then
        read -p "Quieres crear el directorio en el directorio actual (s/n): " opcion_directorio_actual
        echo " "
        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s, se crea el directorio en el directorio actual
        then
            if [ ! -d $directorio_crear ]
            then
                mkdir $directorio_crear 2> /dev/null
                comprobacion "Se ha creado el directorio correctamente" "No se ha podido crear el directorio" "$directorio_crear"  
            else
                echo -e "\nEl directorio $directorio_crear ya existe \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio donde quieres crear el directorio: " ruta_directorio
            if [ -z $ruta_directorio ] 
            then
                echo -e "\nNo has introducido ninguna ruta \n"
            elif [ ! -d $ruta_directorio ]
            then
                echo -e "\nNo existe el directorio $ruta_directorio \n"
            else
                mkdir $ruta_directorio/$directorio_crear 2> /dev/null
                comprobacion "Se ha creado el directorio correctamente" "No se ha podido crear el directorio" "$ruta_directorio" "d"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has introducido ningun nombre de directorio \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    4)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del directorio que quieres eliminar: " directorio_eliminar # Se pide el nombre del directorio que se quiere eliminar
    echo " "
    if [ "$(echo $directorio_eliminar | cut -c 1)" == "/" ] || [ "$(echo $directorio_eliminar | cut -c 1)" == "." ]
    then
        if [ -d $directorio_eliminar ] # Si el directorio existe se elimina
        then
            rm -rf $directorio_eliminar 2> /dev/null
            comprobacion "Se ha eliminado el directorio correctamente" "No se ha podido eliminar el directorio" "$directorio_eliminar" "f"
        else
            echo -e "\nEl directorio $directorio_eliminar no existe \n"
        fi
    elif [ ! -z $directorio_eliminar ]
    then
        read -p "El directorio que queires eliminar esta en el directorio actual (s/n): " opcion_directorio_actual
        echo " "
        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -d $directorio_eliminar ] # Si el directorio existe se elimina
            then
                rm -rf $directorio_eliminar 2> /dev/null
                comprobacion "Se ha eliminado el directorio correctamente" "No se ha podido eliminar el directorio" "$directorio_eliminar" 
            else
                echo -e "\nEl directorio $directorio_eliminar no existe \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio donde quieres eliminar el directorio: " ruta_directorio
            if [ ! -z $ruta_directorio ]
            then
                if [ -d $ruta_directorio ]
                then
                    rm -rf $ruta_directorio/$directorio_eliminar 2> /dev/null
                    comprobacion "Se ha eliminado el directorio correctamente" "No se ha podido eliminar el directorio" "$ruta_directorio" "d"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has introducido ningun nombre de directorio \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    5)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del directorio que quieres renombrar: " directorio_renombrar
    echo " "
    read -p "A que nombre quieres renombrar el directorio: " nuevo_nombre_directorio
    echo " "
    if ( [ "$(echo $directorio_renombrar | cut -c 1)" == "/" ] || [ "$(echo $directorio_renombrar | cut -c 1)" == "." ] ) && ( [ "$(echo $nuevo_nombre_directorio | cut -c 1)" == "/" ] || [ "$(echo $nuevo_nombre_directorio | cut -c 1)" == "." ] )
    then
        if [ -d $directorio_renombrar ]
        then
            mv $directorio_renombrar $nuevo_nombre_directorio 2> /dev/null
            comprobacion "Se ha renombrado el directorio correctamente" "No se ha podido renombrar el directorio" "$directorio_renombrar" "f"
        else
            echo -e "\nEl directorio $directorio_renombrar no existe \n"
        fi
    elif [ ! -z $directorio_renombrar ] && [ ! -z $nuevo_nombre_directorio ] # Si el directorio existe se renombra
    then
        read -p "El directorio que queires renombrar esta en el directorio actual (s/n): " opcion_directorio_actual
        echo " "
        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -d $directorio_renombrar ]
            then
                mv ./$directorio_renombrar ./$nuevo_nombre_directorio 2> /dev/null
                comprobacion "Se ha renombrado el directorio correctamente" "No se ha podido renombrar el directorio" "$directorio_renombrar" 
            else
                echo -e "\nEl directorio $directorio_renombrar no existe \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio donde quieres renombrar el directorio: " ruta_directorio
            if [ ! -z $ruta_directorio ] # Si el directorio existe se renombra
            then
                if [ -d $ruta_directorio ]
                then
                    mv $ruta_directorio/$directorio_renombrar $ruta_directorio/$nuevo_nombre_directorio 2> /dev/null
                    comprobacion "Se ha renombrado el directorio correctamente" "No se ha podido renombrar el directorio" "$ruta_directorio" "d"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has introducido todos los datos \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    6)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del directorio que quieres copiar: " directorio_copiar
    echo " "
    read -p "Dime el nombre del directorio donde quieres copiar el directorio: " directorio_destino
    echo " "
    if ( [ "$(echo $directorio_copiar | cut -c 1)" == "/" ] || [ "$(echo $directorio_copiar | cut -c 1)" == "." ] ) && ( [ "$(echo $directorio_destino | cut -c 1)" == "/" ] || [ "$(echo $directorio_destino | cut -c 1)" == "." ] )
    then
        if [ -d $directorio_copiar ] # Si el directorio existe se copia
        then
            cp -r $directorio_copiar $directorio_destino 2> /dev/null
            comprobacion "Se ha copiado el directorio correctamente" "No se ha podido copiar el directorio" "$directorio_copiar" "f"
        else
            echo -e "\nEl directorio $directorio_copiar no existe \n"
        fi
    elif [ ! -z $directorio_copiar ] && [ ! -z $directorio_destino ] # Si no estan vacios entra en el if
    then
        read -p "El directorio que queires copiar esta en el directorio actual (s/n): " opcion_directorio_actual
        echo " "
        read -p "El directorio donde quieres copiar el directorio esta en el directorio actual (s/n): " opcion_directorio_actual_destino
        echo " "
        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            if [ -d $directorio_copiar ]
            then
                cp -r ./$directorio_copiar ./$directorio_destino 2> /dev/null # Si el directorio existe se copia
                comprobacion "Se ha copiado el directorio correctamente" "No se ha podido copiar el directorio" "$directorio_copiar"
            else
                echo -e "\nEl directorio $directorio_copiar no existe \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio donde quieres copiar el directorio: " ruta_directorio
            if [ ! -z $ruta_directorio ] # Si el directorio existe se copia
            then
                if [ -d $ruta_directorio ]
                then
                    cp -r ./$directorio_copiar $ruta_directorio/$directorio_destino 2> /dev/null
                    comprobacion "Se ha copiado el directorio correctamente" "No se ha podido copiar el directorio" "$ruta_directorio" "d"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            read -p "Dime la ruta del directorio que quieres copiar: " ruta_directorio # Si el directorio existe se copia
            if [ ! -z $ruta_directorio ]
            then
                if [ -d $ruta_directorio ]
                then
                    cp -r $ruta_directorio/$directorio_copiar ./$directorio_destino 2> /dev/null
                    comprobacion "Se ha copiado el directorio correctamente" "No se ha podido copiar el directorio" "$directorio_destino"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio que quieres copiar: " ruta_directorio
            read -p "Dime la ruta del directorio donde quieres copiar el directorio: " ruta_directorio_destino
            if [ ! -z $ruta_directorio ] && [ ! -z $ruta_directorio_destino ] # Si el directorio existe se copia
            then
                if [ -d $ruta_directorio ] && [ -d $ruta_directorio_destino ] # Si el directorio existe se copia
                then
                    cp -r $ruta_directorio/$directorio_copiar $ruta_directorio_destino/$directorio_destino 2> /dev/null
                    comprobacion "Se ha copiado el directorio correctamente" "No se ha podido copiar el directorio" "$ruta_directorio_destino" "d"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has introducido todos los datos \n"
        
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    7)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del directorio que quieres mover: " directorio_mover
    echo " "
    read -p "Dime el nombre del directorio donde quieres mover el directorio: " directorio_destino
    echo " "
    if ( [ "$(echo $directorio_mover | cut -c 1)" == "/" ] || [ "$(echo $directorio_mover | cut -c 1)" == "." ] ) && ( [ "$(echo $directorio_destino | cut -c 1)" == "/" ] || [ "$(echo $directorio_destino | cut -c 1)" == "." ] )
    then
        if [ -d $directorio_mover ] # Si el directorio existe se mueve
        then
            mv $directorio_mover $directorio_destino 2> /dev/null # Si el directorio existe se mueve
            comprobacion "Se ha movido el directorio correctamente" "No se ha podido mover el directorio" "$directorio_destino" "f"
        else
            echo -e "\nEl directorio $directorio_mover no existe \n"
        fi
    elif [ ! -z $directorio_mover ] && [ ! -z $directorio_destino ] # Si no estan vacios entra en el if
    then
        read -p "El directorio que queires mover esta en el directorio actual (s/n): " opcion_directorio_actual
        echo " "
        read -p "Quieres moverlo al directorio actual (s/n): " opcion_directorio_actual_destino
        echo " "
        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s entra en el if
        then
            if [ -d $directorio_mover ] && [ -d $directorio_destino ]
            then
                mv ./$directorio_mover ./$directorio_destino 2> /dev/null # Si el directorio existe se mueve
                comprobacion "Se ha movido el directorio correctamente" "No se ha podido mover el directorio" "$directorio_destino" 
            else
                echo -e "\nEl directorio $directorio_mover o $directorio_destino no existe \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio donde quieres mover el directorio: " ruta_directorio
            if [ ! -z $ruta_directorio ]
            then
                if [ -d $ruta_directorio ]
                then
                    mv ./$directorio_mover $ruta_directorio/$directorio_destino 2> /dev/null #  Si el directorio existe se mueve
                    comprobacion "Se ha movido el directorio correctamente" "No se ha podido mover el directorio" "$ruta_directorio" "d"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es n entra en el else
        then
            read -p "Dimela ruta del directorio que quieres mover: " ruta_directorio
            if [ ! -z $ruta_directorio ]
            then
                if [ -d $ruta_directorio ]
                then
                    mv $ruta_directorio/$directorio_mover ./$directorio_destino 2> /dev/null
                    comprobacion "Se ha movido el directorio correctamente" "No se ha podido mover el directorio" "$directorio_destino"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ] && [ "$(echo $opcion_directorio_actual_destino | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dime la ruta del directorio que quieres mover: " ruta_directorio
            read -p "Dime la ruta del directorio donde quieres mover el directorio: " ruta_directorio_destino
            if [ ! -z $ruta_directorio ] && [ ! -z $ruta_directorio_destino ]
            then
                if [ -d $ruta_directorio ] && [ -d $ruta_directorio_destino ] # Si el directorio existe y la ruta tambien se mueve
                then
                    mv $ruta_directorio/$directorio_mover $ruta_directorio_destino/$directorio_destino 2> /dev/null
                    comprobacion "Se ha movido el directorio correctamente" "No se ha podido mover el directorio" "$ruta_directorio_destino" "d"
                else
                    echo -e "\nNo existe el directorio $ruta_directorio o $ruta_directorio_destino \n"
                fi
            else
                echo -e "\nNo has introducido ninguna ruta \n"
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has introducido todos los datos \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_directorios
    ;;

    8)
    menu_principal;;
    9) salir;;
    *) menu_comandos_directorios "Opcion incorrecta. ";; # Si no se introduce una opcion valida vuelve a mostrar el menu
    esac
}
menu_comandos_permisos(){
    # Funcion para mostrar el menu de comandos de permisos
    clear
    echo -e "Estos son todos los ficheros del directorio actual: \n"
    ls -la  # Comando para mostrar solo los ficheros del directorio actual
    echo -e "\n\n"
    echo    "             ----- ＣＯＭＡＮＤＯＳ ＰＥＲＭＩＳＯＳ -----             "
    echo    " "
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " **                                                               **"
    echo    " **               1. Cambiar propietario                          **" #chown
    echo    " **               2. Agregar permisos                             **" #chmod
    echo    " **               3. Quitar permisos                              **" #chmod
    echo    " **               4. Asignar permisos                             **" #chmod
    echo    " **               5. Mostrar permisos                             **" #ls -l
    echo    " **               6. Cambiar mascara por defecto                  **" #umask
    echo    " **               7. Volver al menu principal                     **" #
    echo    " **               8. Salir                                        **" #
    echo    " **                                                               **"
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " "
    read -p "$1Introduzca una opción: " opcion_comandos_permisos
    clear
    case $opcion_comandos_permisos in
    1)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Nos das permisos del superusuario para cambiar el propietario (s/n): " opcion_superusuario
    echo " "
    if [ "$(echo $opcion_superusuario | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s entra en el if
    then
        read -p "Dime el nombre del fichero o directorio que quieres cambiar el propietario: " fichero_directorio_cambiar_propietario # Se pide el nombre del fichero o directorio
        echo " "
        read -p "Dime el nombre del nuevo propietario: " nuevo_propietario # Se pide el nombre del nuevo propietario
        echo " "
        if [ $(cat /etc/passwd | cut -d: -f 1 | grep -w "$nuevo_propietario" | wc -l) -ne 0 ] # 
        then
            if ( [ "$(echo $fichero_directorio_cambiar_propietario | cut -c 1)" == "/" ] || [ "$(echo $fichero_directorio_cambiar_propietario | cut -c 1)" == "." ] ) && [ ! -z $nuevo_propietario ] # Si el primer caracter es / o . y el nuevo propietario no esta vacio entra en el if
            then
                sudo chown $nuevo_propietario $fichero_directorio_cambiar_propietario 2> /dev/null # chown cambia el propietario de un fichero o directorio
                comprobacion "Se ha cambiado el propietario correctamente" "No se ha podido cambiar el propietario" "$fichero_directorio_cambiar_propietario" "f"
            elif [ ! -z $fichero_directorio_cambiar_propietario ] && [ ! -z $nuevo_propietario ] # Si el fichero o directorio no esta vacio y el nuevo propietario no esta vacio entra en el if
            then
                read -p "El fichero o directorio que quieres cambiar el propietario esta en el directorio actual (s/n): " opcion_directorio_actual
                echo " "
                if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] 
                then
                    sudo chown $nuevo_propietario ./$fichero_directorio_cambiar_propietario 2> /dev/null # chown cambia el propietario de un fichero o directorio
                    comprobacion "Se ha cambiado el propietario correctamente" "No se ha podido cambiar el propietario" "$fichero_directorio_cambiar_propietario" 
                elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
                then
                    read -p "Dime la ruta del fichero o directorio que quieres cambiar el propietario: " ruta_directorio
                    sudo chown $nuevo_propietario $ruta_directorio/$fichero_directorio_cambiar_propietario 2> /dev/null
                    comprobacion "Se ha cambiado el propietario correctamente" "No se ha podido cambiar el propietario" "$ruta_directorio" "d"
                else
                    echo -e "\nOpcion incorrecta , escriba (s/n) \n"
                fi
            else
                echo -e "\nNo has introducido todos los datos \n"
            fi
        else
            echo -e "\nEl usuario $nuevo_propietario no existe \n"
        fi    
    else
        echo -e "\nNo podremos cambiar el propietario \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_permisos
    ;;

    2)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del fichero o directorio que quieres agregar permisos: " fichero_directorio_agregar_permisos 
    echo " "
    if [ ! -z $fichero_directorio_agregar_permisos ] # Si el fichero o directorio no esta vacio entra en el if
    then
        read -p "Quieres agregar permisos al usuario (s/n): " opcion_usuario # Se pide si se quiere agregar permisos al usuario
        echo " "
        read -p "Quieres agregar permisos al grupo (s/n): " opcion_grupo # Se pide si se quiere agregar permisos al grupo
        echo " "
        read -p "Quieres agregar permisos al resto (s/n): " opcion_resto # Se pide si se quiere agregar permisos al resto
        echo " "
        if ( [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" != "n" ] )
        # Si la opcion de usuario , resto y grupo no es "s" o "n" entra en el if
        then
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"

        else
            permisos_usuario="";permisos_grupo="";permisos_resto="" # Inicializamos las variables

            if [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s entra en el if
            then
                read -p "Dime los permisos que quieres agregar al usuario ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_usuario # Se piden los permisos que se quieren agregar al usuario
                echo " "
            fi
            if [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s entra en el if
            then
                read -p "Dime los permisos que quieres agregar al grupo ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_grupo # Se piden los permisos que se quieren agregar al grupo
                echo " "
            fi
            if [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s entra en el if
            then
                read -p "Dime los permisos que quieres agregar al resto ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_resto # Se piden los permisos que se quieren agregar al resto
                echo " "
            fi

            if [ $(echo "$permisos_usuario$permisos_grupo$permisos_resto" | tr -d [rwxRWX] | wc -m ) -eq 1 ] 
            # Si la variable permisos_usuario, permisos_grupo y permisos_resto solo solo tiene caracteres rwxRWX entra en el if
            # tr -d [rwxRWX] elimina los caracteres rwxRWX de la variable y wc -m cuenta los caracteres que quedan si es 1 esque todos los caracteres eran rwxRWX y si no es 1 esque habia otro caracter
            then    
                if [ "$(echo $fichero_directorio_agregar_permisos | cut -c 1)" == "/" ] || [ "$(echo $fichero_directorio_agregar_permisos | cut -c 1)" == "." ]
                then
                    chmod u+$(echo $permisos_usuario | tr '[:upper:]' '[:lower:]'),g+$(echo $permisos_grupo | tr '[:upper:]' '[:lower:]'),o+$(echo $permisos_resto | tr '[:upper:]' '[:lower:]') $fichero_directorio_agregar_permisos 2> /dev/null 
                    # Ejecutamos el comando chmod con los permisos que hemos introducido y redirigimos la salida de error a /dev/null para que no se muestre en pantalla
                    comprobacion "Se han agregado los permisos correctamente" "No se han podido agregar los permisos 1" "$fichero_directorio_agregar_permisos" "f"
                else
                    read -p "El fichero o directorio que quieres agregar permisos esta en el directorio actual (s/n): " opcion_directorio_actual
                    echo " "
                    if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es s entra en el if
                    then
                        chmod u+$(echo $permisos_usuario | tr '[:upper:]' '[:lower:]'),g+$(echo $permisos_grupo | tr '[:upper:]' '[:lower:]'),o+$(echo $permisos_resto | tr '[:upper:]' '[:lower:]') ./$fichero_directorio_agregar_permisos 2> /dev/null
                        # Ejecutamos el comando chmod con los permisos que hemos introducido y redirigimos la salida de error a /dev/null para que no se muestre en pantalla
                        comprobacion "Se han agregado los permisos correctamente" "No se han podido agregar los permisos 2" "$fichero_directorio_agregar_permisos"
                    elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ] # Si la opcion es n entra en el if
                    then
                        read -p "Dime la ruta del fichero o directorio que quieres agregar permisos: " ruta_directorio
                        chmod u+$(echo $permisos_usuario | tr '[:upper:]' '[:lower:]'),g+$(echo $permisos_grupo | tr '[:upper:]' '[:lower:]'),o+$(echo $permisos_resto | tr '[:upper:]' '[:lower:]') $ruta_directorio/$fichero_directorio_agregar_permisos  2> /dev/null
                        # Ejecutamos el comando chmod con los permisos que hemos introducido y redirigimos la salida de error a /dev/null para que no se muestre en pantalla
                        comprobacion "Se han agregado los permisos correctamente" "No se han podido agregar los permisos 3" "$ruta_directorio" "d"
                    else
                        echo -e "\nOpcion incorrecta , escriba (s/n) \n"
                    fi     
                fi
            else
                echo -e "\nOpcion incorrecta , escriba (r/w/x) \n"
            fi
        fi
    else
        echo -e "\nNo has introducido ningun fichero o directorio \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_permisos
    ;;

    3)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del fichero o directorio que quieres quitar permisos: " fichero_directorio_quitar_permisos
    echo " "
    if [ ! -z $fichero_directorio_quitar_permisos ]
    then
        read -p "Quieres quitar permisos al usuario (s/n): " opcion_usuario # Se pregunta si se quieren quitar permisos al usuario
        echo " "
        read -p "Quieres quitar permisos al grupo (s/n): " opcion_grupo # Se pregunta si se quieren quitar permisos al grupo
        echo " "
        read -p "Quieres quitar permisos al resto (s/n): " opcion_resto # Se pregunta si se quieren quitar permisos al resto
        echo " "
        if ( [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" != "n" ] )
        # Si la opcion introducida no es "s" o "n" entra en el if 
        then
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        else
            permisos_usuario="";permisos_grupo="";permisos_resto=""
            if [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                read -p "Dime los permisos que quieres quitar al usuario ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_usuario # Se pregunta que permisos se quieren quitar al usuario
                echo " "
            fi
            if [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                read -p "Dime los permisos que quieres quitar al grupo ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_grupo # Se pregunta que permisos se quieren quitar al grupo
                echo " "
            fi
            if [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" == "s" ]
            then
                read -p "Dime los permisos que quieres quitar al resto ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_resto # Se pregunta que permisos se quieren quitar al resto
                echo " "
            fi
            if [ $(echo "$permisos_usuario$permisos_grupo$permisos_resto" | tr -d [rwxRWX] | wc -m ) -eq 1 ]
            then    
                if [ "$(echo $fichero_directorio_quitar_permisos | cut -c 1)" == "/" ] || [ "$(echo $fichero_directorio_quitar_permisos | cut -c 1)" == "." ]
                    then
                    chmod u-$(echo $permisos_usuario | tr '[:upper:]' '[:lower:]'),g-$(echo $permisos_grupo | tr '[:upper:]' '[:lower:]'),o-$(echo $permisos_resto | tr '[:upper:]' '[:lower:]') $fichero_directorio_quitar_permisos 2> /dev/null
                    comprobacion "Se han quitado los permisos correctamente" "No se han podido quitar los permisos" "$fichero_directorio_quitar_permisos" "f"
                else
                    read -p "El fichero o directorio que quieres quitar permisos esta en el directorio actual (s/n): " opcion_directorio_actual
                    echo " "
                    if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ]
                    then
                        chmod u-$(echo $permisos_usuario | tr '[:upper:]' '[:lower:]'),g-$(echo $permisos_grupo | tr '[:upper:]' '[:lower:]'),o-$(echo $permisos_resto | tr '[:upper:]' '[:lower:]') ./$fichero_directorio_quitar_permisos 2> /dev/null
                        comprobacion "Se han quitado los permisos correctamente" "No se han podido quitar los permisos" "$fichero_directorio_quitar_permisos"
                    elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
                    then
                        read -p "Dimela ruta del fichero o directorio que quieres quitar permisos: " ruta_directorio
                        chmod u-$(echo $permisos_usuario | tr '[:upper:]' '[:lower:]'),g-$(echo $permisos_grupo | tr '[:upper:]' '[:lower:]'),o-$(echo $permisos_resto | tr '[:upper:]' '[:lower:]') $ruta_directorio/$fichero_directorio_quitar_permisos 2> /dev/null
                        comprobacion "Se han quitado los permisos correctamente" "No se han podido quitar los permisos" "$ruta_directorio" "d"
                    else
                        echo -e "\nOpcion incorrecta , escriba (s/n) \n"
                    fi
                fi
            else    
                echo -e "\nOpcion incorrecta , escriba (r/w/x) \n"
            fi
        fi
    else
        echo -e "\nNo has introducido ningun fichero o directorio \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_permisos
    ;;

    4)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del fichero o directorio que quieres asignar permisos: " fichero_directorio_asignar_permisos
    if [ ! -z $fichero_directorio_asignar_permisos ]
    then
        echo " "
        read -p "Quieres usar el sistema octal (s/n): " opcion_sistema_octal # Se pregunta si se quiere usar el sistema octal
        echo " "
        if [ "$(echo $opcion_sistema_octal | tr '[:upper:]' '[:lower:]')" == "s" ] # entra en el if si la opcion introducida es "s"
        then
            echo    "                         OPCIONES                                  "
            echo    "*******************************************************************"
            echo    "*******************************************************************"
            echo    "**                                                               **"
            echo    "**              0. ---  Sin Permisos                             **"
            echo    "**              1. --x  Ejecucion                                **"
            echo    "**              2. -w-  Escritura                                **"
            echo    "**              3. -wx  Escritura y Ejecucion                    **"
            echo    "**              4. r--  Lectura                                  **"
            echo    "**              5. r-x  Lectura y Ejecucion                      **"
            echo    "**              6. rw-  Lectura y Escritura                      **"
            echo    "**              7. rwx  Lectura, Escritura y Ejecucion           **"
            echo    "**                                                               **"
            echo    "*******************************************************************"
            echo    "*******************************************************************"
            echo    " "
            read -p "Dime los permisos que quieres asignar ej:(765): " permisos_asignar
            echo " "
                if [ $(echo $permisos_asignar | tr -d [0-7] | wc -m ) -eq 1 ] && [ ! -z $permisos_asignar ] 
                # Comprueba si los datos son correctos y no estan vacios
                # tr -d [0-7] elimina los caracteres que no sean numeros del 0 al 7 y cuento los caracteres. Si resulta que es 1 es que todos los caracteres son numeros del 0 al 7
                # Si no es igual a 1 es que hay caracteres difenrentes a los numeros del 0 al 7
                then
                    if [ "$(echo $fichero_directorio_asignar_permisos | cut -c 1)" == "/" ] || [ "$(echo $fichero_directorio_asignar_permisos | cut -c 1)" == "." ]
                    then
                        chmod $permisos_asignar $fichero_directorio_asignar_permisos 2> /dev/null # Cambio el propietario del fichero o directorio
                        comprobacion "Se han establecido los permisos correctamente" "No se han podido asignar los permisos" "$fichero_directorio_asignar_permisos" "f"
                    elif [ ! -z $fichero_directorio_asignar_permisos ]
                    then
                        read -p "El fichero o directorio que quieres asignar permisos esta en el directorio actual (s/n): " opcion_directorio_actual
                        echo " "
                        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ]
                        then
                            chmod $permisos_asignar ./$fichero_directorio_asignar_permisos 2> /dev/null
                            comprobacion "Se han establecido los permisos correctamente" "No se han podido asignar los permisos" "$fichero_directorio_asignar_permisos"
                        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
                        then
                            read -p "Dimela ruta del fichero o directorio que quieres asignar permisos: " ruta_directorio
                            chmod $permisos_asignar $ruta_directorio/$fichero_directorio_asignar_permisos 2> /dev/null
                            comprobacion "Se han establecido los permisos correctamente" "No se han podido asignar los permisos" "$ruta_directorio" "d" # Comprueba si se ha podido cambiar el propietario del fichero o directorio
                        else
                            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
                        fi
                    else
                        echo -e "\nNo has escrito el nombre del fichero o directorio \n"
                    fi
                else
                    echo -e "\nOpcion incorrecta , escriba (0-7) \n"
                fi
        elif [ "$(echo $opcion_sistema_octal | tr '[:upper:]' '[:lower:]')" == "n" ] 
        then
            echo " "
            read -p "Quieres agregar permisos al usuario (s/n): " opcion_usuario # Se pregunta si se quiere agregar permisos al usuario
            echo " "
            read -p "Quieres agregar permisos al grupo (s/n): " opcion_grupo # Se pregunta si se quiere agregar permisos al grupo
            echo " "
            read -p "Quieres agredar permisos al resto (s/n): " opcion_resto # Se pregunta si se quiere agregar permisos al resto
            echo " "
            
            if ( [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" != "n" ] )
            then
                echo -e "\nOpcion incorrecta , escriba (s/n) \n"
            else
                permisos_usuario="";permisos_grupo="";permisos_resto="" # Inicializo las variables

                if [ "$(echo $opcion_usuario | tr '[:upper:]' '[:lower:]')" == "s" ]
                then
                    read -p "Dime los permisos que quieres agregar al usuario ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_usuario
                    echo " "
                fi
                if [ "$(echo $opcion_grupo | tr '[:upper:]' '[:lower:]')" == "s" ]
                then
                    read -p "Dime los permisos que quieres agregar al grupo ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_grupo
                    echo " "
                fi
                if [ "$(echo $opcion_resto | tr '[:upper:]' '[:lower:]')" == "s" ]
                then
                    read -p "Dime los permisos que quieres agregar al resto ( lectura (r), escritura (w) o ejecucion (x) ): " permisos_resto
                    echo " "
                fi
                # Solo entrara en los ifs si la opcion es "s"
                if [ $(echo "$permisos_usuario$permisos_grupo$permisos_resto" | tr -d [rwxRWX] | wc -m ) -eq 1 ]
                then    
                    if [ "$(echo $fichero_directorio_asignar_permisos | cut -c 1)" == "/" ] || [ "$(echo $fichero_directorio_asignar_permisos | cut -c 1)" == "." ]
                        then
                            chmod u=$permisos_usuario,g=$permisos_grupo,o=$permisos_resto $fichero_directorio_asignar_permisos 2> /dev/null
                            comprobacion "Se han establecido los permisos correctamente" "No se han podido asignar los permisos" "$fichero_directorio_asignar_permisos" "f"
                        elif [ ! -z $fichero_directorio_asignar_permisos ]
                        then
                            read -p "El fichero o directorio que quieres asignar permisos esta en el directorio actual (s/n): " opcion_directorio_actual
                            echo " "
                            if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ]
                            then
                                chmod u=$permisos_usuario,g=$permisos_grupo,o=$permisos_resto ./$fichero_directorio_asignar_permisos 2> /dev/null
                                comprobacion "Se han establecido los permisos correctamente" "No se han podido asignar los permisos" "$fichero_directorio_asignar_permisos" 
                            elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
                            then
                                read -p "Dimela ruta del fichero o directorio que quieres asignar permisos: " ruta_directorio
                                chmod u=$permisos_usuario,g=$permisos_grupo,o=$permisos_resto $ruta_directorio/$fichero_directorio_asignar_permisos 2> /dev/null
                                comprobacion "Se han establecido los permisos correctamente" "No se han podido asignar los permisos" "$ruta_directorio" "d" # Comprueba si se ha podido cambiar el propietario del fichero o directorio
                            else
                                echo -e "\nOpcion incorrecta , escriba (s/n) \n"
                            fi
                        else
                            echo -e "\nNo has escrito el nombre del fichero o directorio \n"
                        fi
                else    
                    echo -e "\nOpcion incorrecta , escriba (r/w/x) \n"
                fi  
            fi
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del fichero o directorio \n"
    fi 
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_permisos  
    ;;

    5)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el fichero o directorio quieres ver los permisos que tiene: " fichero_directorio_ver_permisos
    echo " "
    if [ "$(echo $fichero_directorio_ver_permisos | cut -c 1)" == "/" ] || [ "$(echo $fichero_directorio_ver_permisos | cut -c 1)" == "." ] # Si el primer caracter es "/" o "." es una ruta absoluta o relativa
    then
        ls -l $fichero_directorio_ver_permisos 2> /dev/null # Muestro los permisos del fichero o directorio
        comprobacion "Se han mostrado los permisos correctamente" "No se han podido mostrar los permisos"
    elif [ ! -z $fichero_directorio_ver_permisos ] # Si no esta vacio
    then
        read -p "El fichero o directorio que quieres ver los permisos esta en el directorio actual (s/n): " opcion_directorio_actual
        echo " "
        if [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "s" ]
        then
            ls -l ./$fichero_directorio_ver_permisos 2> /dev/null
            comprobacion "Se han mostrado los permisos correctamente" "No se han podido mostrar los permisos" # Es una funcion para comprobar si se ha ejecutado el comando correctamente
        elif [ "$(echo $opcion_directorio_actual | tr '[:upper:]' '[:lower:]')" == "n" ]
        then
            read -p "Dimela ruta del fichero o directorio que quieres ver los permisos: " ruta_directorio
            ls -l $ruta_directorio/$fichero_directorio_ver_permisos 2> /dev/null # Muestro los permisos del fichero o directorio
            comprobacion "Se han mostrado los permisos correctamente" "No se han podido mostrar los permisos"
        else
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del fichero o directorio \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_permisos
    ;;

    6)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo -e "La mascara por defecto es: $(umask)"
    echo -e "Los directorios se crearan con los permisos $[ 777 - $(umask)]" # restamos la mascara a 777 para que nos de los permisos que se crearan
    echo -e "Los ficheros se crearan con los permisos $[ 666 - $(umask)] \n" # restamos la mascara a 666 para que nos de los permisos que se crearan
    read -p "Quieres cambiar la mascara (s/n): " opcion_cambiar_mascara
    if [ "$(echo $opcion_cambiar_mascara | tr '[:upper:]' '[:lower:]')" == "s" ]
    then
        read -p "Dime la mascara que quieres establecer ej:(014): " mascara_establecer
        if [ $(echo $mascara_establecer | tr -d [0-7] | wc -m ) -eq 1 ] && [ ! -z $mascara_establecer ]  # Si la mascara es entre 0 y 7 y no esta vacia
        then
            umask $mascara_establecer 2> /dev/null
            comprobacion "Se ha establecido la mascara correctamente" "No se ha podido establecer la mascara"
        else
            echo -e "\nOpcion incorrecta , escriba (0-7) \n"
        fi
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_permisos
    ;;

    7)
    menu_principal;;
    8)
    salir;;
    *) menu_comandos_permisos "Opcion incorrecta. ";;
    esac
}
menu_comandos_usuarios(){
    # Funcion para mostrar el menu de comandos de usuarios
    clear
    encabezado
    echo    "PARA LA MAYORIA DE LOS COMANDOS DE USUARIOS NECESITAREMOS SER ROOT"
    encabezado
    echo  " "
    echo    "              ----- ＣＯＭＡＮＤＯＳ ＵＳＵＡＲＩＯ -----              "
    echo  " "
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " **                                                               **"
    echo    " **                1. Crear usuario                               **" 
    echo    " **                2. Eliminar usuario                            **" 
    echo    " **                3. Bloquear usuario                            **" 
    echo    " **                4. Desbloquear usuario                         **" 
    echo    " **                5. Crear grupo                                 **" 
    echo    " **                6. Eliminar grupo                              **" 
    echo    " **                7. Añadir usuario a grupo                      **"
    echo    " **                8. Eliminar usuario de grupo                   **" 
    echo    " **                9. Cambiar contraseña                          **" 
    echo    " **               10. Cambiar nombre de usuario                   **" 
    echo    " **               11. Mostrar el usuario actual                   **" 
    echo    " **               12. Mostrar los usuarios conectados             **" 
    echo    " **               13. Mostrar los grupos del usuario actual       **" 
    echo    " **               14. Cambiar el usuario                          **" 
    echo    " **               15. Mostrar todo los usuarios del sistema       **" 
    echo    " **               16. Mostrar todo los grupos del sistema         **" 
    echo    " **               17. Volver al menu principal                    **" 
    echo    " **               18. Salir                                       **"       
    echo    " **                                                               **"
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " "
    read -p "$1Introduzca una opción: " opcion_comandos_usuarios
    clear
    case $opcion_comandos_usuarios in
    1)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres crear: " nombre_usuario_crear
    echo " "
    if [ ! -z $nombre_usuario_crear ] # Si el nombre del usuario no esta vacio
    then
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_crear" | wc -l) -ne 0 ] 
        # Visualizamos el contenido del fichero /etc/passwd y buscamos el nombre del usuario que queremos crear. Si el nombre del usuario que queremos crear esta en el fichero /etc/passwd entonces el usuario ya existe
        then
            echo -e "\nEl usuario $nombre_usuario_crear ya existe \n"
        else 
            read -p "Quieres crear la carpteta del usuario (s/n): " opcion_carpeta_usuario # Opcion para crear la carpeta del usuario
            echo " "
            read -p "Quieres establecer la contraseña del usuario (s/n): " opcion_establecer_contrasena # Opcion para establecer la contraseña del usuario
            echo " "
            read -p "Quieres que expire la contraseña del usuario (s/n): " opcion_expirar_contrasena  # Opcion para que expire la contraseña del usuario
            echo " "
                if ( [ "$(echo $opcion_carpeta_usuario | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_carpeta_usuario | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_establecer_contrasena | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_establecer_contrasena | tr '[:upper:]' '[:lower:]')" != "n" ] ) || ( [ "$(echo $opcion_expirar_contrasena | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_expirar_contrasena | tr '[:upper:]' '[:lower:]')" != "n" ] )
                # Si la opcion no es "s" o "n"
                then
                    echo -e "\nOpcion incorrecta , escriba (s/n) \n"
                else
                    modificador_useradd="" # Variable que almacena los modificadores de useradd, la inicializamos vacia
                    if [ "$(echo $opcion_carpeta_usuario | tr '[:upper:]' '[:lower:]')" == "s" ]
                    then
                    modificador_useradd+=" -m "
                    fi
                    if [ "$(echo $opcion_expirar_contrasena | tr '[:upper:]' '[:lower:]')" == "s" ]
                    then
                    read -p "Dime los dias que quieres que expire la contraseña: " dias_expirar_contrasena
                    modificador_useradd+=" -f $dias_expirar_contrasena "
                    fi

                    sudo useradd $modificador_useradd $nombre_usuario_crear 
                    comprobacion "Se ha creado el usuario correctamente" "No se ha podido crear el usuario"

                    # Ejecutamos el comando useradd con los modificadores que hemos almacenado en la variable modificador_useradd y despues cambiamos la contraseña del usuario si el usuario ha elegido la opcion "s"
                    if [ "$(echo $opcion_establecer_contrasena | tr '[:upper:]' '[:lower:]')" == "s" ]
                    then
                    sudo passwd $nombre_usuario_crear
                    fi
                fi
        fi
    else
        echo -e "\nEl nombre del usuario no puede estar vacio \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    2)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres eliminar: " nombre_usuario_eliminar
    echo " "
    if [ ! -z $nombre_usuario_eliminar ] # Si el nombre del usuario no esta vacio
    then
    read -p "Quieres borrar la carpteta del usuario (s/n): " opcion_carpeta_usuario
    echo " "
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_eliminar" | wc -l) -ne 0 ] # Si el nombre del usuario que queremos eliminar esta en el fichero /etc/passwd entonces el usuario existe
        then
            if ( [ "$(echo $opcion_carpeta_usuario | tr '[:upper:]' '[:lower:]')" != "s" ] && [ "$(echo $opcion_carpeta_usuario | tr '[:upper:]' '[:lower:]')" != "n" ] ) # Si la opcion no es "s" o "n"
            then
            echo -e "\nOpcion incorrecta , escriba (s/n) \n"
            elif [ "$(echo $opcion_carpeta_usuario | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la opcion es "s"
            then
            sudo deluser --remove-home $nombre_usuario_eliminar 2> /dev/null
            comprobacion "Se ha eliminado el usuario correctamente" "No se ha podido eliminar el usuario" 
            else
            sudo deluser $nombre_usuario_eliminar 2> /dev/null
            comprobacion "Se ha eliminado el usuario correctamente" "No se ha podido eliminar el usuario"
            fi
        else
        echo -e "\nEl usuario $nombre_usuario_eliminar no existe \n"
        fi
    else
    echo -e "\nNo has escrito el nombre del usuario \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    3)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres bloquear: " nombre_usuario_bloquear
    if [ ! -z $nombre_usuario_bloquear ]
    then
        echo " "
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_bloquear" | wc -l) -ne 0 ]
        then
        sudo usermod -L $nombre_usuario_bloquear 
        comprobacion "Se ha bloqueado el usuario correctamente" "No se ha podido bloquear el usuario"
        else
        echo -e "\nEl usuario $nombre_usuario_bloquear no existe \n"
        fi
    else
    echo -e "\nNo has escrito el nombre del usuario \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    4)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres desbloquear: " nombre_usuario_desbloquear
    echo " "
    if [ ! -z $nombre_usuario_desbloquear ]
    then
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_desbloquear" | wc -l) -ne 0 ] # Si el usuario existe
        then
            if [ $(sudo passwd -S -a | grep "$nombre_usuario_desbloquear" | grep L |wc -l) -ne 0 ] # Si el usuario esta bloqueado
            then
            sudo usermod -U $nombre_usuario_desbloquear 2> /dev/null
            comprobacion "Se ha desbloqueado el usuario correctamente" "No se ha podido desbloquear el usuario"
            else
            echo -e "\nEl usuario $nombre_usuario_desbloquear no esta bloqueado \n"
            fi
        else
            echo -e "\nEl usuario $nombre_usuario_desbloquear no existe \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del usuario \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    5)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del grupo que quieres crear: " nombre_grupo_crear
    echo " "
    if [ ! -z $nombre_grupo_crear ]
    then
        if [ $(cat /etc/group | grep -w $nombre_grupo_crear | wc -l) -eq 0 ]
        then
            sudo groupadd $nombre_grupo_crear 2> /dev/null
            comprobacion "Se ha creado el grupo correctamente" "No se ha podido crear el grupo"
        else
            echo -e "\nEl grupo $nombre_grupo_crear ya existe \n" # Si el grupo ya existe
        fi
    else
        echo -e "\nNo has escrito el nombre del grupo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    6)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del grupo que quieres eliminar: " nombre_grupo_eliminar
    echo " "
    if [ ! -z $nombre_grupo_eliminar ]
    then
        if [ $(cat /etc/group | grep -w "$nombre_grupo_eliminar" | wc -l) -ne 0 ]
        then
            sudo groupdel $nombre_grupo_eliminar 2> /dev/null
            comprobacion "Se ha eliminado el grupo correctamente" "No se ha podido eliminar el grupo"
        else
            echo -e "\nEl grupo $nombre_grupo_eliminar no existe \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del grupo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    7)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres añadir al grupo: " nombre_usuario_grupo
    echo " "
    read -p "Dime el nombre del grupo al que quieres añadir el usuario: " nombre_grupo_usuario
    echo " "
    if [ ! -z $nombre_usuario_grupo ] && [ ! -z $nombre_grupo_usuario ] # Si no estan vacios los dos campos
    then
        if [ $(cat /etc/group | grep -w "$nombre_grupo_usuario" | wc -l) -ne 0 ] # Si el grupo existe
        then
            if [ $(cat /etc/passwd | grep -w "$nombre_usuario_grupo" | wc -l) -ne 0 ] # Si el usuario existe
            then
                if [ $(groups "$nombre_usuario_grupo" | grep -w "$nombre_grupo_usuario" | wc -l) -eq 0 ] # Si el usuario no pertenece al grupo
                then
                    sudo usermod -a -G $nombre_grupo_usuario $nombre_usuario_grupo 2> /dev/null
                    comprobacion "Se ha añadido el usuario al grupo correctamente" "No se ha podido añadir el usuario al grupo"
                else
                    echo -e "\nEl usuario $nombre_usuario_grupo ya pertenece al grupo $nombre_grupo_usuario \n" # Si el usuario ya pertenece al grupo
                fi
            else
            echo -e "\nEl usuario $nombre_usuario_grupo no existe \n"
            fi
        else
        echo -e "\nEl grupo $nombre_grupo_usuario no existe \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del usuario o el nombre del grupo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    8)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres eliminar del grupo: " nombre_usuario_grupo_eliminar
    echo " "
    read -p "Dime el nombre del grupo del que quieres eliminar el usuario: " nombre_grupo_usuario_eliminar
    echo " "
    if [ ! -z $nombre_usuario_grupo_eliminar ] && [ ! -z $nombre_grupo_usuario_eliminar ] # Si no estan vacios los dos campos
    then
        if [ $(cat /etc/group | grep -w "$nombre_grupo_usuario_eliminar" | wc -l) -ne 0 ] # Si el grupo existe
        then
            if [ $(cat /etc/passwd | grep -w "$nombre_usuario_grupo_eliminar" | wc -l) -ne 0 ] # Si el usuario existe
            then
                if [ $(groups "$nombre_usuario_grupo_eliminar" | grep -w "$nombre_grupo_usuario_eliminar" | wc -l) -ne 0 ] # Si el usuario pertenece al grupo
                then
                    sudo gpasswd -d $nombre_usuario_grupo_eliminar $nombre_grupo_usuario_eliminar 2> /dev/null
                    comprobacion "Se ha eliminado el usuario del grupo correctamente" "No se ha podido eliminar el usuario del grupo"
                else
                    echo -e "\nEl usuario $nombre_usuario_grupo_eliminar no pertenece al grupo $nombre_grupo_usuario_eliminar \n"
                fi
            else
                echo -e "\nEl usuario $nombre_usuario_grupo_eliminar no existe \n"
            fi
        else
        echo -e "\nEl grupo $nombre_grupo_usuario_eliminar no existe \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del usuario o el nombre del grupo \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    9)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario que quieres cambiar la contraseña: " nombre_usuario_cambiar_contrasena
    echo " "
    if [ ! -z $nombre_usuario_cambiar_contrasena ]
    then 
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_cambiar_contrasena" | wc -l) -ne 0 ] # Si el usuario existe
        then
        sudo passwd $nombre_usuario_cambiar_contrasena
        comprobacion "Se ha cambiado la contraseña correctamente" "No se ha podido cambiar la contraseña"
        else
        echo -e "\nEl usuario $nombre_usuario_cambiar_contrasena no existe \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del usuario \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    10)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario al quieres cambiarle el nombre: " nombre_usuario_cambiar_nombre
    echo " "
    read -p "Dime el nuevo nombre del usuario: " nuevo_nombre_usuario
    echo " "
    if [ ! -z $nombre_usuario_cambiar_nombre ] && [ ! -z $nuevo_nombre_usuario ] # Si no estan vacios los dos campos
    then
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_cambiar_nombre" | wc -l) -ne 0 ] # Si el usuario existe
        then
        sudo usermod -l $nuevo_nombre_usuario $nombre_usuario_cambiar_nombre 2> /dev/null
        comprobacion "Se ha cambiado el nombre del usuario correctamente" "No se ha podido cambiar el nombre del usuario"
        else
        echo -e "\nEl usuario $nombre_usuario_cambiar_nombre no existe \n"
        fi
    else
        echo -e "\nNo has escrito todos los datos necesarios \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    11)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    echo "Tu nombre de usuario es: $(whoami)"
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    12)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    echo "Los usuarios conectados son: $(who)"
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    13)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    echo "Los grupos del usuario actual son: $(groups $(whoami))"
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    14)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime el nombre del usuario con el que quieres logearte: " nombre_usuario_logear
    echo " "
    if [ ! -z $nombre_usuario_logear ]
    then
        if [ $(cat /etc/passwd | grep -w "$nombre_usuario_logear" | wc -l) -ne 0 ] # Si el usuario existe
        then
        su $nombre_usuario_logear
        else
        echo -e "\nEl usuario $nombre_usuario_logear no existe \n"
        fi
    else
        echo -e "\nNo has escrito el nombre del usuario \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    15)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Quieres buscar un usuario en concreto? (s/n): " respuesta_buscar_usuario
    echo " "
    if [ "$(echo $respuesta_buscar_usuario | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la respuesta es si
    then
        read -p "Dime el nombre del usuario que quieres buscar: " nombre_usuario_buscar
        echo " "
        if [ ! -z $nombre_usuario_buscar ] # Si el nombre del usuario no esta vacio
        then
            if [ $(cat /etc/passwd | cut -d":" -f 1 | grep -w "$nombre_usuario_buscar" | wc -l) -ne 0 ] # Si el usuario existe
            then
            cat /etc/passwd | grep -w "$nombre_usuario_buscar"
            else
            echo -e "\nEl usuario $nombre_usuario_buscar no existe"
            fi
        else
            echo -e "\nNo has escrito el nombre del usuario"
        fi
    elif [ "$(echo $respuesta_buscar_usuario | tr '[:upper:]' '[:lower:]')" == "n" ]
    then
        cat /etc/passwd
    else
        echo -e "\nNo has escrito una opcion correcta, escriba (s/n)"
    fi
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;

    16)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Quieres buscar un grupo en concreto? (s/n): " respuesta_buscar_usuario
    echo " "
    if [ "$(echo $respuesta_buscar_usuario | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la respuesta es si
    then
        read -p "Dime el nombre del grupo que quieres buscar: " nombre_grupo_buscar
        echo " "
        if [ ! -z $nombre_grupo_buscar ]
        then
            if [ $(cat /etc/group | cut -d":" -f 1 | grep -w "$nombre_grupo_buscar" | wc -l) -ne 0 ] # Si el grupo existe
            then
            cat /etc/group | grep -w "$nombre_grupo_buscar:x"
            else
            echo -e "\nEl grupo $nombre_grupo_buscar no existe"
            fi
        else
            echo -e "\nNo has escrito el nombre del grupo"
        fi
    elif [ "$(echo $respuesta_buscar_usuario | tr '[:upper:]' '[:lower:]')" == "n" ] # Si la respuesta es no
    then
        cat /etc/group
    else
        echo -e "\nNo has escrito una opcion correcta, escriba (s/n)"
    fi
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_usuarios
    ;;
    17)
    menu_principal
    ;;
    18) salir;;
    *) menu_comandos_usuarios "Opcion incorrecta. ";;
    esac
}
menu_comandos_red(){
    # Menu de comandos de red
    clear
    echo    " "
    echo    "               ----- ＣＯＭＡＮＤＯＳ ＲＥＤ -----                    "
    echo    " "
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " **                                                               **"
    echo    " **               1. Mostrar la configuración de red              **" # ifconfig
    echo    " **               2. Realizar ping a una dirección IP             **" # ping
    echo    " **               3. Mostrar la tabla de enrutamiento             **" # route
    echo    " **               4. Mostrar la tabla ARP                         **" # arp
    echo    " **               5. Mostrar la ruta que cogen los paquetes       **" # traceroute
    echo    " **               6. Volver al menu principal                     **" #
    echo    " **               7. Salir                                        **" #        
    echo    " **                                                               **"
    echo    " *******************************************************************"
    echo    " *******************************************************************"
    echo    " "
    read -p "$1Introduzca una opción: " opcion_comandos_red
    clear
    case $opcion_comandos_red in
    1)
    if [ $(apt -qq list net-tools 2>/dev/null | grep "inst" | wc -l) -eq 0 ] # Si no esta instalado ncal lo instalamos
    then
        encabezado # Es una funcion para mejorar la apariencia del menu
        echo -e "\nInstalando net-tools ... \n"
        sudo apt-get install net-tools 2> /dev/null
    fi
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Quieres mostar la configuracion de solo una interfaz de red? (s/n): " opcion_interfaz_red
    echo " "
    if [ "$(echo $opcion_interfaz_red | tr '[:upper:]' '[:lower:]')" == "s" ] # Si la respuesta es si
    then
        read -p "Dime el nombre de la interfaz de red: " nombre_interfaz_red
        echo " "
        if [ ! -z $nombre_interfaz_red ] # Si el nombre de la interfaz de red no esta vacio
        then
            if [ $(ifconfig | grep -w "$nombre_interfaz_red" | wc -l) -ne 0 ] # Si la interfaz de red existe 
            then
                echo -e " La configuración de la interfaz de red $nombre_interfaz_red es: \n\n $(ifconfig $nombre_interfaz_red)"  
                echo " "
            else
                echo -e "\nLa interfaz de red $nombre_interfaz_red no existe \n"
            fi
        else
        echo -e "\nNo has escrito el nombre de la interfaz de red \n"
        fi
    elif [ "$(echo $opcion_interfaz_red | tr '[:upper:]' '[:lower:]')" == "n" ] # Si la respuesta es no
    then
        echo -e " La configuración de red es: \n\n $(ifconfig)" # Muestra la configuracion de todas las interfaces de red
        echo " "
    else
        echo -e "\nOpcion incorrecta, escriba (s/n) \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_red
    ;;

    2)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime la direccion IP a la que quieres hacer ping: " direccion_ip_ping
    echo " "
    if [ ! -z $direccion_ip_ping ] # Si la direccion IP no esta vacia
    then
        if [ $(ping -c 1 $direccion_ip_ping | grep -w "1 received" | wc -l) -ne 0 ] # Si el ping es correcto
        then
            echo -e "La direccion IP $direccion_ip_ping esta activa \n" 
        else
            echo -e "La direccion IP $direccion_ip_ping no esta activa \n"
        fi
    else
        echo -e "\nNo has escrito la direccion IP \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_red
    ;;

    3)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    echo -e " La tabla de enrutamiento es: \n\n $(route)"
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_red
    ;;

    4)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    echo -e " La tabla ARP es: \n\n $(arp -a)"
    echo " "
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_red
    ;;

    5)
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "Dime la direccion IP a la que quieres hacer tracepath: " direccion_ip_tracepath
    echo " "
    if [ ! -z $direccion_ip_tracepath ]
    then
        tracepath $direccion_ip_tracepath # Muestra la ruta que cogen los paquetes
    else
        echo -e "\nNo has escrito la direccion IP \n"
    fi
    echo -e "\nPulse una tecla para continuar ... \n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    read
    menu_comandos_red
    ;;

    6)
    menu_principal
    ;;
    7) salir;;
    *) menu_comandos_red "Opcion incorrecta. ";;
    esac


}
menu_comandos_calculadora(){
    # Esta funcion muestra el menu de la calculadora
    clear
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo " "
    read -p "$1Dime un numero: " numero1
    echo " "
    if [[ ! $numero1 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]] # Si el numero no es un numero
    then
        menu_comandos_calculadora "No has escrito un numero. "
    fi
    # Inicializamos las variables
    opcion=0 
    resultado=""
    estado=""
    texto=""
    while [ true ]
    do
        echo    " "
        echo    "                      ＣＡＬＣＵＬＡＤＯＲＡ                         "  
        echo    " "                                
        echo    "*******************************************************************"
        echo    "*******************************************************************"
        echo    "**                                                               **"
        echo    "**                        1. Sumar                               **"
        echo    "**                        2. Restar                              **"
        echo    "**                        3. Multiplicar                         **"
        echo    "**                        4. Dividir                             **"
        echo    "**                        5. Potencia                            **"
        echo    "**                        6. Raiz cuadrada                       **"
        echo    "**                        7. Borrar Resultado                    **"
        echo    "**                        8. Salir                               **"
        echo    "**                                                               **"
        echo    "*******************************************************************"
        echo    "*******************************************************************"
        echo    " "
        echo    "$texto$resultado$estado"
        echo    " "
        if [ ! -z "$estado" ] # Si el estado no esta vacio, es decir, si hay un error
            then
            read -p "Dime un numero: " numero1
            echo " "
        fi
        read -p "Dime la operacion que quieres aplicar: " opcion
        echo " "
        estado=""
        case $opcion in
        1)
        read -p "Dime otro numero: " numero2
        echo " "
        if [[ ! $numero2 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]] # Si el numero no es un numero
        then
            menu_comandos_calculadora "No has escrito un numero. "
        fi
        resultado=$(echo "scale=4; $numero1 + $numero2" | bc -l)
        numero1=$resultado
        texto="El resultado es: "
        ;;
        2)
        read -p "Dime otro numero: " numero2
        echo " "
        if [[ ! $numero2 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]
        then
            menu_comandos_calculadora "No has escrito un numero. "
        fi
        resultado=$(echo "scale=4; $numero1 - $numero2" | bc -l)
        numero1=$resultado
        texto="El resultado es: "
        ;;
        3)
        read -p "Dime otro numero: " numero2
        echo " "
        if [[ ! $numero2 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]] # Si el numero no es un numero
        then
            menu_comandos_calculadora "No has escrito un numero. "
        fi
        resultado=$(echo "scale=4; $numero1 * $numero2" | bc -l)
        numero1=$resultado
        texto="El resultado es: "
        ;;
        4)
        read -p "Dime otro numero: " numero2
        echo " "
        if [[ ! $numero2 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]]
        then
            menu_comandos_calculadora "No has escrito un numero. "
        fi
        if [ $numero2 -eq 0 ] # Si el numero es 0
        then
        estado="No se puede dividir entre 0"
        resultado=""
        texto=""
        else
        resultado=$(echo "scale=4; $numero1 / $numero2" | bc -l) 
        numero1=$resultado
        texto="El resultado es: "
        fi
        ;;
        5)
        read -p "A que numero lo quieres elevar?: " numero2
        echo " "
        if [[ ! $numero2 =~ ^[+-]?[0-9]+([.][0-9]+)?$ ]] # Si el numero no es un numero
        then
            menu_comandos_calculadora "No has escrito un numero. "
        fi
        resultado=$(echo "scale=4; $numero1^$numero2" | bc -l)
        numero1=$resultado
        texto="El resultado es: "
        ;;
        6)
        if [ $numero1 -lt 0 ]
        then
        estado="No se puede sacar la raiz cuadrada de un numero negativo"
        resultado=""
        texto=""
        else
        resultado=$(echo "scale=4; sqrt($numero1)" | bc -l) # Saca la raiz cuadrada
        numero1=$resultado
        texto="El resultado es: "
        fi
        ;;
        7)
        menu_comandos_calculadora
        ;;
        8)
        break;;
        esac
        clear
    done
    menu_principal
}
menu_juego(){
    # Esta funcion muestra el menu del juego
    COLOR_GREEN='\033[01;32m' # Color verde
    COLOR_WHITE='\033[01;37m' # Color blanco
    COLOR_RED='\033[01;31m' # Color rojo
    COLOR_BLUE='\033[01;34m' # Color azul
    array=( "" "" "" "" "" "" "" "" "")
    tic_array=()
    
    mensaje_ganar(){
        # Esta funcion muestra un mensaje de victoria
        echo -e "${COLOR_GREEN}Felicidades $USER_NO tu ganas!!${COLOR_WHITE}\n"
        echo -e "\nPulse una tecla para continuar ... \n"
        encabezado
        read
        menu_principal 
    }
     
    condicion_victoria(){
        # Esta funcion comprueba todas las posibles victorias
        
        if [ $CELL_VALUE == "$(echo "${array[0]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[1]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[2]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[3]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[4]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[5]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[6]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[7]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[8]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[0]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[3]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[6]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[1]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[4]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[7]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[2]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[5]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[8]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[0]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[4]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[8]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        elif [ $CELL_VALUE == "$(echo "${array[2]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[4]}" | grep -o $CELL_VALUE)" ] && [ $CELL_VALUE == "$(echo "${array[6]}" | grep -o $CELL_VALUE)" ] ; then
        mensaje_ganar
        fi
    }
       
    comprobar_tablero(){
        # Esta funcion comprueba si el tablero está lleno
        for k in `seq 0 $( expr ${#array[@]} - 1) `
        do
            if [ ! -z ${array[$k]} ] ; then # Comprueba si el elemento actual del arreglo "array" no está vacío.
            tic_array[$k]=$k # Si el elemento no está vacío, establece el valor del elemento actual como un elemento en el arreglo "tic_array" en la posición correspondiente.
                if [ "9" -eq ${#tic_array[@]} ] ; then # Verifica si el tamaño del arreglo "tic_array" es igual a 9
                    echo -e "\nTal vez tengas mejor suerte !!\n"
                    echo -e "\nPulse una tecla para continuar ... \n"
                    encabezado
                    read
                    menu_principal 
                    exit
                fi 
            fi
        done
    }
    
       
    tablero(){
        # Esta funcion muestra y crea el tablero
        clear
        echo -e "*************************"
        echo -e "*                       *"
        echo -e "*\t ${array[0]:-0} | ${array[1]:-1} | ${array[2]:-2}\t*"
        echo -e "*\t───────────\t*"
        echo -e "*\t ${array[3]:-3} | ${array[4]:-4} | ${array[5]:-5}\t*"
        echo -e "*\t───────────\t*"
        echo -e "*\t ${array[6]:-6} | ${array[7]:-7} | ${array[8]:-8}\t*"
        echo -e "*                       *"
        echo -e "*************************\n"
    }
         
    comprobacion_no_seleccioando(){
        # Esta funcion comprueba si el usuario ha seleccionado una celda vacía si no lo ha hecho, muestra un mensaje de error
        echo -e -n ""
        read -e -p "$MSG" col
            case "$col" in
                [0-8]) 
                    if [ -z ${array[$col]} ]; then
                        CELL_IS=empty
                    else 
                        CELL_IS=notempty 
                    fi;;
                *) 
                    MSG="$USER_NO Escribe un número entre 0 a 8 : "
                    comprobacion_no_seleccioando;;
            esac
        echo -e -n ""
    }
          
           
    reeplazar_valor(){ 
        # Esta funcion reemplaza el valor de la celda seleccionada por el usuario
        comprobacion_no_seleccioando
        if [ "$CELL_IS" == "empty" ]; then
            if [ "$CELL_VALUE" == "X" ]; then
                array[$col]="${COLOR_RED}$CELL_VALUE${COLOR_WHITE}"
            else
               array[$col]="${COLOR_BLUE}$CELL_VALUE${COLOR_WHITE}"
            fi
        else  
            MSG="La caja ya esta escrita, reescribe $USER_NO : "
            reeplazar_valor 
        fi
    }
            
    nombre_jugador () {
        # Esta funcion pide el nombre de los jugadores
        USER1=""
        USER2=""
        if [ -z $USER1 ]; then
            read -e -p "Introduce el nombre del primer jugador: " USER1
        fi
    
        if [ -z $USER2 ]; then
            read -e -p "Introduce el nombre del segundo jugador: " USER2
        fi
            
        if [ -z $USER1 ] ; then 
            echo -e "El nombre del jugandor no puede estar vacío" 
            nombre_jugador
        elif [ -z $USER2 ]; then
            echo -e "El nombre del jugandor no puede estar vacío" 
            nombre_jugador
        fi
    }
     
    # Aqui empieza el juego
    tablero
    echo -e "Bienvenido al juego Tic Tac toe"
    echo -e "La reglas son, introducir un número en la caja entre 0 a 8\n"
    read -p "Para continuar escribe 's' : " y
    echo -e "\n"
     
    if  [ "$y" == "s" ]  ||  [ "$y" == "S" ]; then
        clear
        echo -e ""
        nombre_jugador
    else
        echo -e "\nGracias por usarlo !!"
        echo -e "\nPulse una tecla para continuar ... \n"
        encabezado
        read
        menu_principal
    fi
                
    tablero
    while :
    do
        ((i++))
        value=`expr $i % 2`
        if  [ "$value" == "0" ]; then # Si el valor de la variable "value" es igual a 0, el usuario 1 juega. Lo que hacemos es hacer que se creen los turnos
            USER_NO=$USER1
            echo -n -e "${COLOR_RED}$USER_NO${COLOR_WHITE} introduce tu elección : "
            MSG=""
            CELL_VALUE="X"
            reeplazar_valor # Llamamos a la funcion reeplazar_valor
        else 
            USER_NO=$USER2
            echo -n -e "${COLOR_BLUE}$USER_NO${COLOR_WHITE} introduce tu elección : "
            MSG=""
            CELL_VALUE="O"
            reeplazar_valor # Llamamos a la funcion reeplazar_valor
        fi
        tablero
        condicion_victoria
        comprobar_tablero 
    done
}



mostrar_fichero_funcion(){
    # Esta funcion muestra el menu de mostrar fichero
    if [ "$(echo $1 | rev | cut -c 1 )" == "/" ] || [ -z $1 ] # Si el ultimo caracter de la ruta es un / o si la ruta esta vacia no añado el / al final de la ruta
    then
    ruta=$1
    else # Si no si que la añado
    ruta=$(echo "$1/") 
    fi

    echo -e "\n                        OPCIONES                                  "
    echo    "*******************************************************************"
    echo    "*******************************************************************"
    echo    "**                                                               **"
    echo    "**              1. Enumerar el fichero                           **" 
    echo    "**              2. Mostrar las ultimas n lineas                  **" 
    echo    "**              3. Mostrar las primeras n lineas                 **" 
    echo    "**                                                               **"
    echo    "*******************************************************************"
    echo    "*******************************************************************"
    echo    " "
    read -p "$3Dime la opcion que quieres aplicar: " opcion_modificador_mostrar_fichero
    
    
    case $opcion_modificador_mostrar_fichero in
    1)
    echo -e "\nEl contenido del fichero es: \n"
    cat -n $ruta$2 2> /dev/null # Muestro el contenido del fichero
    ;;
    2)
    read -p "Dime las ultimas n lineas que quieres mostrar: " n_lineas
    echo -e "\nEl contenido del fichero es: \n"
    cat -n $ruta$2 | tail -n $n_lineas 2> /dev/null # Muestro el contenido del fichero con las ultimas n lineas
    ;;
    3)
    read -p "Dime las primeras n lineas que quieres mostrar: " n_lineas
    echo -e "\nEl contenido del fichero es: \n"
    cat -n $ruta$2 | head -n $n_lineas  2> /dev/null # Muestro el contenido del fichero con las primeras n lineas
    ;;
    *) clear
    mostrar_fichero_funcion "$ruta" "$2" "Opcion incorrecta. " # Si la opcion es incorrecta vuelvo a mostrar el menu con el mensaje de error
    ;;
    esac
   
}



comprobacion () {
    # Esta funcion comprueba si el comando anterior se ha ejecutado correctamente
    if [ $? -eq 0 ] # Si el comando anterior se ha ejecutado correctamente
    then
        echo -e "\n$1 \n"



        if [ ! -z $3 ] # 
        then
            if [ ! -z $4 ] && [ "$(echo $4)" == "f" ]
            then
                if [ "$(echo $3 | cut -c 1)" == "/" ] || [ "$(echo $3 | cut -c 1)" == "." ]
                then
                    if [ $(echo $3 | rev | cut -d"/" -f 2- | rev | wc -m) -eq 1 ]
                    then
                        ls -la /    
                    else
                        ls -la $(echo $3 | rev | cut -d"/" -f 2- | rev)
                    fi
                fi
            elif [ ! -z $4 ] && [ "$(echo $4)" == "d" ]
            then
                ls -la $3
            else
                ls -la ./    
            fi
        fi





    else
        echo -e "\n$2 \n"
    fi
    

    
    
    
}
salir(){
    encabezado # Es una funcion para mejorar la apariencia del menu
    echo -e " \n Saliendo del programa con exito...\n"
    encabezado # Es una funcion para mejorar la apariencia del menu
    exit
}
encabezado (){
echo    "------------------------------------------------------------------------------------------------"

}

menu_principal