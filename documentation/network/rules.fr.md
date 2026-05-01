# Règles Réseau (Firewall) :

[🇺🇸 English Version](rules.md)

---

## Définition des Zones (VLANs) :

Pour isoler les équipements, nous utilisons deux zones distinctes :

1. **Zone GESTION (VLAN 10)** : 
   - Contient : Poste de contrôle (ton PC), Interface Proxmox, Home Assistant.
   - Rôle : Administration et pilotage.

2. **Zone KIDS (VLAN 20)** : 
   - Contient : Yoto Player, Kobo, Lunii.
   - Rôle : Objets connectés enfants (Isolés).

---

## Tableau des Flux (Filtrage) :

| Source | Destination | Protocole | État | Commentaire |
| :--- | :--- | :--- | :--- | :--- |
| **GESTION** | **KIDS** | Tous | ✅ Autorisé | Pilotage des appareils depuis le PC/HA. |
| **KIDS** | **GESTION** | Tous | ❌ Bloqué | Isolation totale des équipements enfants. |
| **KIDS** | **Internet** | HTTPS | ⚠️ Limité | Mises à jour et téléchargement d'histoires. |
| **GESTION** | **Internet** | Tous | ✅ Autorisé | Accès complet pour l'administration. |

---

## Politique par défaut :

Par mesure de sécurité ("Zero Trust"), tout ce qui n'est pas explicitement autorisé dans ce tableau est **bloqué par défaut**.
