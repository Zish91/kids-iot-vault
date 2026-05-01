# Device List:

[🇫🇷 Version Française](list.fr.md)

---

## IoT Devices (Isolated):

These devices are intended for children and are isolated on the `vmbr1` network bridge.

- **Yoto Player**:
    - Function: Audio stories and music.
    - Connection: Wi-Fi (Dedicated VLAN).
- **Lunii**:
    - Function: Story factory.
    - Connection: Manual synchronization (Offline management).
- **Kobo**:
    - Function: E-reader.
    - Connection: Wi-Fi (Occasional access for downloads).

---

## Infrastructure:

- **Main Server**:
    - Role: Proxmox Host (Hypervisor).
    - System: Virtualization of Home Assistant and network services.
