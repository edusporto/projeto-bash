#!/bin/bash

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LBLUE='\033[1;34m'
NC='\033[0m' # No color

# Funções envolvendo grupos
grupo ()
{
	clear
	echo "Será implementado."
	read
}

# Funções envolvendo usuários
usuario ()
{
	clear
	echo "Será implementado"
	read
}

# Funções envolvendo permissões
permissoes ()
{
	clear
	echo "Será implementado"
	read
}

sobre ()
{
	clear
	echo -e "${YELLOW}Projeto desenvolvido por: "
	echo
	echo -e "${NC}17167 - Caio Petrucci dos Santos Rosa"
	echo -e "${LBLUE}https://www.github.com/caiopetruccirosa"
	echo
	echo -e "${NC}17170 - Eduardo Sandalo Porto"
	echo -e "${LBLUE}https://www.github.com/edusporto"
	echo
	echo -e "${YELLOW}O programa foi feito para funcionar em Debian."
	read
	principal
}

principal ()
{
	clear
	echo -e "${YELLOW}================================================"
	echo -e "${YELLOW}=               PROJETO - BASH                 ="
	echo -e "${YELLOW}================================================"
	echo
	echo -e "${LBLUE}ESCOLHA UMA DAS OPÇÕES"
	echo -e "${LGREEN}0${NC}) Fim"
	echo -e "${LGREEN}1${NC}) Grupo"
	echo -e "${LGREEN}2${NC}) Usuário"
	echo -e "${LGREEN}3${NC}) Permissões"
	echo -e "${LGREEN}9${NC}) Sobre"
	echo

	read opcao
	case $opcao in
		0) exit ;;
		1) grupo ;;
		2) usuario ;;
		3) permissoes ;;
		9) sobre ;;
		*) echo -e "\nOpção desconhecida." ; read; principal ;;
	esac
}

principal
