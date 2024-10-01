Recall the [[Problem Interfaces#Dynamic sequence interface|Dynamic sequence interface]].

The size of a Dynamic array satisfies:
$$
n<size(A)\leq4n
$$
The idea here is that we have some empty space at the end of the array, such that $len(A)\leq size(A)$. When $len(A)=size(A)$, we reallocate the array with more empty spaces (as per the condition above ($n=len(A)$)), and copy the original contents to the new allocation.

So if $len(A)<size(A)$, `INSERT_LAST(x)` costs $\Theta(1)$, but if $len(A)=size(A)$, it costs $\Theta(n)$. Note that the reallocation and copy will actually cost $2n$, but we drop the constant in $\Theta$ notation.

When reallocating, we allocate a new array of size $2\cdot size(A)$. This reduces the possibility that we will need to reallocate again.

If we make $n$ consecutive calls of `INSERT_LAST(x)`, we will need to resize the array at insertions 1, 2, 4, 8, 16, ..., k, where $k=2^{floor(log(n))}$.

$$
\Theta\left(\sum^{floor(log(n))}_{i=0}2^i\right)=\Theta\left(2^{floor(log(n))+1}-1\right)=\Theta(2^{log(n)})=\Theta(n)
$$
So we may say that the _average_ cost of one insertion is $\Theta(1)$.

This "spreading of cost" is called _**Amortised analysis**_. The occasional linear cost of inserting a new element can be "spread" over the larger number of constant time insertions. So on average we get $\Theta(1)$.

## Removing items
`REMOVE_LAST()` will cost $\Theta(1)$ time, there is no shifting need to allow for this removal.

The issue here is that we will be left with a lot of empty space. We might solve this by resizing the array when it gets too small. Like we did before, perhaps we should work in powers of two.

If $len(A)\leq \frac{size(A)}{2}$, then halve the array. The worst case that happens here is that we continue to insert and then delete, which will cost $\Theta(n)$ time per operation.

Another option is that we halve the array when $len(A)\leq\frac{size(A)}{4}$. This once again leads to $\Theta(1)$ amortised time and we ensure that $len(A)\leq size(A)\leq 4\cdot len(A)$ always.

## Stack interface
This problem is concerned with maintaining a sequence of $n$ items in a "vertical pile", with $x_0$ at the bottom, then $x_1$, etc... until $x_1$, such that we may only operate on the last item that was added to the Stack (Last In First Out behaviour).

- `PUSH(x)` - Add $x$ to the top of the stack.
- `POP()` - Remove and return the $x$ at the top of the stack.
- `PEEK()` - Return _but do not remove_ the $x$ at the top of the stack.
- `BUILD(X)` - Build a new stack from the collection $X$.
- `LEN()` - Return the number of items stored $n$.

The stack interface is a subset of the [[Problem Interfaces#Dynamic sequence interface|Dynamic sequence interface]], as such it can be solved efficiently by any structure which also solves the [[Problem Interfaces#Dynamic sequence interface|Dynamic sequence interface]].

### Stack with a dynamic array

`PUSH(x) := INSERT_LAST(x)` hence $\Theta(1)_{(a)}$.
`POP() := REMOVE_LAST()` hence $\Theta(1)_{(a)}$.
`PEEK() := GET_LAST()` hence $\Theta(1)$.

### Stack with a linked list
This may be implemented with either the head of the tail as the top of the stack.

`PUSH(x) := INSERT_LAST(x)` hence $\Theta(n)$.
`POP() := REMOVE_LAST()` hence $\Theta(n)$.
`PEEK() := GET_LAST()` hence $\Theta(n)$.

## Queue interface
The problem here is to maintain sequence of $n$ items such that only $x_0$ can be removed, and a new item can only be added at the back (first in last out behaviour).

- `ENGUEUE(x)` - Adds $x$ to the back of the queue.
- `DEQUEUE()` - Removes and returns the front of the queue($x_0$).
- `FIRST()` - Returns (without removing) the front of the queue.
- `BUILD(X)` - Builds a new queue from the collection $X$.
- `LEN()` - Returns the number of items stored by the queue $n$.

Like the Stack, the Queue interface is a subset of the dynamic sequence interface, and is solved efficiently by **circular arrays**, and linked lists.

### Dynamic array approach

`ENQUEUE(x) := INSERT_LAST(x)` - Costs $\Theta(1)$ amortised time.
`FIRST() := GET_FIRST()` - Costs $\Theta(1)$ time worst case.
`DEQUEUE() := REMOVE_FIRST()` - Takes $\Theta(n)$ time because of the shifting, the other items must be shifted back into place once the first item is removed. We might fix this if we drop the constraint that `ARRAY[i]`$=x_i$, then `DEQUEUE()` costs $\Theta(1)$ time.

To allow for this constraint to be dropped we must use modular arithmetic to find where items should be added to the Queue, so that we might "wrap around" the end of the array.

### Circular arrays
Dropping the constraint that `ARRAY[i]`$=x_i$ is the point of a circular array. Otherwise a circular array is identical to a dynamic array, it just does not have this constraint.

Note that when changing the size of the array, the items should be reordered such that the front of the queue is at the front of the new array, and the front and end pointers should be reset, otherwise the modular arithmetic used for wrapping around the array will not function properly.

### Linked lists
Ordinary linked lists will have $\Theta(1)$ time operations on the head of the list, but $\Theta(n)$ on the tail. Doubly linked lists will however perform `INSERT_LAST` in $\Theta(1)$, so this would be the best choice for implementing Queues with a linked list.

## Deques
A Deque is like a queue where we want to insert at / remove / access _both_ ends of the sequence.

They can be implemented efficiently by both circular arrays and doubly linked lists.