#!/bin/bash

# Déclaration des années à analyser
annees=("2016" "2017" "2018")

# Boucle sur chaque année pour compter les occurrences
for annee in "${annees[@]}"; do
    # Compter les lignes contenant "Location" dans les fichiers *.ann pour l'année donnée
    count=$(grep -c "Location" *"$annee"*.ann 2>/dev/null || echo 0)
    
    # Afficher le résultat
    echo "Nombre de Locations pour l'année $annee : $count"
done
