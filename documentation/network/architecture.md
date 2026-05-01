# Network Architecture

[Version Française 🇫🇷](architechture.fr.md)

---

## Infrastructure Diagram

```mermaid
graph TD
    Internet([🌐 Internet]) --> Box[Home Router / Box]
    Box --> vmbr0[vmbr0 - Public Bridge\n192.168.1.0/24]

    vmbr0 --> Proxmox[Proxmox VE\nHypervisor - Bare Metal]

    subgraph Proxmox VE
        Proxmox --> HA[Home Assistant OS\nGateway & Brain]
        Proxmox --> DNS[DNS Server\nLocal Resolution]
    end

    HA --> vmbr1[vmbr1 - Private Bridge\n192.168.2.0/24]

    subgraph Kids Network - Isolated
        vmbr1 --> Yoto[Yoto Player\nAudio Stories]
        vmbr1 --> Lunii[Lunii\nOffline - Manual Sync]
        vmbr1 --> Kobo[Kobo\nE-Reader]
    end

    style vmbr1 fill:#ff6b6b,color:#fff
    style vmbr0 fill:#4ecdc4,color:#fff
    style HA fill:#45b7d1,color:#fff
    style Proxmox fill:#2c3e50,color:#fff
```

---

## Network Segments

| Segment | Bridge | Subnet | Role |
|---|---|---|---|
| **MANAGEMENT** | vmbr0 | 192.168.1.0/24 | Admin, Home Assistant, Proxmox |
| **KIDS** | vmbr1 | 192.168.2.0/24 | IoT devices, isolated |

---

## Traffic Flow

```
[Kids Devices] --> [Home Assistant] --> [Internet]
                        ↑
                  Only gateway
                  between networks
```

- Kids devices **cannot** reach the management network directly
- Home Assistant is the **only** bridge between both networks
- Internet access from Kids network is **limited to HTTPS updates only**

---

## Key Design Principles

- **Network isolation** : IoT devices on a dedicated private bridge
- **Single gateway** : Home Assistant controls all inter-network traffic
- **Deny by default** : Everything not explicitly allowed is blocked
- **Local sovereignty** : Content served locally, no cloud dependency
