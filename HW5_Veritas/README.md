# 🧠 Veritas: Hardware Verification Pipeline  
**Course:** LLM4Chip Design  
**Author:** Aviraj (aud211)

---

## 🚀 Overview

This repository implements a **SAT-based formal verification pipeline** using the Veritas framework. The system converts digital hardware designs into **Conjunctive Normal Form (CNF)** and verifies correctness using a **SAT solver**.

Unlike traditional simulation-based approaches, this method ensures **exhaustive correctness** across all possible inputs using **correctness-by-construction**.

---

## 🏗️ Repository Structure (Detailed)

```
HW5_Veritas/
│
├── adder 3-bit/
│   ├── adder_3-bit.bench
│   ├── adder_3-bit.cnf
│   ├── adder_3-bit.csv
│   ├── adder_3-bit.v
│   ├── adder_3-bit_tab.csv
│
├── decoder 3x8 (claude opus)/
│   ├── decoder_3x8.bench
│   ├── decoder_3x8.cnf
│   ├── decoder_3x8.csv
│   ├── decoder_3x8.v
│   ├── decoder_3x8_tab.csv
│
├── decoder 3x8 (claude sonnet)/
│   ├── decoder_3x8_sonnet.bench
│   ├── decoder_3x8_sonnet.cnf
│   ├── decoder_3x8_sonnet.csv
│   ├── decoder_3x8_sonnet.v
│   ├── decoder_3x8_sonnet_tab.csv
│
├── decoder 4x16/
│   ├── decoder_4x16_part4.bench
│   ├── decoder_4x16_part4.cnf
│   ├── decoder_4x16_part4.csv
│   ├── decoder_4x16_part4.v
│   ├── decoder_4x16_part4_tab.csv
│
├── veritas_hw.ipynb
├── Veritas LLM Hardware Generation Pipeline Report.pdf
└── README.md
```

---

## ⚙️ Key Features

- 🔹 Boolean logic → CNF transformation  
- 🔹 SAT-based equivalence checking  
- 🔹 Miter circuit construction  
- 🔹 Automated artifact generation (CNF, CSV, Bench)  
- 🔹 Multiple hardware designs verified  

---

## 🔬 Verification Workflow

1. **Design Encoding**  
   Convert Verilog/bench logic into CNF clauses  

2. **Golden Model Creation**  
   Define correct behavior for comparison  

3. **Miter Construction**  
   Compare DUT and golden outputs using XOR  

4. **SAT Solving**  
   - SAT → Bug exists  
   - UNSAT → Design is correct  

5. **Result Logging**  
   Outputs stored in CSV files  

---

## 📊 Results Summary

| Design | Result | SAT Output |
|--------|--------|------------|
| Adder 3-bit | PASS | UNSAT |
| Decoder 3x8 (Opus) | PASS | UNSAT |
| Decoder 3x8 (Sonnet) | PASS | UNSAT |
| Decoder 4x16 | PASS | UNSAT |

---

## 💡 Key Learnings

- CNF enables scalable formal verification  
- SAT solvers provide exhaustive correctness  
- Miter circuits are central to equivalence checking  
- Formal methods outperform simulation for coverage  

---

## 📄 Report

Refer to:  
**Veritas LLM Hardware Generation Pipeline Report.pdf**

---

## 🚀 How to Run

1. Open `veritas_hw.ipynb` in Google Colab  
2. Run all cells  
3. Generated artifacts will appear in respective folders  

---

## ⭐ Final Note

This project demonstrates a **production-grade formal verification workflow** combining hardware design, CNF encoding, and SAT solving — a critical foundation for modern chip design validation.
