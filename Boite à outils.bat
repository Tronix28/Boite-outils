@echo off


:: Activer les caractères spéciaux (UTF-8)
chcp 65001

title Boite à outils

cls

:menu
cls

echo ===============================================
echo       		Auteur : Tronix
echo ===============================================
echo.
echo.
echo ===============================================
echo       		Menu
echo ===============================================
echo 	[1] Outil Réseau
echo 	[2] Dépannage
echo 	[3] Processus Système		
echo 	[4] Informations Systèmes		    
echo 	[5] Quitter
echo 	[a] Shutdown la machine 
echo 	[b] Redémarrer la machine  
		
set /p choix=...

if %choix%==1 (
    goto Reseau
)

if %choix%==2 (
    goto Depannage
)

if %choix%==3 (
    goto Processus
)

if %choix%==4 (
    goto Infos
)

if %choix%==5 exit

if %choix%==a (
	cls
	echo Arrêt de la machine...
    shutdown /s
	exit
)

if %choix%==b (
	cls
	echo Redémarrage de la machine...
    shutdown /r
	exit
)

goto menu

:: le menu ou on peut faire notre choix

:Reseau
cls
echo ===============================================
echo       		Outils Réseau
echo ===============================================
echo 	[1] Afficher les informations réseau				    
echo 	[2] Ping une adresse IP						
echo 	[3] NetStat 
echo         [4] Retour au menu 
echo 	[5] Quitter                                 

set /p choice=...

if %choice%==1 (
    ipconfig
    pause
    goto Reseau
)

if %choice%==2 (
    :: Demande à l'utilisateur l'adresse IP
    set /p ipadress="Entrer l'ip à ping:"
    ping "%ipadress%"
    pause
    goto Reseau
)

if %choice%==3 (
    echo Connexions réseau actives :
    netstat   
    pause
    goto Reseau
)

if %choice%==4 (   
    goto menu
)

if %choice%==5 exit
goto menu

::Menu depannage

:Depannage
cls
echo ===============================================
echo       		Dépannage
echo ===============================================
echo 	[1] Analyse des disques				    
echo 	[2] Vérifier les fichiers systèmes						
echo 	[3] Lister les pilotes installés sur le système
echo         [4] Retour au menu 
echo 	[5] Quitter       

set /p choisi=...

if %choisi%==1 (
    echo Analyse des disques pour des erreurs...
    chkdsk  
    pause
    goto Depannage
)

if %choisi%==2 (
    echo Vérifications des fichiers systèmes en cours...
    sfc /scannow
    pause
    goto Depannage
)


if %choisi%==3 (
    driverquery | more
    pause
    goto Depannage
)

if %choisi%==4 (   
    goto menu
)

if %choisi%==5 exit
goto menu

::Menu Processus

:Processus
cls
echo ===============================================
echo       		Processus Systèmes
echo ===============================================
echo 	[1] Lister les processus				    
echo 	[2] Fermer une tâche						 
echo         [3] Retour au menu 
echo 	[4] Quitter                                 

set /p choixx=...

if %choixx%==1 (
    tasklist
    set /p pid="Entrez le PID du processus : "
    pause
    goto Processus
)

if %choixx%==2 (
    echo Rentrer d'abord un PID dans la commande [1]
    taskkill /PID %pid% /F
    pause
    goto Processus
)

if %choixx%==3 (   
    goto menu
)

if %choixx%==4 exit
goto menu

::Menu Informations Systèmes

:Infos
cls
echo ===============================================
echo       		Informations Systèmes
echo ===============================================
echo 	[1] Afficher la version actuelle de Windows
echo 	[2] Informations du Systèmes						 
echo         [3] Retour au menu 
echo 	[4] Quitter                                 

set /p choixi=...

if %choixi%==1 (
    echo Version Actuelle de Windows : 
    ver
    pause
    goto Infos
)

if %choixi%==2 (
    echo Informations du Système : 
    systeminfo
    pause
    goto Infos
)

if %choixi%==3 (   
    goto menu
)

if %choixi%==4 exit
goto menu

      