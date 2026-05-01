#!/bin/bash

# ============================================================================ #
# Nom du script : yoto-hack.sh V2                                              #
# Description    : Prépare et normalise les fichiers audio pour le Cloud Yoto. #
# Améliorations : gestion accents, doublons, compteur, skip si déjà exporté.   #
# ============================================================================ #

# Arrêt du script en cas d'erreur
set -e

# 1. Définition des variables (chemins relatifs)
SOURCE_DIR="../../data/import/yoto-raw"
DEST_DIR="../../data/export/yoto-ready"

# Compteurs
count_ok=0
count_skip=0
count_duplicate=0

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

    # Nettoyage :
    # 1. iconv     → convertit les accents en ASCII (é→e, à→a, ç→c)
    # 2. tr ' ' '_' → remplace les espaces par des underscores
    # 3. tr -cd    → supprime les caractères spéciaux restants
    clean_name=$(echo "$filename" | iconv -f UTF-8 -t ASCII//TRANSLIT | tr ' ' '_' | tr -cd '[:alnum:]_.-')

    # Gestion des doublons : si le fichier existe déjà dans DEST_DIR, on renomme
    dest_file="$DEST_DIR/$clean_name"
    if [ -e "$dest_file" ]; then
        base="${clean_name%.mp3}"
        clean_name="${base}_duplicate.mp3"
        dest_file="$DEST_DIR/$clean_name"
        echo "[WARN]    Doublon detecte : $filename -> renomme en $clean_name"
        count_duplicate=$((count_duplicate + 1))
    fi

    # Skip si le fichier est déjà exporté (nom propre identique)
    if [ -e "$DEST_DIR/$clean_name" ] && [ "$file" -nt "$DEST_DIR/$clean_name" ] || [ ! -e "$DEST_DIR/$clean_name" ]; then
        echo "[OK]      Traitement : $filename -> $clean_name"
        cp "$file" "$dest_file"
        count_ok=$((count_ok + 1))
    else
        echo "[SKIP]    Deja exporte : $clean_name"
        count_skip=$((count_skip + 1))
    fi

done

# 4. Rapport final
echo ""
echo "--- Operation terminee ---"
echo "[OK]      Traites  : $count_ok fichier(s)"
echo "[SKIP]    Ignores  : $count_skip fichier(s) deja exportes"
echo "[WARN]    Doublons : $count_duplicate fichier(s) renommes"
echo "[INFO]    Fichiers prets dans : $DEST_DIR"
