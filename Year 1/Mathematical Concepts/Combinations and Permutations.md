A Set, by definition, has no order, it is simply a collection of elements. As such there are not duplicate elements in a set, and: $\{a,b,c,d\}=\{d,c,b,a\}\neq\{a,b\}$.

We define a combination here as a subset of elements from a particular set. Let us define a $A$, and a generic subset of $A$ as $S_A$. We might define $S_A$ algebraically as:
$$\begin{array}{c}
S_A=\{x_1,x_2,\ldots,x_n\} \\
x_1\in A \\
x_2\in (A-\{x_1\}) \\
\vdots \\
x_n\in (A-\{x_1,x_2,\ldots,x_{n-1}\})
\end{array}$$
## Permutations
A Permutation is a particular ordering of a set. You might think of these as an ordered sequence rather than a set.

If $n=\|A\|$ and $r=\|S_A\|$ then we have:
$${}^nP_r=\frac{n!}{(n-r)!}$$
Think about the number of possible choices of elements from $A$, for each element of $S_A$, the total number of variations will be the product of the possible choices for each element.
$$n\times (n-1)\times (n-2)\times\ldots\times (n-r)$$
This can be found with the formula given above (${}^nP_r$).
## Combinations
If the number of Permutations is given by ${}^nP_r=\frac{n!}{(n-r)!}$, ($\|A\|=n$) then the number of Combinations is given by:
$${}^nC_r=\frac{n!}{r!(n-r)!}$$
This is because dividing by $r!$, the number of permutations of the subset $S_A$ ($\|S_A\|=r$), effectively eliminates all the duplicate subsets.