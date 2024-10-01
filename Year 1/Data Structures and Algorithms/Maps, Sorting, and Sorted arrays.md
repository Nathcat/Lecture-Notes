## Maps
A Map stores data in reference to a key. They allow you to search, insert, and remove items by only working with the keys.

This can be used to _map_ a certain key to a piece of data.

Maps are also known as dictionaries or associative arrays.
## Interface
Maintain a collection of $n$ items, each carrying a uniquely identifying key $x_{key}$.

- `FIND(k)` - Return the item stored with key $k$.
- `INSERT(x)` - Add $x$ to map (if an item with $x_{key}$ already exists, then replace the existing record with $x$).
- `REMOVE(k)` - Remove and return the item stored with $k$.
- `BUILD(X)` - Build a map from items in collection $X$.
- `LEN()` - Return $n$, the number of items stored in the map.
## Ordered Map interface
If keys are somewhat comparable, i.e. they come from a _totally ordered set_, such as an integer, then we may support additional operations:

- `ITER_ORD()` - Returns items one-by-one in key order.
- `FIND_MIN()` - Return item with the smallest key.
- `FIND_MAX()` - Return item with the largest key.
- `FIND_NEXT(k)` - Return the item with the smallest key larger than $k$.
- `FIND_PREV(k)` - Return the item with the largest key smaller than $k$.

All these operations return `None` If there are not qualifying items.

| Data Structure      | Container<br>`BUILD(X)` | Static<br>`FIND(k)` | Dynamic<br>`INSERT(x)`<br>`REMOVE(k)` | Order<br>`FIND_MIN()`<br>`FIND_MAX()` | Order<br>`FIND_PREV(k)`<br>`FIND_NEXT(k)` |
| ------------------- | ----------------------- | ------------------- | ------------------------------------- | ------------------------------------- | ----------------------------------------- |
| Array               | $n$                     | $n$                 | $n$                                   | $n$                                   | $n$                                       |
| Sorted array        | $n\log n$               | $\log n$            | $n$                                   | $1$                                   | $\log n$                                  |
| Direct access array | $u$                     | $1$                 | $1$                                   | $u$                                   | $u$                                       |
| Hash table          | $n_{(e)}$               | $1_{(e)}$           | $1_{(e)(a)}$                          | $n$                                   | $n$                                       |
| Binary tree         | $n\log n$               | $\log n$            | $\log n$                              | $\log n$                              | $\log n$                                  |

### Arrays as inefficient maps
You may implement a Map using any [[Dynamic Arrays, Stacks, and Queues|sequence data structure]]. If we were to use a static (or dynamic array), then we would simply place new items at the end of the structure, if its key is not already present.

The problem with this is that all operations are then executed in $O(n)$.

| Data structure | Container<br>`BUILD(X)` | Static<br>`FIND(k)` | Dynamic<br>`INSERT(x)`<br>`REMOVE(k)` | Order<br>`FIND_MIN()`<br>`FIND_MAX()` | Order<br>`FIND_PREV(k)`<br>`FIND_NEXT(k)` |
| ---- | ---- | ---- | ---- | ---- | ---- |
| Array | $O(n)$ | $O(n)$ | $O(n)$ | $O(n)$ | $O(n)$ |
## The Sorting problem

> **Input:** A static array $A$ of numbers $[a_0,\ldots ,a_{n-1}]$.
> **Output:** A static array $B=[b_0,\ldots ,b_{n-1}]$ which is a permutation of $A$ and such that $b_0\leq b_1\leq\ldots\leq b_{n-1}$.

Selection and Insertion sort are common algorithms that solve the sorting problem in a simple way (although inefficient for large inputs). Both are _**incremental**_, meaning that they maintain and grow a sorted sub-array of $A$ until all $A$ is sorted.

### Selection Sort
This algorithm maintains $A[0,\ldots ,i-1]$, it finds the minimum element in the sub-array $A[i\ldots ]$, and swaps it with $A[i]$.

```
for i <- 0 to n - 2 do
	MIN <- i
	for j <- i + 1 to n - 1 do
		if A[j] < A[min] then
			MIN <- j
	A[i] <-> A[MIN]
return A
```

Running with $\Theta (n^2)$, $O(n)$, and $\Omega(1)$ (average, worst, and best cases).
### Insertion sort
Maintains $A[0\ldots i-1]$, and takes $A[i]$ and repeatedly swaps it with its left neighbour until it reaches its appropriate place in $A[0\ldots i]$.

```
for i <- 1 to n - 1 do
	PTR <- i
	while PTR > 0 and A[PTR] < A[PTR - 1] do
		A[PTR] <-> A[PTR - 1]
		PTR <- PTR + 1
return A
```

- $\Omega(1)$
- $\Theta(n^2)$
- $O(n^2)$.
### In place, stable algorithms
> An algorithm is said to be **in place** if it uses $O(1)$ additional space on top of the input.
> A sorting algorithm is said to be **stable** if it preserves the relative order of items of the same value.

- Both insertion and selection sort are stable
- insertion sort is stable, but selection sort isn't.
- Merge sort is not in place (uses $\Theta(n)$ temporary storage), but is stable.

### Merge sort
This works by splitting the array to be sorted in half recursively, until there is one item remaining in the sub list. We then move back up through the recursion tree, merging each sub array back together in the correct order.

```
if n <= 1 then
	return A
else
	M <- (n-1)/2
	L <- BUILD_staticarray(M), R <- BUILD_staticarray(n-M)    // O(n)
	copy A[0...(M-1)] to L, copy A[M...n-1] to R              // O(n)
	merge_sort(L)
	merge_sort(R)
	copy merge(L, R) to A                                     // O(n)
	return A
```

#### Complexity of Merge sort
If $T(n)$ is the time cost for merge sorting $n$ numbers, then $T(n)=2\cdot T(\frac{n}{2})+\Theta(n)$.

$$\begin{array}{l}
T(1)=\Theta(1) \\
T(n)=2T(\frac{n}{2})+cn \\
=2\left[2T(\frac{n}{4})+c\frac{n}{2}\right]+cn \\
=4T(\frac{n}{4})+2cn\\
\vdots
\end{array}$$

This will stop once we divide $n$ by enough times to reach $1$, after $log_2(n)$ times. At which point we get:
$$
T(n)=nT(1)+cn\log n\in\Theta(n)+\Theta(n\log n)=\Theta(n\log n)
$$
Note that we are not saying these are equal, we are simply saying that the expression on the left falls into the complexity class given on the right.

## Comparison sorting algorithms analysis
if we consider a binary tree, where each node is a comparison between two elements in the list we are sorting, and each leaf is a sorted state. Then the number of comparisons required to reach any state in the worst case is $\geq$ the height of the tree.

The height of a binary tree with $k$ leaves is at least $\log k$.

There will be $n!$ possible permutations of an array of size $n$, so any comparison based sorting algorithm must produce a tree of height at least $\log n!$.

$$\begin{array}{l}
n!=n\cdot (n-1)\ldots 2\cdot 1 \\
\geq n\cdot(n-1)\ldots(\frac{n}{2}+1) \\
\geq \frac{n}{2}\cdot\frac{n}{2}\ldots\frac{n}{2} \\
=\left(\frac{n}{2}\right)^{\frac{n}{2}} \\
\end{array}$$

$$\begin{array}{l}
\log n!\geq\log\left[\left(\frac{n}{2}\right)^{\frac{n}{2}}\right]=\frac{n}{2}\log\left(\frac{n}{2}\right)=\frac{1}{2}n\log n-\frac{1}{2}n\geq\frac{1}{4}n\log n \\ n\geq 4
\end{array}$$
## Sorted arrays for the Ordered Map Interface
A sorted array may be implemented as a dynamic array, making use of merge sort and [[Binary Search]] algorithm to implement most methods.

| Data structure | Container<br>`BUILD(X)` | Static<br>`FIND(k)` | Dynamic<br>`INSERT_AT(i, x)`<br>`REMOVE_AT(i)` | Order<br>`FIND_MIN()`<br>`FIND_MAX()` | Order<br>`FIND_PREV(k)`<br>`FIND_NEXT(k)` |
| ---- | ---- | ---- | ---- | ---- | ---- |
| Array | $n$ | $n$ | $n$ | $n$ | $n$ |
| Sorted array | $n\log n$ | $\log n$ | $n$ | $1$ | $\log n$ |