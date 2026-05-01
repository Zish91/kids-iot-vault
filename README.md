# Kids-IoT-Vault

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Language](https://img.shields.io/badge/Language-EN%20%7C%20FR-green)
![Status: Work in Progress](https://img.shields.io/badge/Status-Work_in_Progress-orange)
![Made with: Home Assistant](https://img.shields.io/badge/Made_with-Home_Assistant-blue?logo=home-assistant)

> **Secure infrastructure and digital vault for managing, backing up, and automating educational IoT devices via Home Assistant.**

[Afficher la version Française 🇫🇷](README.fr.md)

---

About the Project:

Driven by the open-source spirit, this project aims to unlock the full potential of educational IoT devices. Instead of relying on closed cloud systems, we focus on digital sovereignty and freedom of use.

The goal is to build a bridge between proprietary hardware and local control, allowing parents to secure their children's digital content through local backups and smart home integration. This is about making technology sustainable, independent, and truly ours.

## Tech Stack & Infrastructure

*   **Hypervisor:** Proxmox VE (Virtualization Platform)
*   **Core System:** Home Assistant OS (running as a VM)
*   **Networking:** Dedicated Bridge for IoT devices
*   **Target Hardware:** X86_64 Refurbished PC / Mini-PC

## Development Strategy

The project is being built in three main phases. First, I am setting up a professional-grade virtualization layer using Proxmox VE. This allows for a stable and scalable environment where Home Assistant runs as the central brain of the infrastructure.

Once the core system is operational, the focus shifts to device integration. The goal is to establish secure communication with IoT devices (like Yoto or Lunii) to centralize their management.

Finally, the project aims to implement a local backup solution. By moving away from cloud dependency, we ensure that educational content remains accessible and protected within our own local network, even without internet access.

---

### Repository Structure

*   **data/**: Media storage (ignored by Git via `.gitignore`).
    *   `import/yoto-raw/`: Source folder for raw MP3 files.
    *   `export/yoto-ready/`: Cleaned files ready for the device.
*   **scripts/media-extraction/**: Contains `yoto-hack.sh`.
*   **documentation/**: Detailed guides and infrastructure diagrams.

---

### Quick Start

1. **Clone the project**:
`git clone https://github.com/YOUR_USER/Kids-IoT-Vault.git`

2. **Prepare the directory structure**:
`mkdir -p data/import/yoto-raw data/export/yoto-ready`

3. **Run the cleaning script**:
`bash scripts/media-extraction/yoto-hack.sh`
*(This script automates renaming: removing accents, spaces, and special characters for perfect hardware compatibility).*

---

### Development Strategy & Best Practices

The project is built in three main phases: virtualization with **Proxmox**, device integration, and local backup.

Every action on this repository follows a strict progression:
*   **Step-by-step**: No massive code generation without prior explanation.
*   **Atomicity**: Each script serves a specific, documented need.
*   **Sovereignty**: Local processing is prioritized to ensure permanent access to content.

---




