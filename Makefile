SHELL := /bin/bash

default: help

help:
	@echo "############"
	@echo "# dotfiles #"
	@echo "############"
	@printf "Available commands: \n	all:	Install all components\n\
		tmate:	Install tmate component\n\
		vim:	Install vim component\n"


tmate_exec:
	@./tmate/installation.sh

tmate: tmate_exec

vim_exec:
	@./vim/installation.sh

vim: vim_exec

all: tmate_exec vim_exec

.PHONY: default tmate vim all
