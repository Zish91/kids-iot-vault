# Politique de Stockage :

[English Version 🇺🇸](policy.md)

---

Ce document définit l'organisation des données et la hiérarchie des disques du projet.

---

## Organisation des Volumes :

La structure sépare les systèmes d'exploitation des données utilisateur pour garantir des sauvegardes efficaces et la stabilité du système.

- **Local** :
    - Réservé aux images ISO (fichiers d'installation) et aux modèles de conteneurs.

- **Local-LVM** :
    - Dédié aux disques des machines virtuelles (VM) et des conteneurs (CT).
    - Optimisé pour les performances système et une faible latence.

---

## Partages et Médias :

Les dossiers de données volumineux, comme les bibliothèques médias pour les objets connectés (Yoto, Lunii), sont gérés séparément.

- **Points de Montage** : Home Assistant sert de passerelle centrale pour accéder aux répertoires médias spécifiques.

- **Sauvegardes (Backups)** : Les instantanés système et les données critiques sont stockés sur un support physique ou logique distinct pour permettre une restauration en cas de panne disque.
