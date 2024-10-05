
# 4-bit Adder Verilog Module

This project implements a **4-bit adder** using a cascade of four full adders. The adder takes two 4-bit binary numbers (`a` and `b`) and a carry-in (`ci`), and it outputs a 4-bit sum (`s`) and a carry-out (`co`).

## Code Overview

### Inputs:
- `a`: 4-bit input binary number.
- `b`: 4-bit input binary number.
- `ci`: Carry-in input, generally used when chaining multiple adders together.

### Outputs:
- `s`: 4-bit sum of inputs `a` and `b`.
- `co`: Carry-out from the most significant bit (MSB), indicating if there is an overflow.

### Verilog Code:

```verilog
module adder(a, b, ci, s, co);
  input [3:0] a, b;     // 4-bit inputs
  input ci;             // Carry-in input
  output co;            // Carry-out
  output [3:0] s;       // 4-bit sum output
  wire w1, w2, w3, w4;  // Intermediate carry signals

  // Full adder instances to add each bit of 'a' and 'b'
  fa f1(a[0], b[0], ci, s[0], w1);  // Add LSBs and carry-in
  fa f2(a[1], b[1], w1, s[1], w2);  // Add next bit and carry from f1
  fa f3(a[2], b[2], w2, s[2], w3);  // Add next bit and carry from f2
  fa f4(a[3], b[3], w3, s[3], w4);  // Add MSBs and carry from f3
  assign co = w4;                   // Final carry-out
endmodule
```

### Functionality

- **Sum (`s`)**: The 4-bit sum of `a` and `b`.
- **Carry-out (`co`)**: Indicates whether an overflow occurred from the addition of the most significant bits.

This adder uses four full adders (`fa`) connected in series:
1. **f1** adds the least significant bits of `a` and `b` (`a[0]` and `b[0]`) and the carry-in (`ci`).
2. **f2** adds the next bits (`a[1]`, `b[1]`) along with the carry-out from `f1`.
3. **f3** adds the next bits (`a[2]`, `b[2]`) with the carry-out from `f2`.
4. **f4** adds the most significant bits (`a[3]`, `b[3]`) with the carry-out from `f3`. The final carry-out is stored in `co`.

### Truth Table Example (for a 4-bit addition):
| `a`    | `b`    | `ci` | `s`    | `co` |
|--------|--------|------|--------|------|
| 0000   | 0001   |  0   | 0001   |  0   |
| 0101   | 0110   |  0   | 1011   |  0   |
| 1111   | 1111   |  1   | 1111   |  1   |

### How to Use
1. Instantiate the `adder` module in your Verilog project.
2. Provide two 4-bit inputs `a` and `b` and an optional carry-in `ci`.
3. The module will output a 4-bit sum `s` and a carry-out `co`.

### Applications
This 4-bit adder can be used in:
- Multi-bit addition for arithmetic operations.
- Arithmetic Logic Units (ALUs).
- Binary addition and subtraction circuits.
