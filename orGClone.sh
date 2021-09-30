#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

LIMIT=500

################################################################################
# Help                                                                         #
################################################################################
Help()
{
    # Display Help
    echo "git clone all the repos of an organization."
    echo
    echo "Syntax: orgClone.sh [-l NAME | -r NAME |h]"
    echo "options:"
    echo "l     List all repos in the NAME organization one bye one."
    echo "r     Run git clone repo in the NAME organization one bye one."
    echo "h     Print this Help."
    #echo "v     Verbose mode."
    #echo "V     Print software version and exit."
    echo
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################

# Orgnization Name
orgName=""

################################################################################
# List all repos in the org
################################################################################
ListRepos()
{
     echo "********** all repos in $orgName:"
     repos=$(gh repo list $orgName -L $LIMIT | grep $orgName | cut -f 1 | cut -d "/" -f 2)
     idx=1
     while IFS= read -r line
     do
         if [[ -d $line ]] || [[ -d $line@$orgName ]]
         then
             echo -e "${GREEN}==>${NC}"$idx:$line
         else
             echo -e "${RED}-->${NC}"$idx:$line
         fi
         ((idx = idx + 1))
     done <<<"$repos"
}
################################################################################
# Git clone all repos in the org
################################################################################
CloneRepos()
{
     echo "********** all repos in $orgName:"
     repos=$(gh repo list $orgName -L $LIMIT | grep $orgName | cut -f 1 | cut -d "/" -f 2)
     idx=1
     while IFS= read -r line
     do
         if [[ -d $line ]] || [[ -d $line@$orgName ]]
         then
             echo -e "${GREEN}==>${NC}"$idx:$line
         else
             echo -e "${RED}-->${NC}"$idx:$line
             git clone https://github.com/$orgName/$line.git
         fi
         ((idx = idx + 1))
     done <<<"$repos"
}
################################################################################
# Process the input options.                                                   #
################################################################################
# Get the options
while getopts ":hr:l:" option; do
    case $option in
        h) # Display Help
            Help
            exit;;
        r) # Git clone all repos in the org
            orgName=$OPTARG
            CloneRepos
            exit;;
        l) # List all repos
            orgName=$OPTARG
            ListRepos
            exit;;
        \?) # Invalid option
            echo "Error: Invalid option."
            exit;;
    esac
done

################################################################################
#future Features
################################################################################
#-->get all repos count
#add:   Thu Sep 30 17:29:27 HKT 2021
#state:
#finished:
#-->interactive select to clone
#add:   Thu Sep 30 17:30:09 HKT 2021
#state:
#finished:
#-->
#
#
#

