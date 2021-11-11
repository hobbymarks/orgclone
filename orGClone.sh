#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

LIMIT=500

################################################################################
# Check Requirements                                                 #
################################################################################
CheckEnv()
{
    # Check Requirements
    if ! command -v gh &> /dev/null
    then
        echo "github-cli not exist,please install github-cli first."
        echo "https://cli.github.com/"
        exit 1
    fi
}
################################################################################
# Help                                                                         #
################################################################################
Help()
{
    # Display Help
    echo "git clone all the repos of an organization."
    echo
    echo "Syntax: orgClone.sh [ -l NAME | -r NAME | -d DirPath | -h ]"
    echo "options:"
    echo "l     List all repos in the NAME organization one bye one."
    echo "r     Run git clone repo in the NAME organization one bye one."
    echo "d     Set Target Directory Path ,default is current directory." 
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
# Target Directory Path
targetDir="."

################################################################################
# List all repos in the org
################################################################################
ListRepos()
{
    pushd $PWD &> /dev/null
    cd $targetDir
    echo "********** all repos in $orgName:"
    repos=$(gh repo list $orgName -L $LIMIT | cut -f 1 | cut -d "/" -f 2)
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
    popd &> /dev/null
}
################################################################################
# Git clone all repos in the org
################################################################################
CloneRepos()
{
    pushd $PWD &> /dev/null
    cd $targetDir
    echo "********** all repos in $orgName:"
    repos=$(gh repo list $orgName -L $LIMIT | cut -f 1 | cut -d "/" -f 2)
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
    popd &> /dev/null
}
################################################################################
# Process the input options.                                                   #
################################################################################
# Check Environment
CheckEnv
# Get the options
while getopts ":hd:r:l:" option; do
    case $option in
        h) # Display Help
            Help
            exit;;
        d) # Target Directory
            targetDir=$OPTARG;;
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

