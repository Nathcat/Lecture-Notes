## What is an Algorithm?
An Algorithm is a well-defined computational procedure which takes some input and produces an output in a finite time. An algorithm may be called correct if it both produces the desired output, and halts.

An algorithm can be proved to be correct using the principle of induction:

$$\begin{array}{c}
P(0)\textnormal{ is true} \\
\textnormal{For some } k\geq 0, P(k)\Rightarrow P(k+1)
\end{array}
$$
## Asymptotic Complexity
There are three notations for Asymptotic Complexity of Algorithms:
$$
O(g(n))\geq \Theta(g(n))\geq\Omega(g(n))
$$
$O$ and $\Omega$ notations are upper and lower bounds for the growth of a function respectively, and $\Theta$ is a tight bound lying between the two.
## Computational model
We will model a computer as an infinite array of machine words.

_**Word - A sequence of bits.**_

This infinite array of machine words is called memory. We also have a processor which is able to operate on this memory.

We assume that:
- Basic binary operations on two words are performed in $\Theta(1)$.
- Given a word $a$, the processor may read / write the word whose address is $a$ in $\Theta(1)$.
- The processor may allocate and initialise $n$ consecutive words in $\Theta(n)$.

Given these assumptions, if we are to operate on an input of $n$ words, then the size of the machine words $w$ must satisfy $2^w\geq n$, and $w\geq log_2(n)$, to ensure that the processor is able to address the entire input. Otherwise the size of a word would be insufficient to offer enough combinations to address all of the words in the input.