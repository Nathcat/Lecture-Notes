Asymptotic Analysis is an algebraic method by which we might consider the performance of a particular algorithm.

The performance of an algorithm is measured by the number of steps which the algorithm will take to terminate. A function is defined to place a boundary on the potential performance of the algorithm.

Take the function $f(x)=4x^2+3$, to find an upper bound we must find a function which, at some point, crosses the line of $f(x)$, and stays above it. This could be $4x^2+4$, $5x^2 + 3$, or $x^3$, etc...

The closest upper bound however would most likely be $4x^2+4$, which falls into the Quadratic complexity class, characterised by the function $n^2$, so we have $\mathcal{O}(n^2)$.

- Upper bound complexity $\mathcal O(\ldots)$.
- Tight bound (average) complexity $\Theta(\ldots)$.
- Lower bound complexity $\Omega(\ldots)$.

We mostly focus on the upper bound complexity, since this is kind of the worst case scenario. The following complexity classes are common:

- $\mathcal O(n)$
- $\mathcal O(\log n)$
- $\mathcal O(n\log n)$
- $\mathcal O(n^2)$
- $\mathcal O(n^3)$
- $\mathcal O(2^n)$
- $\mathcal O(n!)$

