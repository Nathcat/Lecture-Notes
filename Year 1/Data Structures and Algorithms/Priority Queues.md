## Max-Priority Queue interface
- `INSERT(x)` - Add item $x$ to the data structure.
- `REMOVE_MAX()` - Remove and return the stored item with the largest key.
- `FIND_MAX()` - Return without removing stored item with the largest key.
- `BUILD(X)` - Build priority queue from iterable $X$.

Each item $x$ has a key attached to it which is its' priority, as such the keys are of course part of an ordered set.

The queue can be sorted such that all the items are in key order.