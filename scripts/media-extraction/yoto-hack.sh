#!/bin/bash

# ============================================================================ #
# Nom du script : yoto-hack.sh                                                 #
# Description    : Prépare et normalise les fichiers audio pour le Cloud Yoto. #
# ============================================================================ #

# Arrêt du script en cas d'erreur
set -e

# 1. Définition des variables (Chemins relatifs)
SOURCE_DIR="../../data/import/yoto-raw"
DEST_DIR="../../data/export/yoto-ready"

echo "--- Démarrage de la préparation Yoto ---"

# 2. Création des répertoires si inexistants
mkdir -p "$SOURCE_DIR"
mkdir -p "$DEST_DIR"

# 3. Boucle de traitement des fichiers MP3
for file in "$SOURCE_DIR"/*.mp3; do
    # Vérifier si des fichiers existent pour éviter l'erreur de boucle vide
    [ -e "$file" ] || continue

    # Extraction du nom de fichier sans le chemin
    filename=$(basename "$file")
    
    # Nettoyage : remplace les espaces par des underscores et supprime les caractères spéciaux
    clean_name=$(echo "$filename" | tr ' ' '_' | tr -cd '[:alnum:]_.-')

    echo "Traitement de : $filename -> $clean_name"

    # 4. Copie et renommage vers le dossier export
    cp "$file" "$DEST_DIR/$clean_name"
done

echo "--- Opération terminée avec succès ---"
echo "Les fichiers prêts sont dans : $DEST_DIR"
