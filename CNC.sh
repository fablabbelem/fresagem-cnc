#!/bin/bash

clear
while true; do
echo "==========================================================
        Digite o número do componente a ser instalado:
        1 - Instalar Pacotes do bCNC
        2 - Remover Pacotes bCNC
        3 - Instalar Kicad
        4 - Instalar FreeCAD
	5 - Instalar Inkscape
        0 - Sair
==========================================================="
echo -n "->OPÇÃO:  "

read opcao

#verificar se foi digitada uma opcao
if [ -z $opcao ]; then
    echo "ERRO: digite uma opcao"
    exit
fi

case $opcao in
    1)
        sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install python-pip -y
	sudo pip install pyserial --upgrade
	sudo apt-get install python python-tk idle python-pmw python-imaging
	sudo apt-get install  git -y
	sudo git clone https://github.com/vlachoudis/bCNC.git;;
    2)
        sudo apt-get remove python-pip -y
        sudo apt-get remove python python-tk idle python-pmw python-imaging;;
    3)
        sudo add-apt-repository --yes ppa:js-reynaud/kicad-4 -y
	sudo apt-get update
	sudo apt-get install kicad -y;;
    4)
        sudo add-apt-repository ppa:freecad-maintainers/freecad-daily -y
    	sudo apt-get update
   	sudo apt-get upgrade -y
  	sudo apt-get install freecad-daily freecad-daily-doc -y;;
    5)
	sudo apt-get update
   	sudo apt-get upgrade -y
	sudo apt-get install inkscape -y;;
    0)
        echo "Saindo..."
        exit;;
    *)
        echo
        echo "ERRO: opção inválida"
        echo ;;
esac
done