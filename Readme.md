# ⚡ FADAKA CRYPTO CORE

A hardware cryptographic identity system powered by ESP32, ATECC608A, and Web4 architecture.

---

## 🧠 SYSTEM ARCHITECTURE

```mmd
flowchart TD
A[Identity Layer .p12] --> B[FastAPI KMS]
B --> C[ESP32 Core Device]
C --> D[ATECC608A Secure Element]
C --> E[LED Status Ring]
C --> F[P2P Blockchain Network]
```
