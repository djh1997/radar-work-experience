## Logic gates

### Buffer

A digital buffer is an electronic circuit element used to isolate an input from an output. The buffer's output state mirrors the input state.

![buffer](logic/buffer.svg "buffer")

| Input | Output                  |
| ----- | ----------------------- |
| A     | Q                       |
| 0     | <input type="checkbox"> |
| 1     | <input type="checkbox"> |

---

### Not

An inverter or not gate is a logic gate which implements logical negation. It outputs a bit opposite of the bit that is put into it.

![not gate](logic/not.svg "not gate")

| Input | Output                  |
| ----- | ----------------------- |
| A     | Q                       |
| 0     | <input type="checkbox"> |
| 1     | <input type="checkbox"> |

---

### And

The and gate is a basic digital logic gate that implements logical conjunction. A high output (1) results only if all the inputs to the and gate are high (1). If not all inputs to the and gate are high, low output results.

![and gate](logic/and.svg "and gate")

| Input1 | Input2 | Output                  |
| ------ | ------ | ----------------------- |
| A      | B      | Q                       |
| 0      | 0      | <input type="checkbox"> |
| 0      | 1      | <input type="checkbox"> |
| 1      | 0      | <input type="checkbox"> |
| 1      | 1      | <input type="checkbox"> |

---

### Or

The or gate is a digital logic gate that implements logical disjunction. It outputs a 1 if any inputs are 1, or outputs a 0 only if all inputs are 0.

![or gate](logic/or.svg "or gate")

| Input1 | Input2 | Output                  |
| ------ | ------ | ----------------------- |
| A      | B      | Q                       |
| 0      | 0      | <input type="checkbox"> |
| 0      | 1      | <input type="checkbox"> |
| 1      | 0      | <input type="checkbox"> |
| 1      | 1      | <input type="checkbox"> |

---

### Nand

A Nand gate (not-and) is a logic gate which produces an output which is false only if all its inputs are true; thus its output is complement to that of an and gate.

![nand gate](logic/nand.svg "nand gate")

| Input1 | Input2 | Output                  |
| ------ | ------ | ----------------------- |
| A      | B      | Q                       |
| 0      | 0      | <input type="checkbox"> |
| 0      | 1      | <input type="checkbox"> |
| 1      | 0      | <input type="checkbox"> |
| 1      | 1      | <input type="checkbox"> |

---

### Nor

The nor gate is a digital logic gate which produces A high output (1) result if both the inputs to the gate are low (0) if one or both input is high (1), a low output (0) results. thus its output is complement to that of an OR gate.

![nor gate](logic/nor.svg "nor gate")

| Input1 | Input2 | Output                  |
| ------ | ------ | ----------------------- |
| A      | B      | Q                       |
| 0      | 0      | <input type="checkbox"> |
| 0      | 1      | <input type="checkbox"> |
| 1      | 0      | <input type="checkbox"> |
| 1      | 1      | <input type="checkbox"> |

---

### Xor

The xor gate is a digital logic gate that gives a true (1 or high) output when the number of true inputs is odd. An xor gate implements an exclusive or; that is, a true output results if one, and only one, of the inputs to the gate is true. If both inputs are false (0/low) or both are true, a false output results.

![xor gate](logic/xor.svg "xor gate")

| Input1 | Input2 | Output                  |
| ------ | ------ | ----------------------- |
| A      | B      | Q                       |
| 0      | 0      | <input type="checkbox"> |
| 0      | 1      | <input type="checkbox"> |
| 1      | 0      | <input type="checkbox"> |
| 1      | 1      | <input type="checkbox"> |

---

### Xnor

The xnor gate is a digital logic gate whose function is the logical complement of the Exclusive or (xor) gate.

![Xnor gate](logic/xnor.svg "Xnor gate")

| Input1 | Input2 | Output                  |
| ------ | ------ | ----------------------- |
| A      | B      | Q                       |
| 0      | 0      | <input type="checkbox"> |
| 0      | 1      | <input type="checkbox"> |
| 1      | 0      | <input type="checkbox"> |
| 1      | 1      | <input type="checkbox"> |

---

Now try some where there is more than one gate.

### Half adder

![half adder](logic/halfadder.svg "half adder")

| Input |     | Output                  |                         |
| ----- | --- | ----------------------- | ----------------------- |
| A     | B   | sum                     | carry                   |
| 0     | 0   | <input type="checkbox"> | <input type="checkbox"> |
| 0     | 1   | <input type="checkbox"> | <input type="checkbox"> |
| 1     | 0   | <input type="checkbox"> | <input type="checkbox"> |
| 1     | 1   | <input type="checkbox"> | <input type="checkbox"> |

---

### Adder

![adder](logic/adder.svg "adder")

| Input |     |          | Output                  |                         |
| ----- | --- | -------- | ----------------------- | ----------------------- |
| A     | B   | carry in | sum                     | carry                   |
| 0     | 0   | 0        | <input type="checkbox"> | <input type="checkbox"> |
| 0     | 0   | 1        | <input type="checkbox"> | <input type="checkbox"> |
| 0     | 1   | 0        | <input type="checkbox"> | <input type="checkbox"> |
| 0     | 1   | 1        | <input type="checkbox"> | <input type="checkbox"> |
| 1     | 0   | 0        | <input type="checkbox"> | <input type="checkbox"> |
| 1     | 0   | 1        | <input type="checkbox"> | <input type="checkbox"> |
| 1     | 1   | 0        | <input type="checkbox"> | <input type="checkbox"> |
| 1     | 1   | 1        | <input type="checkbox"> | <input type="checkbox"> |
