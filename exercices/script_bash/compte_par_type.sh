#!/bin/bash

# Vérification des arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <année> <type>"
    exit 1
fi

annee=$1
type=$2

# Compter les lignes contenant le type d'entité pour l'année spécifiée
count=$(grep -c "$type" *"$annee"*.ann 2>/dev/null || echo 0)

# Afficher uniquement le nombre
echo "$count"
