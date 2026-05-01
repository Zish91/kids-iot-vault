# Kids-IoT-Vault

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Language: FR](https://img.shields.io/badge/Language-Français-blue.svg)](README.fr.md)
![Status: Work in Progress](https://img.shields.io/badge/Status-Work_in_Progress-orange)
![Made with: Home Assistant](https://img.shields.io/badge/Made_with-Home_Assistant-blue?logo=home-assistant)

> **Secure infrastructure and digital vault for managing, backing up, and automating educational IoT devices via Home Assistant.**

[Afficher la version Française 🇫🇷](README.fr .md)

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
