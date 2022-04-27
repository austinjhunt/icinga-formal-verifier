#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
# Script to automate the execution of nuXmv symbolic model checking against all component models (component/*/check.smv)
currpath=$(pwd)
for component in $(ls components/); do
    echo -e "${PURPLE}"
    echo -e "--------------------------------------------------------------"
    echo -e "------------ CHECKING MODEL FOR ${YELLOW}${component}${PURPLE} -----------------"
    echo -e "--------------------------------------------------------------"


    echo -e "Checking model for component ${YELLOW}$component${PURPLE}";
    sleep 0.1;
    path="${currpath}/components/$component/check.smv";
    logpath="logs/${component}.log"
    ./nuxmv $path > $logpath
    echo "Results written to $logpath";

    successful=$(grep -e 'true' $logpath)
    if [ ! -z "$successful" ] ; then
        echo -e "${YELLOW}$component ${GREEN}model meets the following specifications:";
        echo -e "$successful"
    fi

    failing=$(grep -e 'false' $logpath)
    if [ -z "$failing" ] ; then
        echo -e "${YELLOW}$component ${GREEN}model meets all specifications!";
    else
        echo -e "${YELLOW}$component ${RED}model failed to meet the following specifications:";
        echo -e "${RED}$failing";
    fi
    echo -e "${PURPLE}"
    echo -e "-----------------------------------------------------------------"
    echo -e "-------------- END MODEL CHECK FOR ${YELLOW}${component}${PURPLE} -----------------"
    echo -e "--------------------------------------------------------------"
    echo -e "${NC}"; echo "";
    sleep 0.5
done
