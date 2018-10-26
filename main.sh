#!/bin/bash

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LBLUE='\033[1;34m'
WHITE='\033[1;37m'
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

trocardono ()
{
	clear
	echo -e "${WHITE}Você está em:"
	echo -e "${WHITE}`pwd`"
	echo
	echo -e "${LBLUE}Digite o caminho até o arquivo ou diretório que deseja alterar:${NC}"
	read caminho
	
	if [ ! -f $caminho ] && [ ! -d $caminho ]
	then
		echo -e "\n${YELLOW}Arquivo/diretório não encontrado${NC}"
		read
		trocardono
	else
		echo $caminho
	fi
}

trocargrupo ()
{
	clear
	echo "Será implementado."
	read
}

trocarpermissao ()
{
	clear
	echo "Será implementado."
	read
}

permissoes ()
{
	clear
	echo -e "${LBLUE}Escolha uma das oções:"
	echo -e "${LGREEN}0${WHITE}) Voltar"
	echo -e "${LGREEN}a${WHITE}) Modificar o dono de um arquivo ou diretório"
	echo -e "${LGREEN}b${WHITE}) Modificar o grupo de um arquivo ou diretório"
	echo -e "${LGREEN}c${WHITE}) Modificar as permissões de um arquivo ou diretório${NC}"
	echo

	read opcao_permissoes
	case $opcao_permissoes in
		0) principal ;;
		a) trocardono ;;
		b) trocargrupo ;;
		c) trocarpermissao ;;
		*) echo -e "\n${YELLOW}Opção desconhecida${NC}" ; read; permissoes ;;
	esac
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
	echo -e "${LBLUE}Escolha uma das opções:"
	echo -e "${LGREEN}0${WHITE}) Fim"
	echo -e "${LGREEN}1${WHITE}) Grupo"
	echo -e "${LGREEN}2${WHITE}) Usuário"
	echo -e "${LGREEN}3${WHITE}) Permissões"
	echo -e "${LGREEN}9${WHITE}) Sobre${NC}"
	echo

	read opcao
	case $opcao in
		0) exit ;;
		1) grupo ;;
		2) usuario ;;
		3) permissoes ;;
		9) sobre ;;
		*) echo -e "\n${YELLOW}Opção desconhecida${NC}" ; read; principal ;;
	esac
}

principal
