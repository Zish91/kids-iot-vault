# Kids-IoT-Vault

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Language](https://img.shields.io/badge/Language-EN%20%7C%20FR-green)
![Status: Work in Progress](https://img.shields.io/badge/Status-En_Cours-orange)
![Made with: Home Assistant](https://img.shields.io/badge/Made_with-Home_Assistant-blue?logo=home-assistant)

> **Parce que les histoires de nos enfants ne devraient pas dépendre du cloud. Un projet libre pour reprendre le contrôle local !**

[Read in English 🇺🇸](README.md)

---

### À propos du projet

Inspiré par l'esprit du **Logiciel Libre**, ce projet vise à libérer tout le potentiel des appareils IoT éducatifs. L'idée est de s'affranchir des systèmes cloud fermés pour **redonner la priorité** à la souveraineté numérique et à la liberté d'utilisation.

L'objectif est de créer un pont entre le matériel propriétaire et le contrôle local. Cela permet de sécuriser le contenu numérique des enfants grâce à des sauvegardes locales et une intégration domotique intelligente. Il s'agit de rendre la technologie **durable, indépendante et réellement nôtre.**

##  Stack Technique & Infrastructure

*   **Hyperviseur :** Proxmox VE (Plateforme de virtualisation)
*   **Système Central :** Home Assistant OS (exécuté en tant que VM)
*   **Réseau :** Pont (Bridge) dédié pour les appareils IoT
*   **Matériel Cible :** PC reconditionné / Mini-PC (Architecture X86_64)

##  Stratégie de Développement

Le projet est construit en trois phases principales. Tout d'abord, la mise en place d'une couche de virtualisation professionnelle avec **Proxmox VE**. Cela permet d'avoir un environnement stable et évolutif où **Home Assistant** fait office de cerveau central de l'infrastructure.

Une fois le système de base opérationnel, l'effort se porte sur **l'intégration des appareils**. L'objectif est d'établir une communication sécurisée avec les objets connectés (comme la Yoto ou la Lunii) pour centraliser leur gestion.

Enfin, le projet vise à implémenter une **solution de sauvegarde locale**. En s'affranchissant de la dépendance au cloud, pour garantir que le contenu éducatif reste accessible et protégé au sein du réseau local, même sans accès internet.
