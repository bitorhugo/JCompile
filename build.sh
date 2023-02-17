#!/usr/bin/bash

PROJECTNAME=
PROJECTROOT=

find ${PROJECTROOT} -name "*.java" >> ${PROJECTROOT}/modules
javac @${PROJECTROOT}/modules -d ${PROJECTROOT}/out/
