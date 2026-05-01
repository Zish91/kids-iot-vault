# Network Policy 🌐

This document defines the communication rules and the structural design of the project.

## Infrastructure Design (The Bridges)
In Proxmox, we use **Virtual Machine Bridges (vmbr)** which act as virtual switches.

- **vmbr0 (The Public Bridge)**: 
    - Connected to your physical network card and your home router.
    - Used for Proxmox management and Internet access.
- **vmbr1 (The Private Bridge)**: 
    - An isolated virtual switch with no physical cable attached.
    - Used for the IoT devices (Yoto, Lunii) to keep them in a "Vault".

##  Security Rules
1. **Isolation**: Devices on `vmbr1` are strictly forbidden from talking to `vmbr0` (your home network).
2. **The Gateway**: Home Assistant is the "Security Guard". It has two virtual cables: one in `vmbr0` and one in `vmbr1`.
3. **Traffic Control**: No internet access is allowed for `vmbr1` unless manually authorized via Home Assistant.
