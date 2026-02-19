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
