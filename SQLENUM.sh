#!/bin/bash
echo "what is the IP?"
read IP
echo "what is the username?"
read USER
echo "what is the password?"
read PASSWORD
echo "What is the port?"
read PORT

#nmap script mysql-info
echo "Nmap SQL INFO" > {$IP}{$USER}SQLENUM.txt
nmap $IP -p $PORT --script mysql-info --append-output -oN {$IP}{$USER}SQLENUM.txt

#nmap script users
echo "Nmap script Users" >> {$IP}{$USER}SQLENUM.txt
nmap $IP -p $PORT --script mysql-users --script-args="mysqluser='$USER',mysqlpass=$PASSWORD" --append-output -oN {$IP}{$USER}SQLENUM.txt

#nmap script empty passwords
echo "Nmap script empty passwords"
nmap $IP -p $PORT --script mysql-empty-password --append-output -oN {$IP}{$USER}SQLENUM.txt

#nmap script databases
echo "Nmap script databases" >> {$IP}{$USER}SQLENUM.txt
nmap $IP -p $PORT --script mysql-databases --script-args="mysqluser='$USER',mysqlpass=$PASSWORD" --append-output -oN {$IP}{$USER}SQLENUM.txt

#nmap script variables
echo "Nmap script variables" >> {$IP}{$USER}SQLENUM.txt
nmap $IP -p $PORT --script mysql-variables --script-args="mysqluser='$USER',mysqlpass=$PASSWORD" --append-output -oN {$IP}{$USER}SQLENUM.txt


#nmap script audit
echo "Nmap script audit" >> {$IP}{$USER}SQLENUM.txt
nmap $IP -p $PORT --script mysql-audit --script-args "mysql-audit.username='$USER',mysql-audit.password=$PASSWORD,mysql-audit.filename='/usr/share/nmap/nselib/data/mysql-cis.audit'" --append-output -oN {$IP}{$USER}SQLENUM.txt


