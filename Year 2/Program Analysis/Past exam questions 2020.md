1a.
The algorithm is passed in two arrays $a$ and $b$, both of length $n$.

The value of $k$ is set to $0$ to start with, so should it remain unmodified, the algorithm will return `true`, since the end condition is `return k == 0`, which will return `true` if `k == 0`. $k$ is modified _only_ when $a_i< b_j$, so $k$ will be unmodified if for every $i$ and $j$, $a_i\geq b_j$, so all the elements of the array $a$ must be larger than or equal to all the elements in $b$.

Given the layout of the program, the best and worse case scenarios for this program must be the same, since the return statement is _always_ executed after the outer loop has finished. The number of times that the loops run is independent of the data, they will always _both_ run $n$ times.

Since they are nested loops, the outer loop runs $n$ times, and the inner loop also runs $n$ times, giving $n^2$ iterations of the inner loop's body, which runs in constant time. Which gives us:
$$\displaystyle\begin{array}{ccc}
\Omega(n^2)&\Theta(n^2)&\mathcal{O}(n^2)
\end{array}$$

b.
$q$ is modified when any such $a_i \neq b_j$, so all the elements of $a$ must equal all the elements of $b$, so the algorithm returns true when all the elements of $a$ equal all the elements of $b$, and false in any other case.

Since the inner loop has the opportunity to exit earlier based on the inputs, the best and worse case will be different. In the worst case, all the elements of $a$ equal all the elements of $b$, the outer loop will run $n$ times and the inner loop $m$ times per iteration of the outer loop, so we have $\mathcal{O}(nm)$.

In the best case, $a_0 \neq b_0$, so $q$ becomes false, and the inner loop _never runs again_, the outer loop continues to run the remaining $n-1$ times, which gives us $\Omega(n)$ for our lower bound.

We cannot guarantee the complexity class of our upper bound, so we cannot define a tight bound by its definition of being in the same class as both $\mathcal{O}$ and $\Omega$
