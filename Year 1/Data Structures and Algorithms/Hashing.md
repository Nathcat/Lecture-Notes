We can achieve faster than $\log n$ time for `FIND(k)` in the [[Maps, Sorting, and Sorted arrays#Ordered Map interface|Ordered map interface problem]] if we don't make use of comparisons. We can use a [[Direct Access Array]] of size $u$ storing each $x$ at index $x_{key}$.

Then `FIND(k)`, `INSERT(x)`, and `REMOVE(k)` cost $\Theta(1)$ time, but order operations will require $\Theta(u)$ time and it will use $\Theta(u)$ space.

This space issue can be fixed by using a [[Direct Access Array]] $A$ of size $N=\Theta(n)$, together with a function:
$$h:\{0,\ldots,u-1\}\rightarrow\{0,\ldots,N-1\}$$
$h$ is called a _**hash function**_, and $A$ a _**hash table**_, $h(k)$ is the hash of the key $k$. We may now store item $x$ in $A[h(x_{key})]$.

## Collisions
Although, if $u>m$, then there will always exist at least two keys such that $h(k_1)=h(k_2)$. This is a collision. We might be able to find a _**perfect hashing**_ function if we know all the keys we want to store in advance, but this is not always the case.

A way to solve this problem might be to "chain" together items with the same hash. Have each index of $A$ point to a chain, which is a separate data structure implementing
- `FIND(k)`
- `INSERT(x)`
- `REMOVE(k)`
In no more than linear time (linear depending on the length of the chain), quite often linked lists and dynamic arrays are used.

Then `FIND(k) := A[h(k)].FIND(k)`
`INSERT(x) := A[h(x.key)].INSERT(x)`
`REMOVE(k) := A[h(x.key)].REMOVE(k)`


A good hash function should distribute the $n$ keys we're interested in evenly throughout the hash table of size $N$, which means that each chain has roughly length $\frac{n}{N}$, this is called the _**load factor**_.

Consider $h(k)=k \mod N$. The worst case scenario is that all keys are congruent over modulus $N$, and will then all be placed into the same chain.

In general, if $u>n\cdot N$, then every hash function will maps some $n$ keys to the same hash. The issue with this is that the performance of a data structure should be independent of the data we want to store, which is not the case here.
## Universal Hashing
Ahhhh here comes the Maths.

We might solve this problem by choosing a random hash function from a "nice", large family of hash functions, 

Take a prime $p>u$, consider any $a,b\in\{0,\ldots,p-1\}$ with $a\neq 0$, and $h_{a,b}:\{0,\ldots,u-1\}\rightarrow\{0,\ldots, N-1\}$, defined as:
$$h_{a,b}(k)=((ak+p\mod p)\mod N)$$
The family of functions
$$\mathcal{H}=\{h_{a,b}|a,b\in\{0,\ldots,p-1\}a\neq0\}$$
is _universal_, that is, for all distinct keys, $P_{h\in\mathcal{H}}(h(k_1)=h(k_2))\leq\frac{1}{N}$.

This implies (using probability theory), that the expected length of every chain is $\leq1+\frac{n-1}{N}$. Because $N=\Theta(n)$, this gives us $O(1)$ expected length of chains.
## Linear probing
Another way to handle collisions is to store items somewhere else in the hash table.  These strategies are known as _**open addressing**_. For example:

`INSERT(x)`. Attempt to insert in $A[h(x_{key})]$. If already occupied, try $A[h(x_{key}) + 1]$. Continue this until you find an empty slot, wrapping around if necessary.

The issue then is finding the item, since an item with key $k$ might not be in position $h(k)$. You must start searching at $h(k)$ and continue linearly until you find the item with key $k$, reach an empty cell, or you reach where you started (you have probed $N$ times). So the worst case here is $O(N)$.

Removing items presents a problem, we cannot simply remove an item once it is found, since then collided items after the removed one will be ignored by the search algorithm, so we should instead replace the removed item with a special item, which specifies an `AVAIL` state, rather than being an empty cell. This implies a change to the insertion algorithm instead, which should insert at either the first `AVAIL` slot, or the first empty cell after $h(k)$.

You might also want to look into _**double hashing**_ as another open addressing strategy.