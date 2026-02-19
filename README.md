# Quantum Fingerprinting

> **Category**: cryptography &nbsp;|&nbsp; **Difficulty**: advanced &nbsp;|&nbsp; **Qubits**: 3 &nbsp;|&nbsp; **Gates**: 4 &nbsp;|&nbsp; **Depth**: 4

Quantum fingerprinting encodes an n-bit classical string into a O(log n)-qubit quantum state such that two parties can test string equality using only a constant number of qubits of communication. The referee runs a SWAP test on the two fingerprints. This circuit shows fingerprints for strings '0' and '0' (identical): the SWAP test ancilla should measure 0 with certainty. For different strings, it measures 1 with probability (1 - |⟨f₁|f₂⟩|²)/2 > 0.

## Expected Output

c[0]=0 with certainty (identical fingerprints → |⟨f|f⟩|²=1 → P(1)=0)

## Circuit

The OpenQASM 2.0 circuit is in [`circuit.qasm`](./circuit.qasm).

```
OPENQASM 2.0;
include "qelib1.inc";
// Quantum fingerprinting via SWAP test
// q[0]: ancilla, q[1]: fingerprint of string A=0 (|0>), q[2]: fingerprint of string B=0 (|0>)
qreg q[3];
creg c[1];
// Both fingerprints are |0> (identical strings)
// SWAP test
h q[0];
cswap q[0],q[1],q[2];
h q[0];
// P(1) = (1 - |<A|B>|^2) / 2 = 0 for identical strings
measure q[0] -> c[0];
```

## Tags

`fingerprinting` `equality-testing` `communication-complexity` `swap-test`

## References

- [Buhrman et al. (2001). Quantum Fingerprinting. PRL 87, 167902](https://doi.org/10.1103/PhysRevLett.87.167902)

## License

MIT — part of the [OpenQC Algorithm Catalog](https://github.com/openqc-algorithms).
