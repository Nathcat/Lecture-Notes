A problem interface specifies a problem to be solved. A data structure represents a solution to the problem, or an implementation of it.

An interface asks the question of what data is to be stored, and which operations are supported, while a data structure describes how the data is stored, and defines the algorithms which implement the aforementioned operations.

## Static sequence interface
This problem is concerned with storing data in a static sequence, static meaning it cannot change. The items themselves may be changed but the properties of the sequence itself (length, data type, etc...) cannot be changed.

Operations:
- `BUILD(X)` - Build a static sequence from collection $X$.
- `ITER_SEQ()` - Get each item in the sequence.
- `GET_AT(i)` - Get $x_i$.
- `SET_AT(i, x)` - Set $x_i\leftarrow x$.
- `LEN()` - Return the number of items $n$ in the sequence.

This interface is solved using a simple, static array.
## Dynamic sequence interface
This problem is concerned with storing the data in a way such that the properties of the sequence itself may change. Items may be added / removed, and the sequence is dynamically resized accordingly.

This includes the same operations as a static sequence, with two additions:
- `INSERT_AT(i, x)` - Insert $x$ at $i$ such that $x_i\leftarrow x$, and all original $x_i\rightarrow x_{i+1}$, the same for all the following elements of the sequence.
- `REMOVE_AT(i)` - Remove and return $x_i$.

These are the most common implementations of this:
- Static arrays
- Linked lists
- Dynamic arrays

Note that static arrays are listed. You may implement a dynamic sequence using a static array, but this is not particularly efficient according to our [[Introduction#Computational model|model of computation]], when compared to something like a linked list implementation, but then referencing an element at a particular index would be faster in a static array implementation than a linked list.

The main downside of a linked list is that you cannot go straight to the middle / end without iterating through it to the desired point. There is the idea of a doubly linked list, which stores a pointer to the previous element in the list with each element, and a pointer to the tail of the list rather than just the head. This improves this issue, but does not completely solve it and the time to reference any particular item not at the front or end of the list still grows with a linear complexity (although in practice it would more than likely be faster).