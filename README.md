# AES128 Encryption/Decryption in Verilog

This repository contains a project implementing AES128 encryption and decryption in ECB mode using Verilog. The design is heavily pipelined and optimized for high-frequency operation.

## Project Description

- **Encryption Latency:** 140 ns (21 clock cycles)
- **Decryption Latency:** 273.33 ns (41 clock cycles)
- **Operating Frequency:** 150 MHz

## Tools Used

- **Simulation:** ModelSim
- **Synthesis:** Cadence Genus
- **Place and Route:** Cadence Innovus

## Area and Timing Summary

### Encryption

- **Area:** 395,589 µm²

| Slack Type       | Pre-CTS  | Post-CTS |
|------------------|----------|----------|
| Hold Slack       | +0.146 ns| +0.141 ns|
| Setup Slack      | +2.165 ns| +2.178 ns|

- **DRC and LVS Violations:** None

### Decryption

- **Area:** 376,745 µm²

| Slack Type       | Pre-CTS  | Post-CTS |
|------------------|----------|----------|
| Hold Slack       | +0.113 ns| -0.042 ns|
| Setup Slack      | +2.132 ns| +2.118 ns|

- **DRC and LVS Violations:** None

## Testing

To verify the implementation, use the Python script `test_aes128.py` located in the `scripts/` directory. This script can be used to compare the results from the AES128 implementation with the expected outputs.

### Prerequisites

Ensure you have Python installed and then install the required package:

```bash
pip install pycryptodome
```

### Running the Test Script
Navigate to the scripts/ directory and run the script:
```bash
python scripts/test_aes128.py
```

### How to Clone and Use the Repository
```bash
git clone https://github.com/yourusername/aes128-encryption-decryption-verilog.git
cd aes128-encryption-decryption-verilog
```
