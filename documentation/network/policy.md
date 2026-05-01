# Network Policy:

[🇫🇷 Version Française](policy.fr.md)

---

This document defines the communication rules and the technical structure of the project.

---

## Bridge Architecture:

Proxmox relies on **Virtual Machine Bridges (vmbr)**, acting as virtual switches.

- **vmbr0 (Public Bridge)**:
    - Connected to the physical network card and the internet box.
- **vmbr1 (Private Bridge)**:
    - Isolated virtual switch, with no physical link to the outside.

---

## Security Rules (Firewall):

**The Gateway**: **Home Assistant** is the unique point of passage between the two bridges.

| Source | Destination | Protocol | Status | Comment |
| :--- | :--- | :--- | :--- | :--- |
| **MANAGEMENT** | **KIDS** | All | ✅ Allowed | Management via Home Assistant. |
| **KIDS** | **MANAGEMENT** | All | ❌ Blocked | Strict isolation. |
| **KIDS** | **Internet** | HTTPS | ⚠️ Limited | Updates only. |

---

## Default Policy:

Anything not explicitly allowed above is **blocked by default**.
