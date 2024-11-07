$$\displaystyle\begin{flalign}
&G=(\{E\}, \mathbb{N}\cup\{+,-,\times,(,)\}, R, E) \\ \\
&NUM\rightarrow n\in\mathbb N \\
&E\rightarrow E+E|E-E|E\times E|( E )|NUM
\end{flalign}$$

Give all the parse trees for the expression $5\times4-3\times2$ under $G$ with the given $R$.

Well it could be interpreted in the correct algebraic order, which would be:

![[C&A_Lab5_1.png]]

Or potentially it would simply work from left to right:
![[C&A_Lab5_2.png]]

Since $G$ contains no idea of the correct order for arithmetic operations.


The order of arithmetic operations is:
1. Brackets
2. Indices
3. Division
4. Multiplication
5. Addition
6. Subtraction
Perhaps rather than having one non-terminal we should define $V$ to contain non-terminals for each of these _types of expression_.
(We are not including division apparently)

$$\displaystyle\begin{flalign}
&G=(\{E,T,F,N\}, \mathbb N\cup\{+,-,\times,(,)\}, R, E)\\\\
&E\rightarrow T|T+E|T-E\\
&T\rightarrow F|F\times T\\
&F\rightarrow N|(E)\\
&N\rightarrow n\in\mathbb{N}
\end{flalign}$$
This will begin by evaluating for $E$, which then derives making sure to prioritise $T$ on the left, which leads to multiplication, which prioritises evaluating $F$ on the left, which yields either $N$, or $E$ surrounded with bracket, which should always be evaluated first.

It seems backwards but if you think about it how it would be derived into the parse tree then it makes sense with an in-order traversal of the parse tree.