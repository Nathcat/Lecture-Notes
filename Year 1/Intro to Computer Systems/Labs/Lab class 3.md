1. The gate itself would still take the form factor of an AND gate, but there would be three inputs to it rather than two: ![[3 input AND gate.png]]

| A | B | S | C |
| ---- | ---- | ---- | ---- |
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |
This is a _half adder_, it adds two binary bits and gives the result in the $S$ output, and the carry bit in the $C$ output, but does not take a carry bit as an input.

2. Answer on remarkable (probably put it in here at some point, idk how tho lol).
3. $1MiB=1024KiB=1024^2B=1048576B$, if we separate this out into columns which contain $1024$ bytes, each row will then also have $1024$ bytes in it. This means that we could address each byte of the memory chip using $\log_2(1024)=10$ bits.
4. See Home share Documents/simulink/AND_OR_but_weird.mdl for the answer to this question.
5. Multiplexers take in multiple signals and allows only one input through as the output, which input is allowed is generally controlled by a separate set if input lines. A Demultiplexer effectively does the opposite, it is a device which has one input and more than one output.