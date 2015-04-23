#!/bin/bash

chmod 711 ~
chmod 711 public_html

path=$1

if [ -z $path ]; then
        path='.'
fi

file=''

for file in $path/*; do
        echo -n $file;
        if [[ $file = *.$* ]]; then
                continue;
        fi
        if [[ $file = *..$* ]]; then
                continue;
        fi
        if [ -d $file ]; then
                chmod 777 $file;
                if [[ $file = *runtime$* ]]; then
                        chmod 777 $file;
                fi
                if [[ $file = *assets$* ]]; then
                        chmod 777 $file;
                fi
                $0 $file;
        fi
        if [ -f $file ]; then
                chmod 555 $file;
        fi
done
