# Network Rules (Firewall):

[🇫🇷 Version Française](rules.fr.md)

---

## Zone Definitions (VLANs):

To isolate the devices, we use two distinct zones:

1. **MANAGEMENT Zone (VLAN 10)**: 
   - Contains: Control station (your PC), Proxmox interface, Home Assistant.
   - Role: Administration and management.

2. **KIDS Zone (VLAN 20)**: 
   - Contains: Yoto Player, Kobo, Lunii.
   - Role: Isolated children's IoT devices.

---

## Traffic Matrix (Filtering):

| Source | Destination | Protocol | Status | Comment |
| :--- | :--- | :--- | :--- | :--- |
| **MANAGEMENT** | **KIDS** | All | ✅ Allowed | Device management from PC/HA. |
| **KIDS** | **MANAGEMENT** | All | ❌ Blocked | Total isolation of children's devices. |
| **KIDS** | **Internet** | HTTPS | ⚠️ Limited | Updates and story downloads. |
| **MANAGEMENT** | **Internet** | All | ✅ Allowed | Full access for administration. |

---

## Default Policy:

Following the "Zero Trust" security principle, any traffic not explicitly allowed in this table is **blocked by default**.
