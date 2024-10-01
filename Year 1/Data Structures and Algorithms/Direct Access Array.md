This data structure forms a solution to the [[Maps, Sorting, and Sorted arrays#Ordered Map interface|Ordered Map Interface]], implementing `FIND(k)` in $\Theta(1)$.

We have a collection of $n$ items each carrying a key $x_{key}$. If we assume that this key is an integer, and that all keys lie within a bounded range from $0$ to some number $u-1$, we may implement this structure using a static array of size $u$, storing each item $x$ at the index $x_{key}$.

Note that we would need $u<2^w$, where $w$ is the word size of our RAM model of computation, for the processor to be able to address the entire structure.

As a result of this implementation we have `FIND(k)`, `REMOVE(k)`, and `INSERT(x)` costing $\Theta(1)$, the main downside of this is that it takes a lot of memory $\Theta(u)$ space. Order operations also require $\Theta(u)$ time.