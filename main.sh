#!/bin/bash

teste1 ()
{
	echo "teste1"
}

teste2 ()
{
	echo "teste2"
}

Principal ()
{
	echo "Digite um numero de 1 a 2"

	read opcao
	case $opcao in
		1) teste1 ;;
		2) teste2 ;;
		*) echo "Opção desconhecida." ; echo ; Principal ;;
	esac
}

Principal
