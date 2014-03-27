#!/bin/bash
# wPtoGit
# @dimtac
# Name idea : @adrian_vaucoret ;-)
####################################### 
#######	SCRIPT DE MIGRATION WORDPRESS
######################################

#--------------------------------------------
# GIT Repository
repo=https://github.com/DimTac/H3P2016-G2.git
# SQL repository
sql=sql/sql.sql
#Dossier
dossier=/
#Database
login=root
pass=root
base=ecoisolation
#binaire mysql
mysql=/Applications/MAMP/Library/bin/mysql
#-------------------------------------------

###	Initialisation du repo
if  [ $1 = "-i" ]
then
	echo "Initialisation du repo"
	git clone $repo
fi

### Pull du repo
if [ $1 = "-p" ]
then
	echo "Pull du repo"
	#git pull $repo 

	#maj de la BDD
	echo "Maj de la BDD"
	#supression base
	$mysql -u$login -p$pass -se"DROP DATABASE IF EXISTS $base"
	#creation base
	$mysql -u$login -p$pass -se"CREATE DATABASE $base"
	#dump base
	#$mysql -u$login -p$pass $base < $sql

fi


exit 0
