## Question 1
The task at hand here is to produce a program which produces the given image on the display in the Brookshear machine, with each pixel of the image taking up consecutive bits in the address range _80-FF_. Clearly there is the obvious approach of simply hard coding the bit pattern into the given address range which would produce this image, but I feel there is a more elegant solution here.

On each row the white space shifts one place to the left (until the middle when it shifts to the right of course). The first row could be represented by a series of $4$ bytes of $00000111_2$, in hex $03_{16}$, or $7_{10}$ in Denary.

It also looks like each row may be repeated twice in the image, so this should be accounted for with a kind of nested loop. The logic for this approach is described with the following flow chart.![[ics_assignment2_4.png]]

```
//  Setup registers
MOV 80 -> R1
MOV 7 -> R2
MOV 1 -> R3

//  Write the first row
MOV R2 -> [R1]
ADDI R1, R3 -> R1
MOV R2 -> [R1]
ADDI R1, R3 -> R1
MOV R2 -> [R1]
ADDI R1, R3 -> R1
MOV R2 -> [R1]
ADDI R1, R3 -> R1
```

This results in the following pattern:
![[ics_assignment2_1 2.png]]
This approach works for the first row, although we will need a different approach to draw the remaining rows. We will shift $5$ times to the left, and then $5$ times to the right to produce the required pattern.

```
//  Setup registers
                MOV     11100000b -> R0
                MOV     80 -> R1
                MOV     7 -> R2
                MOV     1 -> R3
                MOV     shift_left -> R4

//  Write the first row
write_loop:     MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                JMPNE   R4, R2
                JMPEQ   stop, R2

//  Shift R2 one place to the left, check if R2
//  is equal to R0 and if so change to shift_right.
shift_left:     ROT     R2, 7
                JMPEQ   shift_change, R2
                JMP     write_loop

//  Change to shift_right
shift_change:   MOV     shift_right -> R4
                MOV     00000111b -> R0
                JMP     write_loop

//  Shift R2 one place to the right and check if R2
//  is equal to R0, if so, stop the program.
shift_right:    JMPEQ   stop, R2
                ROT     R2, 1
                JMP     write_loop

stop:           HALT
```

This results in the following display. The pattern is there, although the required pattern is taller.

![[ics_assignment2_2.png]]

From the provided image it looks like the same row should be repeated $2$ times. We could implement this by using another loop which writes the row three times before shifting.

```
//  Setup registers
                MOV     11100000b -> R7
                MOV     80 -> R1
                MOV     7 -> R2
                MOV     1 -> R3
                MOV     shift_left -> R4
                MOV     0 -> R5
                MOV     2 -> R6
                MOV     write_loop -> R8

//  Write the first row
write_loop:     MOV     R7 -> R0
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R2 -> [R1]
                ADDI    R1, R3 -> R1
                MOV     R0 -> R7
                MOV     R6 -> R0
                ADDI    R5, R3 -> R5
                JMPLT   R8, R5
                MOV     R7 -> R0
                MOV     0 -> R5
                JMPNE   R4, R2
                JMPEQ   stop, R2

//  Shift R2 one place to the left, check if R2
//  is equal to R0 and if so change to shift_right.
shift_left:     ROT     R2, 7
                JMPEQ   shift_change, R2
                JMP     write_loop

//  Change to shift_right
shift_change:   MOV     shift_right -> R4
                MOV     00000111b -> R7
                JMP     write_loop

//  Shift R2 one place to the right and check if R2
//  is equal to R0, if so, stop the program.
shift_right:    JMPEQ   stop, R2
                ROT     R2, 1
                JMP     write_loop

stop:           HALT
```

This produces the following image, which matches the one given in the assignment.

![[ics_assignment2_3 1.png]]
### Use of registers
The following table describes how I have used each of the registers that this program uses.

| Register name | Use                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |     |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| `R0`          | `R0` is used for comparison operations, so it is used a lot throughout the program. It is used to check if the current value being written to the display is equal to the final value, at which the program should either move to shifting right, or finish executing. It is also used to check the loop counter when writing the rows, two rows are written before shifting, so the value 2 is copied into `R0` to check this, and the value that was in `R0` before is coped to `R7` temporarily, then once this check is complete the original value is copied back from `R7` into `R0`. |     |
| `R1`          | `R1` stores the address which we are currently writing to. This is incremented every time we write a byte.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |     |
| `R2`          | `R2` stores the current value we are writing, this is the value that is shifted left / right.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |     |
| `R3`          | Stores the value 1, used to increment values.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |     |
| `R4`          | Stores the address of the current shifting protocol. This starts as `shift_left`, which points the program to the protocol which shifts the current value left, and if the current value matches the final value, the value of `R4` is changed to `shift_right`.                                                                                                                                                                                                                                                                                                                            |     |
| `R5`          | Stores the loop counter to count how many rows have been written. This is incremented every time a new row is written, and reset to 0 when a shift is performed.                                                                                                                                                                                                                                                                                                                                                                                                                            |     |
| `R6`          | Stores the number of rows we are writing per shift. Used for comparison against `R5`.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |     |
| `R7`          | Used to store the original value of `R0` when it is being used for other comparison. (See `R0` description.)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |     |
| `R8`          | This stores the address of the `write_loop` protocol, so that we may jump to it in instructions such as `JMPLT`, which requires the jump target to be contained in a register.                                                                                                                                                                                                                                                                                                                                                                                                              |     |
## Question 2
Machine code is raw binary code which can be understood by the processor it is intended to run for, the general form is an opcode and operand, which together form an instruction which can be executed by the processor. Because machine code is raw binary, it is inherently difficult for us humans to read / understand and write, hence decided to create Assembly code.

Assembly code has the same form factor as machine code in that each line is formed of an opcode and operand, but instead of raw binary each part is a mnemonic which is closer to human language, which helps us to read, understand, and therefore write the code. The issue with this representation is that in this state the code cannot be understood by the processor, and so must be processed into the machine code equivalent, this is done using a program called an assembler. Originally the assembler must be written in machine code, or some other form, but after the original assembler is written you may use a concept known as _Bootstrapping_, to write new assemblers in assembly, and use the original assembler to assemble the new assembler. (_Bootstrapping (compilers)_ 2024)

The use of bootstrapping makes creating any kind of compiler easier. Once the original compiler has been written in another language we are able to write the new compiler in the new language, this made the development of languages like Assembly easier, once the first assembler had been written in machine code. This concept also extends to compilers for high level languages. The original compiler for a language may have been written in another language, but once this is done subsequent compilers can be written in the new language, allowing the new compilers to make use of the benefits of the new language, and potentially reduce the workload for the developers creating the compiler. The Java virtual machine and compiler or example were  both originally written in C (Heller, 2023), but afterwards they were written in Java, which allows the programmers to make use Java's abstraction of memory and object oriented concepts, which are not available in C, making their lives significantly easier than if they continued to create new versions of the compiler using C.

There is also the concept of _Cross Compilation_, which is where a compilation system is used to compile a program for a different platform than the one it was compiled on (_Cross compiler_ 2024). An example of a compiler system which allows for this is CMake, which is used to compile C/C++ programs. CMake allows you to install and choose from different _kits_, which provide compilers which run on your system, but can compile for another system. For example, you can use the Visual C++ kit to compile a C++ program or a windows machine, producing a windows executable file (.exe), or you could use a GNU compiler which targets a Linux system to produce an executable which can run on a Linux target machine. This kind of system allows developers to compile a program for a target platform without actually having access to said platform themselves, saving them time and money when developing and deploying their program. Programs like CMake also simplify the process of compiling for multiple targets, rather than having to manually use individual compilers yourself, it handles it all for you.

High level languages are a step above Assembly language in terms of abstraction, they are much closer to human language, but they don't have a 1:1 relationship with machine code, there might be many machine code instructions executing on one line of high level source code for example. This means that compilers for high level languages must be more complex than Assemblers, since they have to translate this different format of code into a machine code, they must parse the individual machine code instructions from the high level source code to produce the final executable. Because of this they are inherently more difficult to write than an Assembler, but the original compiler for a high level language must have been written in some form of Assembly code, after which Bootstrapping may again be used to produce new high level compilers. The fact that these high level languages are easier to produce programs with makes it easier for developers to produce very complex programs with them, they may also be used to produce new Assemblers, and new compilers for other high level languages, and because they are easier to write in and maintain, the end product is likely to be of a higher quality and provide more features than the versions which were created using more difficult languages such as Assembly or raw machine code.

So to summarise, producing the first compiler for any kind of language, Assembly or High level language, would have been a very difficult task, but once completed the workload for producing new ones is significantly reduced. Using the idea of Bootstrapping makes the relationship between the three kinds of programming language sort of, tangled, there are for example, Assemblers which were written in C, and other high level languages such as Java, etc... but the start of this relationship is clear, there must have been a progression from Assemblers written in machine code, to high level language compilers written in Assembly, to the same compilers written in the high level languages they compile.

### Bibliography
_Bootstrapping (compilers)_ (2024) _Wikipedia_. Available at: https://en.wikipedia.org/wiki/Bootstrapping_(compilers) (Accessed: 17 April 2024).

Heller, M. (2023) _What is a compiler? how source code becomes machine code_, _InfoWorld_. Available at: https://www.infoworld.com/article/3685673/what-is-a-compiler-how-source-code-becomes-machine-code.html (Accessed: 17 April 2024).

_Cross compiler_ (2024) _Wikipedia_. Available at: https://en.wikipedia.org/wiki/Cross_compiler (Accessed: 17 April 2024).