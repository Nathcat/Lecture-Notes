_Write down a DFA that recognizes the language specified in Exercise 3 of Week 2 (that is, over the alphabet $\{w,x,y,z\}$, the set of strings that either have no 'w', or which have at least one 'w' character that occurs before any 'x' or 'y' character)._

This language could be defined by the regular expression:
$$
\textrm{w}^*(\textrm{x}|\textrm{y})
$$
![[Y2_C&A_Lab3_1 1.png]]

_Write down a DFA that recognizes the language specified in Exercise 2 of Week 2 (that is, the set of binary numbers — i.e. non-empty strings over the alphabet {0,1} — that are also multiples of 4 and which, aside from the string "0" itself, do not start with a '0')._

So clearly we need to define that the first character should not be a $0$, given the alphabet this means the first character must be $1$, however if we had a large alphabet we might define the regular expression for this to be $\bar{0}$, or in terms of regex $[\textasciicircum 0]$.

A number which is divisible by $4$ is also divisible by $2$, but not all multiples of $2$ are divisible by $4$, thinking about this in the sense of binary numbers:
$$\displaystyle\begin{array}{l}
0010_2\textrm{ is divisible by }4 \\
0110_2\textrm{ is not divisible by }4 \\
0001_2\textrm{ is divisible by }4 \\
0101_2\textrm{ is not divisible by }4 \\
0011_2\textrm{ is divisible by }4\\
\end{array}$$
This hasn't helped much I think, lets think about this another way.

$2^2=4$.
$2^3=2\times2\times2=2\times2^2$.
$2^4=2^2\times2^2$.
etc...
So every power of $2$, excluding $2^0$ and $2^1$ is divisible by $4$, since $2^2=4$ is a factor of said power.

But since the word cannot start with a $0$, this eliminates all of them, since any of these powers $+1$ will not be a multiple of $4$, they will be one greater than a multiple of $4$. Plus this is not all the multiples of $4$.
$$\displaystyle\begin{array}{r}
4=0100_2\\
8=1000_2\\
12=1100_2\\
16=10000_2\\
20=10100_2\\
24=11000_2\\
28=11100_2\\
32=100000_2\\
\end{array}$$
These are all multiples of $4$ represented in big endian binary. Note that in all of these numbers the last two digits $2^1$  and $2^0$ are _always_ 0. We are effectively adding $4=0100_2$ to each value so this does track given the rules of binary addition.

So the regex for this task could be:
$$
1(0^*|1^*)^*00
$$

![[Y2_C&A_Lab3_2.png]]Note that my use of an $\epsilon$ transition here is simply to make the diagram slightly more readable