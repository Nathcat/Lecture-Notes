Matrices are often used to represent linear transformations on vectors, although they have many other applications as well, for example solving certain systems of equations.
## Matrix - Matrix multiplication
Given two matrices $A:\mathbb{R}^n\rightarrow\mathbb{R}^m$ and $B:\mathbb{R}^m\rightarrow\mathbb{R}^k$, we have:
$$BA:\mathbb{R}^n\rightarrow\mathbb{R}^k$$
$$\vec{x}\mapsto(BA)\vec{x}=B(A\vec{x})$$
To multiply matrices, the number of _columns_ in the first matrix must match the number of _rows_ in the second matrix, this is sometimes called the domino rule:
$$\mathcal{M}(k,m)\times\mathcal{M}(m,n)\rightarrow\mathcal{M}(k,n)$$
With the coefficients of the result matrix $C=BA$ being given by:
$$C_{i,j}=\sum^m_{h=1}B_{ih}A_{hj}$$
This operation is associative $C(BA)=(CB)A$, but not commutative, so it _**might**_ not be true that $AB=BA$, it might not even be possible to define both products.

We also have multiplying with an identity matrix ($I_n\in\mathcal{M}(n,n)$):
Let $A\in\mathcal{m,n}$, $I_mA=A$ and $AI_n=A$.
## Rotation matrices
These three matrices may be used to defined rotations around an axis, when multiplied to vectors.
$$R_x(a)=\left(\begin{array}{ccc}
1 & 0 & 0 \\
0 & cos(a) & sin(a) \\
0 & -sin(a) & cos(a)
\end{array}\right)$$

$$
R_y(a)=\left(\begin{array}{ccc}
cos(a) & 0 & sin(a) \\
0 & 1 & 0 \\
-sin(a) & 0 & cos(a)
\end{array}\right)
$$

$$
R_z(a)=\left(\begin{array}{ccc}
cos(a) & sin(a) & 0 \\
-sin(a) & cos(a) & 0 \\
0 & 0 & 1
\end{array}\right)
$$
## Matrix exponentiation
For $A=\mathcal{M}(n,n)$ we can define a recursive function for exponentiation on $A$.
$$
A^k=\left\{\begin{array}{cl}
I_n & \textnormal{if } k=0 \\
AA^{k-1}=A^{k-1}A & \textnormal{if }k>0
\end{array}\right.
$$
## Matrix inverses
For $A,B\in\mathcal{n,n}$, if $AB=BA=I_n$, we say that $B$ is the inverse of $A$, and write $B=A^{-1}$.

For example:
$$
\left(\begin{array}{cc}2 & -4 \\ 0 & 2\end{array}\right) \left(\begin{array}{cc}0.5 & 1 \\ 0 & 0.5\end{array}\right)=\left(\begin{array}{cc}2\cdot0.5 & 2-4\cdot0.5 \\ 0 & 2\cdot0.5\end{array}\right)=\left(\begin{array}{cc}1 & 0 \\ 0 & 1\end{array}\right)
$$

Although sometimes the inverse of a matrix may simply not exist.
$$
A^{-1}=\frac{A}{det(A)}
$$
### Row reductions
You may build $A^{-1}$ by seeing how to transform $A$ into $I_n$ by "row reduction", but personally I prefer a recursive method using the determinant.
### Determinant of a matrix
The determinant can be defined as a recursive function with the following base case:
$$
A=\left[\begin{array}{cc}
a & b \\
c & d
\end{array}\right]\rightarrow det(A)=ad-bc
$$
Look at a $3\times3$ matrix:
$$
A=\left[\begin{array}{ccc}
a & b & c \\
d & e & f \\
g & h & i
\end{array}\right]\rightarrow det(A)=a(ei-fh)-b(di-fg)+c(dh-eg)
$$
This is described nicely in the following links:
- [Math Is Fun](https://www.mathsisfun.com/algebra/matrix-determinant.html)
- [Laplace Expansion on Wikipedia](https://en.wikipedia.org/wiki/Laplace_expansion)

The determinant only exists on square matrices. To describe this method (the Laplace expansion), we must first look at what a minor is.

A minor is the determinant of a sub-matrix. This sub-matrix is obtained by removing one or more rows and columns from the original matrix. So lets say that $m_{i,j}$ is the sub-matrix obtained by removing row $i$ and column $j$ from the matrix $M\in\mathcal{M}(n,n)$.

For example if: $M=\left(\begin{array}{ccc}a&b&c\\ d&e&f\\ g&h&i\end{array}\right)$, then $m_{1,1}=\left(\begin{array}{cc}e&f\\ h&i\end{array}\right)$, and $m_{1,2}=\left(\begin{array}{cc}d&f\\ g&i\end{array}\right)$, and $m_{1,3}=\left(\begin{array}{cc}d&g\\ e&h\end{array}\right)$
Lets rewrite the $3\times 3$ determinant in a generalised way, using this information:
$$\begin{array}{l}
det(M)=a(ei-fh)-b(di-fg)+c(dh-eg)\\
\rightarrow det(M)=A_{1,1}m_{1,1}-A_{1,2}m_{1,2}+A_{1,3}m_{1,3}\\
\rightarrow det(M)=(-1)^{1+1}A_{1,1}m_{1,1}+(-1)^{1+2}A_{1,2}m_{1,2}+(-1)^{1+3}A_{1,3}m_{1,3}\\
\rightarrow det(M)=\sum^n_{j=1}(-1)^{j+1}M_{1,j}m_{1,j}
\end{array}
$$
As you can see, with matrices larger than $3\times 3$ this becomes recursive, for example in a $4\times 4$ matrix, the $m_{i,j}$ is a $3\times 3$ matrix, so you must then find the determinant of this $3\times3$ matrix to continue.

There are of course other methods of finding the determinant, but personally I find that this one is the easiest to understand because it follows a very clear pattern.

Also note that the determinant of a matrix may be denoted by $|M|$.
## Final notes
An _**Orthogonal**_ matrix is one which satisfies $A^T=A^{-1}$.