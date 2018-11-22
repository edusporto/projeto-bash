#!/bin/bash

# Cores
RED='\033[0;31m'
LRED='\033[1;31m'
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

	main
}



# Funções envolvendo usuários
usuario ()
{
	clear
	echo "Será implementado"
	read

	main
}



# Funções envolvendo permissões

trocardono ()
{
	clear
	echo -e "${YELLOW}Você está em:"
	echo -e "${WHITE}`pwd`"
	echo
	echo -e "${YELLOW}Arquivos neste diretório:"
	echo -e "${WHITE}`ls -la`"
	echo
	echo -e "${LBLUE}Digite o caminho até o arquivo ou diretório que deseja alterar:${NC}"
	read caminho
	
	if [ ! -f $caminho ] && [ ! -d $caminho ] || [ -z $caminho ]
	then
		echo -e "\n${LRED}Arquivo/diretório não encontrado${NC}"
		read
		permissoes
	else
		echo -e "${LBLUE}Digite o novo dono do arquivo:${NC}"
		read novodono

		if chown $novodono $caminho
		then
			echo
			echo -e "${GREEN}Dono do arquivo trocado com sucesso!${NC}"
			read
			permissoes
		else
			echo
			echo -e "${LRED}Ocorreu um erro!${NC}"
			read
			permissoes
		fi
	fi
}

trocargrupo ()
{
	clear
	echo -e "${YELLOW}Você está em:"
	echo -e "${WHITE}`pwd`"
	echo
	echo -e "${YELLOW}Arquivos neste diretório:"
	echo -e "${WHITE}`ls -la`"
	echo
	echo -e "${LBLUE}Digite o caminho até o arquivo ou diretório que deseja alterar:${NC}"
	read caminho
	
	if [ ! -f $caminho ] && [ ! -d $caminho ] || [ -z $caminho ]
	then
		echo -e "\n${LRED}Arquivo/diretório não encontrado${NC}"
		read
		permissoes
	else
		echo -e "${LBLUE}Digite o novo grupo do arquivo:${NC}"
		read novogrupo

		if chgrp $novogrupo $caminho
		then
			echo
			echo -e "${GREEN}Grupo do arquivo trocado com sucesso!${NC}"
			read
			permissoes
		else
			echo
			echo -e "${LRED}Ocorreu um erro!${NC}"
			read
			permissoes
		fi
	fi
}

perguntarpermissao ()
{
	echo -e "${LGREEN}1${WHITE}) Nenhuma permissão"
	echo -e "${LGREEN}2${WHITE}) Apenas execução"
	echo -e "${LGREEN}3${WHITE}) Apenas escrita"
	echo -e "${LGREEN}4${WHITE}) Escrita e execução"
	echo -e "${LGREEN}5${WHITE}) Leitura"
	echo -e "${LGREEN}6${WHITE}) Leitura e execução"
	echo -e "${LGREEN}7${WHITE}) Leitura e escrita"
	echo -e "${LGREEN}8${WHITE}) Leitura, escrita e execução"
	echo -e "${LGREEN}0${WHITE}) Cancelar"
	echo
	read permissaoselecionada

	case $permissaoselecionada in
		[1-8]) resultadopermissao=$(($permissaoselecionada-1)) ; return 0 ;;
		*) echo -e "${LRED}Opção desconhecida!${NC}" ; resultadopermissao='-1' ; read; return 1 ;;
	esac
}

trocarpermissao ()
{
	clear
	echo -e "${YELLOW}Você está em:"
	echo -e "${WHITE}`pwd`"
	echo
	echo -e "${YELLOW}Arquivos neste diretório:"
	echo -e "${WHITE}`ls -la`"
	echo
	echo -e "${LBLUE}Digite o caminho até o arquivo ou diretório que deseja alterar:${NC}"
	read caminho

	if [ ! -f $caminho ] && [ ! -d $caminho ] || [ -z $caminho ]
	then
		echo -e "\n${LRED}Arquivo/diretório não encontrado${NC}"
		read
		permissoes
	else
		echo
		echo -e "${LBLUE}Selecione as permissões do dono do arquivo:"

		resultadopermissao=-1
		permissoesselecionadas=""
		if perguntarpermissao
		then
			permissoesselecionadas="$permissoesselecionadas$resultadopermissao"
			echo
			echo -e "${LBLUE}Selecione as permissões do grupo do arquivo:"

			if perguntarpermissao
			then
				permissoesselecionadas="$permissoesselecionadas$resultadopermissao"
				echo
				echo -e "${LBLUE}Selecione as permissões dos outros usuários:"

				if perguntarpermissao
				then
					permissoesselecionadas="$permissoesselecionadas$resultadopermissao"
					echo
					
					if chmod $permissoesselecionadas $caminho
					then
						echo -e "${GREEN}Permissões alteradas com sucesso!"
					else
						echo -e "${LRED}Ocorreu algum erro!"
					fi
					read
					permissoes
				fi
			fi
		else
			permissoes
		fi
	fi
}

permissoes ()
{
	clear
	echo -e "${LBLUE}Escolha uma das oções:"
	echo -e "${LGREEN}a${WHITE}) Modificar o dono de um arquivo ou diretório"
	echo -e "${LGREEN}b${WHITE}) Modificar o grupo de um arquivo ou diretório"
	echo -e "${LGREEN}c${WHITE}) Modificar as permissões de um arquivo ou diretório${NC}"
	echo -e "${LGREEN}0${WHITE}) Voltar"
	echo

	read opcao_permissoes
	case $opcao_permissoes in
		0) main ;;
		a|A) trocardono ;;
		b|B) trocargrupo ;;
		c|C) trocarpermissao ;;
		*) echo -e "${LRED}Opção desconhecida!${NC}" ; read; permissoes ;;
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

	main
}

main ()
{
	clear
	echo -e "${YELLOW}================================================"
	echo -e "${YELLOW}=               PROJETO - BASH                 ="
	echo -e "${YELLOW}================================================"
	echo

	if [ $EUID -ne 0 ] # checa se é o root
		then
		echo -e "${LRED}Este programa precisa ser executado pelo usuário root"
		echo -e "Execute o comando 'su' e tente novamente${NC}"
		read
		exit
	fi

	echo -e "${LBLUE}Escolha uma das opções:"
	echo -e "${LGREEN}1${WHITE}) Grupo"
	echo -e "${LGREEN}2${WHITE}) Usuário"
	echo -e "${LGREEN}3${WHITE}) Permissões"
	echo -e "${LGREEN}9${WHITE}) Sobre${NC}"
	echo -e "${LGREEN}0${WHITE}) Sair"
	echo

	read opcao
	case $opcao in
		0) exit ;;
		1) grupo ;;
		2) usuario ;;
		3) permissoes ;;
		9) sobre ;;
		*) echo -e "${LRED}Opção desconhecida!${NC}" ; read; main ;;
	esac
}

main
