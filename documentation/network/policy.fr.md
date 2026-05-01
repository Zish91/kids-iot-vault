# Politique Réseau (Network Policy) :

[🇺🇸 English Version](policy.md)

---

Ce document définit les règles de communication et la structure technique du projet.

---

## Architecture des Ponts (Bridges) :

Proxmox s'appuie sur des **Virtual Machine Bridges (vmbr)**, agissant comme des commutateurs (switches) virtuels.  

- **vmbr0 (Le Pont Public)** :
    - Relié à la carte réseau physique et à la box internet.
- **vmbr1 (Le Pont Privé)** :
    - Commutateur virtuel isolé, sans lien physique avec l'extérieur.

---

## Règles de Sécurité (Firewall) :

**La Passerelle (Gateway)** : **Home Assistant** est l'unique point de passage entre les deux ponts.

| Source | Destination | Protocole | État | Commentaire |
| :--- | :--- | :--- | :--- | :--- |
| **GESTION** | **KIDS** | Tous | ✅ Autorisé | Pilotage via Home Assistant. |
| **KIDS** | **GESTION** | Tous | ❌ Bloqué | Isolation stricte. |
| **KIDS** | **Internet** | HTTPS | ⚠️ Limité | Mises à jour uniquement. |

---

## Politique par défaut :

Tout ce qui n'est pas explicitement autorisé ci-dessus est **bloqué par défaut**.
