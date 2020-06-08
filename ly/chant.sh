#!/bin/bash
TITRE=$(grep Titre: infos.txt | cut -d: -f2 | cut -c2-)
FICHIER=$(grep Fichier: infos.txt | cut -d: -f2 | cut -c2-)
cd ../..
./chant.sh "$FICHIER" "$TITRE"

cd -
cp ../../Fait/tmp.pdf ./$FICHIER.pdf
