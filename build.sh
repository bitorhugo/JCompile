#!/usr/bin/bash

# usage: jcompile -n <project name> -r <project root>
while [[ $# -gt 0 ]]; do
    command=$1
    input=$2
    shift
    shift
    
    case ${command} in
        -n) PROJECTNAME=$input
            echo "name :${PROJECTNAME}";;
        -r) PROJECTROOT=$input
            echo "root: ${PROJECTROOT}";;
         *)  echo "Invalid arguments"
    esac
done

find ${PROJECTROOT} -name "*.java" >> ${PROJECTROOT}/modules
javac @${PROJECTROOT}/modules -d ${PROJECTROOT}/out/
