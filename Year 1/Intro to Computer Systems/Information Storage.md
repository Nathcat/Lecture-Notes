## Requirements of computer memory
- A system with discrete states
- An ability to persist in a particular state (persistent memory)
- A way to change the state (write to the memory)
- A way to measure the state (read from the memory)

An analogue device can also store information, but they have different requirements. They do not have discrete states, so must use a different form of memory. Digital computer memory requires a set of discrete states.
## CMOS Technology and Transistors
- CMOS (Complementary symmetrical metal oxide semiconductor) is the dominant technology for digital logic circuits and fast memory.
- A transistor is a type of semiconductor, based on materials that give it dynamic electrical properties. They are often used as electronic switches, or to amplify signals.

- **p-type** transistors will block when provided with a high voltage, and pass when provided with a ground voltage.
- **n-type** transistors perform the exact opposite of a **p-type** circuit.
### CMOS Inverter
- A CMOS Inverter has a complementary and symmetrical pair of p-type and n-type MOSFETs.
- They are in one of two states, hence it is a binary device.

When the input is a high voltage, the output is the ground state (low voltage), and when the input is a ground state, the output is a high voltage.

So this might be used as a NOT logic gate.

![[CMOS Inverter.png]]

## NAND logic gate
A NAND logic gate has two inputs $A$ and $B$, and one output. They use two p-type transistors in parallel and two n-type transistors in series.

![[NAND Gate.png]]

The NAND gate is also called the Universal Logic Gate, because you may combine a number of NAND gates in a certain way to produce the same output as any other kind of gate.

## Static RAM
Static RAM uses a flip-flop circuit to create very fast switching speeds, although they are expensive as each cell requires several transistors.

Main memory generally uses Dynamic RAM which works differently

Static RAM is used in situations where speed is very important, such as registers within the CPU. But it is not practical for larger memory units.

## Bits and Bytes
- Computer memory chips contain a very large number of 1-bit cells.
- Each group of 8 of these bits represents 1 byte.
- Digital memory is based on binary so it must be expressed in powers of two.
- Manufacturers often use the binary system to represent capacity however, which is incorrect. This is why your storage device may appear to have less storage than it says on the label.

- According to the SI standard, a kilo represents $10^3$.
- A kilobyte then, may mean either $2^{10}$ bytes, or $10^3$ bytes.
- The correct terminology for 1024 bytes ($2^{10}$), is a _KibiByte_ (KiB), although this is not commonly used.

## Addressing Memory
Each byte in memory has an assigned address. Each byte therefore needs its own address. So if we have $2^{26}$ bytes in memory, we would require $26$ bytes to specify a unique address for each byte.

Consider 128 bytes of memory, this is $2^7$ so we would need 7 bits for the address, but we can do it with less. Separate the memory the memory into 2 banks of 64 bytes, and memory locations are specified using 8 rows and 8 columns in the banks.

Using this approach we can specify the bank with one bit, and the column / row using 3 bits each ($2^3=8$), therefore we only actually need three wires, and the largest chunk of data transferred at any one time is 3 bits.
