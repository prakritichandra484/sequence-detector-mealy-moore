# Sequence Detector (1011) using Mealy and Moore FSMs — Verilog

## Description
This project implements a binary sequence detector for the pattern **1011**
using both **Mealy** and **Moore** finite state machine (FSM) architectures
in Verilog HDL. The objective is to compare the behavior and output timing
of Mealy and Moore FSMs using the same input sequence.

The design supports **overlapping sequence detection** and demonstrates
key concepts of sequential logic, state transitions, and timing behavior.

---

## FSM Implementations

- **Mealy FSM**
  - Output depends on current state and input
  - Faster detection (output asserted in the same clock cycle)

- **Moore FSM**
  - Output depends only on current state
  - Output asserted one clock cycle later, providing stable behavior

Both FSMs are implemented and verified side-by-side.

---

## Inputs and Outputs

### Inputs
- `clk` : Clock signal
- `rst` : Asynchronous reset
- `in`  : Serial binary input

### Outputs
- `mealy_detected` : Detection output from Mealy FSM
- `moore_detected` : Detection output from Moore FSM

---

## Sequence Detection
- Target sequence: **1011**
- Detection type: **Overlapping**
- After detection, the FSM preserves partial sequence history
  to allow consecutive detections.

---

## Verification
The design was verified using a common Verilog testbench in
Xilinx Vivado. Behavioral simulation and waveform analysis
confirmed correct sequence detection and highlighted the
timing difference between Mealy and Moore FSM outputs.

---

## Tools Used
- Verilog HDL
- Xilinx Vivado (Behavioral Simulation)

---

## Author
**Prakriti Chandra**
