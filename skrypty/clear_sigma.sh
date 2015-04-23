#!/bin/bash

usuwamy='.cache .local'

for plik in $usuwamy; do
  if [ -d ~/$plik ]; then
    rm ~/$plik -R;
  fi
done
