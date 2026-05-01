# Politique Réseau (Network Policy) :

Ce document définit les règles de communication et la structure technique du projet.

---

## Architecture des Ponts (Bridges):  

Proxmox s'appuie sur des **Virtual Machine Bridges (vmbr)**, agissant comme des commutateurs (switches) virtuels.  

- **vmbr0 (Le Pont Public)** :
    - Relié à la carte réseau physique et à la box internet.
    - Dédié à l'administration de Proxmox et à l'accès Web.  
      
- **vmbr1 (Le Pont Privé)** :
    - Commutateur virtuel isolé, sans lien physique avec l'extérieur.
    - Dédié aux appareils IoT (Yoto, Lunii) pour les isoler du réseau domestique.

---

##  Règles de Sécurité:

**Isolation** : Les appareils sur `vmbr1` ne peuvent pas initier de connexion vers `vmbr0`.
**La Passerelle (Gateway)** : **Home Assistant** est l'unique point de passage entre les deux ponts. Il assure le rôle de traducteur et de barrière.
**Contrôle Internet** : L'accès extérieur pour le `vmbr1` est désactivé par défaut. Toute exception (mises à jour) est gérée manuellement via Home Assistant.

---
