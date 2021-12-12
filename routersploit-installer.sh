#!/bin/bash

# Colors
green=`echo -n '\e[00;92m'`;
green_bold=`echo -n '\e[01;92m'`;
yellow=`echo -n '\e[0;93m'`;
blue=`echo -n '\e[01;96m'`;
clear_font=`echo -n '\e[00m'`;

# Header
clear
echo -e "";
echo -e "$yellow╔═════════════════════════════════════════════════════════════════╗$clear_font";
echo -e "$yellow║\t\t\t\t\t\t\t\t  ║$clear_font";
echo -e "$yellow║$clear_font$blue\t\t Routersploit installer for termux\t\t  $clear_font$yellow║$clear_font";
echo -e "$yellow║\t\t\t\t\t\t\t\t  ║\e[00m";
echo -e "$yellow╚═════════════════════════════════════════════════════════════════╝$clear_font";
echo -e "";


# Set up files
echo -e "cryptography==2.8 \nfuture \nrequests==2.21.0 \nparamiko \npysnmp==4.4.6 \npycryptodome" >>requirements.txt
echo -e "cryptography==2.8 \nfuture \nrequests==2.21.0 \nparamiko \npysnmp==4.4.6 \npycryptodome \npytest==4.4.0 \npytest-forked \npytest-xdist \nflake8 \ngit+git://github.com/threat9/threat9-test-bed" >>requirements-dev.txt

echo -e "$yellow[!]$clear_font Updating termux packages.";
sleep 2
apt update -y && apt upgrade -y

echo -e "$yellow[!]$clear_font Installing required packages.";
sleep 2
apt -y install autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl sed silversearcher-ag tar wget pkg-config python clang libcrypt libffi git openssl libsodium

echo -e "$yellow[!]$clear_font Installing required python modules.";
sleep 2
python -m pip install --upgrade pip
python -m pip install wheel
SODIUM_INSTALL=system pip install pynacl
pip install -r requirements.txt
pip install -r requirements-dev.txt

echo -e "$yellow[!]$clear_font Setting up routersploit.";
git clone https://github.com/threat9/routersploit 2>/dev/null
mv routersploit $HOME/ 2>/dev/null
rm -r requirements.txt requirements-dev.txt 2>/dev/null
echo "alias routersploit='python3 $HOME/routersploit/rsf.py'" >>$HOME/.bashrc
echo -e "$green[*]$clear_font Installation complete. $green_bold\nLaunch routersploit next time by executing: routersploit$clear_font"