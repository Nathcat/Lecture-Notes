## Question 1.

_Design an **XNOR gate** using only AND gates and NOT gates (inverters)._

| A   | B   | Q   |
| --- | --- | --- |
| 0   | 0   | 1   |
| 0   | 1   | 0   |
| 1   | 0   | 0   |
| 1   | 1   | 1   |
To begin, we can see that $Q=1$ when we have $AB+\overline{A}\overline{B}$. Therefore $Q=AB+\overline{A}\overline{B}$. But we are not allowed to use or gates in this challenge.

Using De Morgan's law _(Storr, 2022)_, $\overline{AB}=\overline{A}+\overline{B}$, using this we can rewrite $Q$ as
$$
Q=AB+\overline{AB}=\overline{\left(\overline{AB}\overline{\left(\overline{A}\overline{B}\right)}\right)}
$$

Which looks horrible, but it only uses AND and NOT gates.

Below is this expression implemented into a Simulink model.
![[XNOR.png]]
## Question 2
![[Adder.png]]
_Write down the truth table for this circuit._

| $A$ | $B$ | $C$ | $X$ | $Y$ |
| --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   |
| 0   | 0   | 1   | 1   | 0   |
| 0   | 1   | 0   | 1   | 0   |
| 1   | 0   | 0   | 1   | 0   |
| 0   | 1   | 1   | 0   | 1   |
| 1   | 1   | 0   | 0   | 1   |
| 1   | 0   | 1   | 0   | 1   |
| 1   | 1   | 1   | 1   | 1   |

This is _full adder_ circuit.

After copying the circuit, and connecting the output $Y_1$ in the first circuit to the input $A_2$ in the second circuit, we have the following truth table.

| B2  | B1  | C2  | C1  | Y2  | X2  | X1  |
| --- | --- | --- | --- | --- | --- | --- |
| 0   | 0   | 0   | 0   | 0   | 0   | 0   |
| 0   | 0   | 0   | 1   | 0   | 0   | 1   |
| 0   | 0   | 1   | 0   | 0   | 1   | 0   |
| 0   | 0   | 1   | 1   | 0   | 1   | 1   |
| 0   | 1   | 0   | 0   | 0   | 0   | 1   |
| 0   | 1   | 0   | 1   | 0   | 1   | 0   |
| 0   | 1   | 1   | 0   | 0   | 1   | 1   |
| 0   | 1   | 1   | 1   | 1   | 0   | 0   |
| 1   | 0   | 0   | 0   | 0   | 1   | 0   |
| 1   | 0   | 0   | 1   | 0   | 1   | 1   |
| 1   | 0   | 1   | 0   | 1   | 0   | 0   |
| 1   | 0   | 1   | 1   | 1   | 0   | 1   |
| 1   | 1   | 0   | 0   | 0   | 1   | 1   |
| 1   | 1   | 0   | 1   | 1   | 0   | 0   |
| 1   | 1   | 1   | 0   | 1   | 0   | 1   |
| 1   | 1   | 1   | 1   | 1   | 1   | 0   |
The circuit we have just created is a _2-bit adder_, it takes two sets of two bits (specified by $A_1A_2$ and $B_1B_2$) and adds them together using the rules of binary addition. The output of this addition is given by $X_1X_2$, with an "overflow bit" $Y_2$, which is $1$ in the case that the addition causes an overflow.

The way we create such a circuit is to "chain" together two full adders, connecting the carry output of the first adder to the carry input of the second adder, which in this case is $Y_1\rightarrow C_2$, although in reality it doesn't matter which input the carry output is connected to, as long as the other inputs are connected accordingly. In this example we have connected the adders with $Y_1\rightarrow A_2$, but since the circuit effectively just adds the three input bits following the rules of binary addition, it doesn't really matter which input $Y_1$ is connected to. This connection effectively carries the carry bit from the from previous addition, much like you would carry over a bit when adding two binary digits together.
## Question 3
In Mathematics, Parity refers to the evenness or oddness of an integer, you can determine this in binary form simply by examining the least significant bit. In computing parity refers the evenness or oddness of the total number of ones in a set of binary digits. _(Parity bit 2023)_.

In a [[RAID (Redundant Array of Independent Disks|RAID]] array, parity can be used to reconstruct data lost from a failed disk. When writing the data, parity information is created using an XOR operation on the data being written to the two disks. In order to rebuild the lost information you then simply need to perform another XOR operation using the parity information in place of the lost information, for example, imagine you are writing the following data:

Drive 1: $01101101_2$.
Drive 2: $11010100_2$.

The parity can for this data is then calculated by performing an XOR on the two bytes:

Parity: $01101101_2\oplus11010100_2=10111001_2$.

Which is then stored on a new drive (Drive 3). Each bit of the parity tells us is 1 if there is an odd number of $1$s in the corresponding bits of the input. This is called an even parity bit. Note that an odd parity bit is the opposite, it is 1 if there is an even number of $1$s in the input bits.

Should _any_ of the drives fail, the contents of the failed drive can be reconstructed from by the performing an XOR on the data remaining from the working 2 drives.

If drive 1 fails:
$Drive_2\oplus Parity=01101101_2=Drive_1$

If drive 2 fails:
$Drive_2\oplus Parity=11010100_2=Drive_2$

If drive 3 fails:
$Drive_1\oplus Drive_2=10111001_2=Parity=Drive_3$.

_(Parity bit 2023)_
## Question 4
![[Architecture diagram.png]]
*Original image licensed under [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0) Original: [Gribeco](https://en.wikipedia.org/wiki/fr:User:Gribeco) at [French Wikipedia](https://en.wikipedia.org/wiki/fr:) Derivative work: [Moxfyre](https://en.wikipedia.org/wiki/User:Moxfyre) at [English Wikipedia](https://en.wikipedia.org/wiki/), reproduced by [Nathan Baines](https://nathcat.net/about). Available at: https://en.wikipedia.org/wiki/Northbridge_(computing)#/media/File:Motherboard_diagram.svg (Accessed: 26 February 2024)*

The storage mediums and buses specified in the diagram above will have different transfer speeds.

| Bus      | Speed                                                                                     |
| -------- | ----------------------------------------------------------------------------------------- |
| Memory   | 17 GB/s (_DDR4 at 2133 MHz_) _(Transcend)_                                                |
| PCI-e    | 4 GB/s (_Rev. 5.0_) _(PCIe speeds and limitations)_                                       |
| AGP      | 2.14 GB/s (_AGP 8x_) _(What is AGP? the difference between 1x, 2x, 4x, and 8x explained)_ |
| PCI      | 1056 MB/s _(Bus speeds 2023)_                                                             |
| Ethernet | 1 GB/s (_Gigabit Ethernet, dependent on network speeds_) _(Bus speeds 2023)_              |
| IDE      | 1064 MB/s (_ATA 133_) _(Bus speeds 2023)_                                                 |
| SATA     | 3 GB/s (_SATA III_) _(Bus speeds 2023)_                                                   |
| USB      | 4.8 GB/s (_USB 3.0_) _(Bus speeds 2023)_                                                  |
# References
Storr, W. (2022) _Boolean algebra simplification_, _Basic Electronics Tutorials_. Available at: https://www.electronics-tutorials.ws/boolean/boolean-algebra-simplification.html (Accessed: 26 February 2024).

_Parity bit_ (2023) _Wikipedia_. Available at: https://en.wikipedia.org/wiki/Parity_bit (Accessed: 26 February 2024).

Transcend (no date) _Product support_, _What are the data transfer rates for DDR, DDR2, DDR3 and DDR4? - Transcend Information, Inc._ Available at: https://www.transcend-info.com/Support/FAQ-292 (Accessed: 26 February 2024).

_PCIe speeds and limitations_ (no date) _Crucial_. Available at: https://uk.crucial.com/support/articles-faq-ssd/pcie-speeds-limitations (Accessed: 26 February 2024).

_What is AGP? the differences between 1x, 2x, 4X and 8X explained_ (no date) _What is AGP? The Differences Between 1x, 2x, 4x and 8x Explained | Lenovo US_. Available at: https://www.lenovo.com/us/en/glossary/agp/?orgRef=https%253A%252F%252Fwww.google.com%252F (Accessed: 26 February 2024).

_Bus speeds_ (2023) _naplestech_. Available at: https://naplestech.com/bus-speeds/ (Accessed: 26 February 2024).