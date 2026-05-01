# Architecture Réseau

[English Version 🇺🇸](architecture.md)

---

## Schéma d'Infrastructure

```mermaid
graph TD
    Internet([🌐 Internet]) --> Box[Routeur / Box Internet]
    Box --> vmbr0[vmbr0 - Pont Public\n192.168.1.0/24]

    vmbr0 --> Proxmox[Proxmox VE\nHyperviseur - Bare Metal]

    subgraph Proxmox VE
        Proxmox --> HA[Home Assistant OS\nPasserelle & Cerveau]
        Proxmox --> DNS[Serveur DNS\nRésolution Locale]
    end

    HA --> vmbr1[vmbr1 - Pont Privé\n192.168.2.0/24]

    subgraph Réseau Enfants - Isolé
        vmbr1 --> Yoto[Yoto Player\nHistoires Audio]
        vmbr1 --> Lunii[Lunii\nHors-ligne - Sync Manuelle]
        vmbr1 --> Kobo[Kobo\nLiseuse Numérique]
    end

    style vmbr1 fill:#ff6b6b,color:#fff
    style vmbr0 fill:#4ecdc4,color:#fff
    style HA fill:#45b7d1,color:#fff
    style Proxmox fill:#2c3e50,color:#fff
```

---

## Segments Réseau

| Segment | Pont | Sous-réseau | Rôle |
|---|---|---|---|
| **GESTION** | vmbr0 | 192.168.1.0/24 | Admin, Home Assistant, Proxmox |
| **KIDS** | vmbr1 | 192.168.2.0/24 | Appareils IoT, isolés |

---

## Flux de Communication

```
[Appareils Enfants] --> [Home Assistant] --> [Internet]
                               ↑
                        Seul point de passage
                        entre les deux réseaux
```

- Les appareils enfants **ne peuvent pas** atteindre le réseau de gestion directement
- Home Assistant est **l'unique passerelle** entre les deux réseaux
- L'accès Internet depuis le réseau KIDS est **limité au HTTPS pour les mises à jour uniquement**

---

## Principes de Conception

- **Isolation réseau** : Les appareils IoT sur un pont privé dédié
- **Passerelle unique** : Home Assistant contrôle tout le trafic inter-réseaux
- **Blocage par défaut** : Tout ce qui n'est pas explicitement autorisé est bloqué
- **Souveraineté locale** : Contenu servi localement, sans dépendance au cloud
