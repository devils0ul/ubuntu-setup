#!/usr/bin/env bash
is_os_ubuntu=0
apt-get -v &> /dev/null && is_os_ubuntu=1

function installAptGetModuleIfNeeded(){
    type $@ &> /dev/null || (echo "apt-get install $@" && sudo apt-get install -y --fix-missing $@ &> /dev/null)
}

if [ $is_os_ubuntu == "1" ]
then
    echo "Ubuntu apt-get update..."
    sudo apt-get update -y &> /dev/null

    echo "Ubuntu apt-get install..."
    installAptGetModuleIfNeeded git
    installAptGetModuleIfNeeded vim
    installAptGetModuleIfNeeded curl
    installAptGetModuleIfNeeded tmux
    installAptGetModuleIfNeeded python
    installAptGetModuleIfNeeded tig
    installAptGetModuleIfNeeded unzip
    installAptGetModuleIfNeeded make
    # sudo apt-get install  -y --fix-missing g++
    # sudo apt-get install  -y --fix-missing mysql-client
    # sudo apt-get install  -y --fix-missing openjdk-8-jdk
    # sudo apt-get install  -y --fix-missing ant
    # sudo apt-get install  -y --fix-missing gradle
    # sudo apt-get install  -y --fix-missing maven
    #
    # sudo apt-get install  -y --fix-missing unzip
    # sudo apt-get install  -y --fix-missing make
    # sudo apt-get install  -y --fix-missing tig
    # sudo apt-get install  -y --fix-missing build-essential
    # sudo apt-get install  -y --fix-missing python-dev
    # sudo apt-get install  -y --fix-missing python-software-properties
    # sudo apt-get install  -y --fix-missing software-properties-common
    # sudo apt-get install  -y --fix-missing supervisor
    # sudo apt-get install  -y --fix-missing automake
    # sudo apt-get install  -y --fix-missing gnuplot

fi
