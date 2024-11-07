The ordering of elements in a priority queue is determined by the priority assigned to each element, $a_1$ has as high a priority as any element in $a_1,\ldots,a_n$. This priority may change as computation proceeds.

## Unsorted list implementation
Here we simply define an array with elements arranged in an arbitrary order.

The issue here is that without any kind of sorting we cannot find the highest priority without iterating over the entire array. We could also pre-sort the array by its priorities.

If we were to sort the array, the best case for which would be $\Theta(n\log n)$, the access time for the highest and lowest priorities would be constant, but adding a new item would take $\Theta(n)$, since we would have to iterate through to find the correct position.

If we left it unsorted, the complexity for finding the highest and lowest priorities become $\Theta(n)$, but adding a new element becomes constant $\Theta(1)$.

We should analyse the situation in which the algorithm will be applied, and use this information to determine which is more beneficial to us, which operations will be used more.

## Heap implementation
I feel like this is fairly self-explanatory, but just worth noting that priority queues can be implemented with heaps.