# 🌤️ Station Météo Intelligente avec FPGA & LoRa

Ce projet consiste à développer une station météo embarquée basée sur une puce **FPGA Xilinx Artix-7** (maquette **Basys3**), capable de mesurer la température et de transmettre les données à distance via **LoRa** à un **Raspberry Pi**, avec une interface utilisateur développée sur **Node-RED**. Une **IHM locale** est également disponible sur écran **LCD I2C**.

---

## 🧠 Objectifs

- Apprentissage du développement matériel avec **VHDL** sur **FPGA**.
- Intégration de capteurs via **I2C**.
- Transmission des données sans fil via **LoRa**.
- Création d'une interface de visualisation **graphique** (Node-RED).
- Affichage local sur un écran **LCD**.
- Communication à distance via **IP** ou **cloud local**.

---

## 🧱 Matériel utilisé

| Composant         | Référence/Modèle            |
|-------------------|-----------------------------|
| FPGA              | Basys 3 (Xilinx Artix-7)     |
| Capteur Température | BME280 (I2C)                |
| Écran LCD         | Velleman VMA450 (I2C)        |
| Module LoRa       | Compatible UART/SPI         |
| Raspberry Pi      | Modèle 3/4 recommandé        |
| Module Bluetooth (optionnel) | Velleman VMA302         |

---

## 🔌 Schéma de communication
``` mermaid
graph TD
    B["BME280"] -->|"I2C"| A["FPGA"]
    A -->|"I2C"| C["LCD VMA450"]
    A -->|"SPI"| D["Module LoRa"]
    D -->|"Protocol LoRaWAN 868MHz"| E["Raspberry Pi"]
    E --> F["Interface Node-RED"]
    C --> G["Utilisateur"]
    F --> H["Écran Tactile"]
    H --> G["Utilisateur"]
    
    style A fill:#f9f,stroke:#333,stroke-width:4px
    style E fill:#bbf,stroke:#333,stroke-width:2px
    style G fill:#bfb,stroke:#333,stroke-width:2px
    style H fill:#fbb,stroke:#333,stroke-width:2px
```

