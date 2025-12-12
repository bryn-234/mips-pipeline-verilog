# mips-pipeline-verilog
Pipelined 5-stage MIPS processor implemented in Verilog

## Overview
This project implements a **5-stage pipelined MIPS processor** in Verilog,
developed as part of a computer architecture laboratory. The design follows
the classic MIPS pipeline and resolves data hazards using **NOP-based stalling**
inserted directly into the instruction memory.

The processor was synthesized and tested using **Vivado** and validated on
**FPGA hardware**.

---

## Pipeline Architecture
The processor is organized into the standard 5 pipeline stages:

1. **IF** – Instruction Fetch  
2. **ID** – Instruction Decode / Register Fetch  
3. **EX** – Execute  
4. **MEM** – Memory Access  
5. **WB** – Write Back  

Each stage is implemented modularly to clearly separate datapath and control
logic.

---

## Hazard Handling Strategy
To ensure correctness, **data hazards are resolved using explicit NOP
instructions** placed in the instruction memory. This approach avoids the
need for forwarding logic or dynamic hazard detection and guarantees correct
execution across all supported instruction sequences.

This design choice prioritizes **correctness and clarity** of pipeline
behavior over performance optimization.

---

## FPGA Validation
The processor was tested on FPGA hardware using a predefined instruction
memory program. Register values and seven-segment display outputs were
verified against expected results.

📄 **FPGA Test Documentation:**  
[FPGA Instruction Memory Test](docs/instruction_mem_test_comments.pdf)

---

## Repository Structure
```text
src/    Verilog source files for the processor
docs/   FPGA test documentation and diagrams
tb/    Verilog tb files
mem/  Instruction and Data Memory files we used to test our pipeline
