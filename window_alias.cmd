@echo off
DOSKEY ls=dir
DOSKEY k=kubectl $*
DOSKEY d=docker $*
DOSKEY mk=minikube $*
DOSKEY h=helm $*