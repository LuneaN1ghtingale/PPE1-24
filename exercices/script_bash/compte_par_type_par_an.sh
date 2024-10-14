#!/bin/bash

# Vérification des arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <type>"
    exit 1
fi

type=$1
annees=("2016" "2017" "2018")

# Boucle sur chaque année pour lancer le premier script
for annee in "${annees[@]}"; do
    count=$(./compte_par_type.sh "$annee" "$type")
    echo "Nombre de $type pour l'année $annee : $count"
done
