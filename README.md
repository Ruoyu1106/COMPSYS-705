# COMPSYS 705 – Formal Methods Project

This repository contains the implementation and experiments for the **COMPSYS 705: Formal Methods for Safety-Critical Software** course project at the **University of Auckland**.

The goal of this project is to explore how **formal verification techniques** can be applied to analyze system behaviour, detect logical errors, and ensure correctness in safety-critical software systems.

The repository includes modelling files, verification scripts, and example scenarios used to evaluate system correctness.

---

# Project Objectives

The objectives of this project are:

- Model a system using formal methods
- Verify correctness properties such as **safety** and **liveness**
- Detect potential design errors through automated verification
- Demonstrate the use of **model checking and verification tools**

---

# Technologies and Tools

This project makes use of several tools and techniques commonly used in formal verification:

- **Python** – scripting and automation
- **Model Checking Techniques** – for verifying system properties
- **Formal Modelling** – representing system behaviours mathematically
- **Verification Tools** – used to test safety and correctness properties

---

# Repository Structure

```
COMPSYS-705/
│
├── models/            # Formal system models
├── scripts/           # Verification or experiment scripts
├── results/           # Output logs or experiment results
├── docs/              # Supporting documentation
│
└── README.md          # Project description
```

*(Directory structure may vary depending on the specific implementation.)*

---

# Installation

Clone the repository:

```bash
git clone https://github.com/Ruoyu1106/COMPSYS-705.git
cd COMPSYS-705
```

If Python dependencies are required, install them using:

```bash
pip install -r requirements.txt
```

---

# Usage

Run the verification scripts:

```bash
python run_verification.py
```

Example output:

```
Verification started...
Checking safety properties...
No violations detected.
```

---

# Workflow

A typical workflow for this project includes:

1. Define the system model
2. Specify safety and liveness properties
3. Run model checking tools
4. Analyze verification results
5. Refine the model if violations are detected

---

# Results

The experiments demonstrate how formal verification techniques can help:

- Identify potential design flaws
- Verify system correctness
- Improve reliability of safety-critical software systems

---
