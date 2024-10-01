1. 
```
000000 - A
000001 - B
000010 - C
000011 - D
000100 - E
000101 - F
000110 - G
000111 - H
001000 - I
001001 - J
001010 - K
001011 - L
001100 - M
```

2. 
	1. It is called an AND gate because both input $A$ _**and**_ input $B$ must be positive for the output to be positive. In any other case the output is negative.
	2. An OR gate should output positive when either $A$ _**or**_ $B$ is positive, or both:

$A+B=Q$

| $A$ | $B$ | $Q$ |
| ---- | ---- | ---- |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 | 

3. 

| $A$ | $B$ | $Q_1$ | $Q_2$ | $Q_3$ | $Q_4$ |
| ---- | ---- | ---- | ---- | ---- | ---- |
| 0 | 0 | 0 | 0 | 0 | 1 |
| 0 | 1 | 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 |
4. The input to the system would represent the beads, and the output would represent the tiles.
5. 
$$\begin{array}{l}
Q_1=AB \\
Q_2=A\overline{B} \\
Q_3=\overline{A}B \\
Q_4=\overline{AB}
\end{array}$$
The input can take up to 4 different combinations, since it contains 2 bits, hence $2^2=4$. The output consists of 4 bits, so could theoretically take up to $2^4=16$ combinations, although with the possible input states the system will only ever produce $4$ outputs, one for each of the input states.

This is effectively translating from a binary-bit pattern to a 1-to-4 pattern. Each combination of 2 bits is expanded out into 4 outputs, only one of which is positive for any given input.