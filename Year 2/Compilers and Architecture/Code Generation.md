The Code Generation stage of Compilation produces two different kinds of code:
- Assembly language / byte code
- Machine code
	- This is produced by an assembler, which translates the assembly into a binary file,
	- and a linker, which takes one or more binary files and produces an executable in a machine code format.
	- Or, an execution engine will take the verified / loaded bytecode and interpret it on the fly at runtime.

Regardless, the point of a compiler is to produce _assembly code_, and an assembler takes it the rest of the way by performing _transliteration_, rather than translation.

## Memory alignment
Most modern CPUs have a 32-bit or 64-bit data bus, so they read this many bits at a time from memory, this is their _word size_. Memory is accessible at intervals of the word size.

So if a certain bit of data spans across two words (even though it might not take up both words), the CPU would have to read in both words in order to read all the data, which leads to a lot of redundant data transfer. This is _memory misalignment_ and can result in a significant impact on performance.

In order to avoid this, you should ensure that memory is written to be aligned with the boundaries of words. Padding can be used to fill unused space in a word to ensure that these boundaries are aligned with.

Most assembler languages have built in support which aligns some of the data in the programs automatically. The _RISC-V_ assembly language for example has the `.align n`  command which specifies that the following line should be aligned on a $2^n$ byte boundary.

## Resource management
_**Dynamic**_ - Resources are allocated at run time
_**Static**_ - Resources are allocated at compile time

An example of dynamic resource management might be the memory for persistent objects that might be created in a complex program, as we generally cannot predict this. We might also use dynamic management with recursive subroutines, as we generally don't know what calls we might make. However the instructions for each subroutine are part of the program once compiled, so they are managed statically.
