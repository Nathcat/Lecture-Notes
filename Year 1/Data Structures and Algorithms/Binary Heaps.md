A binary tree can be represented in an array with the following:
- $A_0$ is the root.
- For a node $A_i$, the left child is $A_{2i+1}$.
- For a node $A_i$, the right child is $A_{2i+2}$.

Hence we may define:
$$\displaystyle\begin{array}{l}
left(i)=2i+1 \\
right(i)=2i+2 \\
parent(i)=\left\lfloor\frac{i-1}{2}\right\rfloor
\end{array}$$
A _Max-Binary Heap_ is a dynamic array $Q$ of $n$ items representing a [[Binary Tree#Complete binary trees|Complete Binary tree]], where every node $i$ satisfies the following:
$$
Q_i\geq Q_{2i+1}\space\text{and}\space Q_i\geq Q_{2i+2}
$$
So the largest key is stored at the root.

This of course presents the issue that the minimum key cannot be found efficiently, but given that the primary purpose of this data structure is to implement the Max-Priority Queue, this is not a problem, since that interface does not require an efficient implementation of `FIND_MIN()`, but does require an efficient implementation of `FIND_MAX()`.

To implement a Min-Priority Queue, we would instead use a _Min-Binary Heap_, in which every node $i$ would satisfy:
$$
Q_i\leq Q_{2i+1}\space\text{and}\space Q_i\leq Q_{2i+2}
$$
Which would make the smallest key stored at the root.