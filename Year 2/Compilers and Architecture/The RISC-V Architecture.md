# Instruction set architecture
The _**Instruction set architecture**_ (ISA) are the features of the CPU which are accessible to the programmer.

This includes:
- Supported data types
- Instructions that can be performed on these data types
- Number and kinds of registers
- Addressing modes, memory architecture, interrupts, etc...

The underlying _**Microarchitecture**_ is not actually visible to the programmer, this is how these features are actually implemented. CPUs with different microarchitectures might have the same instruction set.

The mindset used to be that making machine instructions more powerful would narrow the semantic gap between high level and low level languages, which would make compiled code faster. CPUs with such instruction sets are called _CISC_ processors, their instructions do complicated things and are more complicated to implement at the hardware level.

In some cases this is true, however in the 1970s research was done to study instruction set architecture and compiled code more carefully, which noticed a few important things.
- Compilers rarely make good use of complex instruction sets.
- Complex operations tend to be slower than a sequence of simpler operations which amount to the same result
- More often that not, real world programs ended up spending most of their time executing simple instructions.
- Implementing complex operations requires complicated CPU architecture, which tends to make simpler operations slower than they have to be.

The result was a radical rethinking of this mindset, leading towards _RISC_ processors. However this does make the work of the compiler much harder since they widen the semantic gap between high level and low level languages.

The key features of a RISC architecture like _RISC-V_:
- Data stored in memory is only accessible to _load_ and _store_ instructions
- All other instructions are limited to operating on registers
RISC architectures are also sometimes called _load / store architectures_ because of this.

Despite the fact that _RISC_ architectures generally produce more efficient processors, the most popular set of chips (Intel x86) is not RISC, primarily because of the profits they earn which allows them to spend more money to produce more complex processors, and their chips are largely backwards compatible.

Although:
- Mobile phones are usually RISC processors.
- Mac have recently transitioned to RISC processors.
- Modern intel processors are also RISC "under the hood".
- ARM provides dedicated instructions for cryptography (AES), just as x86 does, in it's RISC processors.

Some workloads however are extremely skewed towards certain instructions, in such cases abandoning traditional CPU architectures is favourable, for the use of special purpose processors.

# The RISC-V Architecture
## Registers
32 registers of 32 bits each:
- `x0` is hardwired to zero:
	- Can be used as a target register for operations whose result is to be discarded
	- Can also be used as a source of the constant $0$.
- `x1` - `x31` are general purpose registers.
[Wikipedia](https://en.wikipedia.org/wiki/RISC-V)

- Address space of $2^{32}$  bytes, for all memory accesses.
	- Address space is circular, so $2^{32}-1$ is adjacent to $0$.
	- A word of memory is defined to be $32$ bits.
		- A halfword then is $16$ bits.
		- A byte is $8$ bytes.
	- Some instructions are fixed-length 32 bit instructions which must be aligned on 32 bit boundaries (so at memory addresses divisible by 4).
	- Storing or loading data at misaligned locations is allowed, but access to aligned addresses may be faster.