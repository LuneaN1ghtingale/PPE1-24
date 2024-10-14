#!/bin/bash

# Vérification des arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <année> <mois> <nombre de lieux>"
    exit 1
fi

annee=$1
mois=$2
nombre_lieux=$3

# Trouver les fichiers correspondants selon l'année et le mois
fichiers=$(ls *"$annee"*"$mois"*.ann 2>/dev/null)

# Vérification si des fichiers ont été trouvés
if [ -z "$fichiers" ]; then
    echo "Aucun fichier trouvé pour l'année $annee et le mois $mois."
    exit 1
fi

# Compter les occurrences des lieux
grep -h "Location" $fichiers | \
sed -E 's/.*Location: (.*)/\1/' | \
sort | \
uniq -c | \
sort -nr | \
head -n "$nombre_lieux" | \
awk '{print $2, $1}'  # Affiche le lieu et le nombre de citations
