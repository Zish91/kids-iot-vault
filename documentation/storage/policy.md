# Storage Policy:

[Version Française 🇫🇷](policy.fr.md)

This document defines the data organization and disk hierarchy for the project.

---

## Volume Organization:

The structure separates operating systems from user data to ensure efficient backups and system stability.

- **Local**:
    - Reserved for ISO images (installation files) and Container templates.

- **Local-LVM**:
    - Dedicated to Virtual Machine (VM) and Container (CT) disks.
    - Optimized for system performance and low-latency operations.

---

## Shares and Media:

Large data folders, such as media libraries for IoT devices (Yoto, Lunii), are managed separately.

- **Mount Points**: Home Assistant acts as the central gateway to access specific media directories.

- **Backups**: System snapshots and critical data are stored on a separate physical or logical support to allow recovery in case of disk failure.
