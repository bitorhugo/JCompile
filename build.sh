#!/usr/bin/bash

# usage: jcompile -n <project name> -r <project root
if [[ $# -eq 0 ]];then
   echo "usage: jcompile -n <project name> -r <project root>"
   return
fi
while [[ $# -gt 0 ]]; do
    command=$1
    input=$2
    shift
    shift
    
    case ${command} in
        -n) PROJECTNAME=$input
            echo "name: ${PROJECTNAME}";;
        -r) PROJECTROOT=$input
            echo "root: ${PROJECTROOT}";;
        *)  echo "Invalid arguments"
            return
    esac
done

rm -rf ${PROJECTROOT}/out/

find ${PROJECTROOT} -name "*.java" > ${PROJECTROOT}/modules
javac @${PROJECTROOT}/modules -d ${PROJECTROOT}/out/production/${PROJECTNAME}
