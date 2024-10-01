A binary tree is a linked data structure where items are stored as nodes. Each node contains pointers to three other nodes:
- Parent
- Left child
- Right child.
And of course a pointer to the item's data.

In a binary tree there is exactly one node with no parent, the _**root**_ node. Nodes with no children are called _**leaves**_, nodes with at least one child are called _**internal nodes**_.

Some terminology:
- _**Path**_ - Sequence of consecutive edges, the length of which equals the number of edges traversed.
- _**Ancestors** of a node $X$_ - Nodes (including $X$) in the unique path from $X$ to the root. _**Descendants** of $X$_ then are the nodes for which $X$ is an ancestor.
- _**Sub-tree rooted at $X$**_ - Sub-tree involving all and only the descendants of $X$, with $X$ as the root.
- _**Depth** of a node $X$_ - Length of unique path from $X$ to the root.
- _**Height** of a node $X$_ - Length of the longest path from $X$ to any descendant leaf of $X$. i.e. the maximum depth in the sub-tree rooted at $X$. The height of the entire tree then is the height of its root.
- _**Level** $i$ of a tree_ - The set of nodes at depth $i$ in the tree.
## Complete binary trees
A binary tree is called complete if there are $2^i$ nodes at depth $i$, except for the max depth, where nodes are _left-justified_.
## Bounds for the height of a binary tree
A linked list will require $O(n)$ time to access any particular item in the list. With a tree it will take $O(h)$, where $h$ is the height of the tree. The relationship between the number of nodes $n$ and the height of the tree $h$ can be describe as follows:

If we only have one node per level, then $n=h+1$, this is clearly the smallest tree we can have.

If we have a _**perfect tree**_, that is, every level is filled with as many nodes as possible, then
$$n=\sum_{i=0}^h2^i=2^{h+1}-1$$
Then we have the bounds
$$h+1\leq n\leq 2^{h+1}-1$$
and
$$\log\left(n+1\right)-1\leq h\leq n-1$$
Hence the height of a binary tree of $n$ nodes is $\Omega(\log n)$.
# AVL Trees
An AVL tree is a variation of a binary search tree which ensures that the performance of the tree is optimal with the following complexities:

- `BUILD(X)` - $O(n\log n)$.
- `FIND(k)` - $O(\log n)$.
- `INSERT(x)` and `REMOVE(k)` - $O(\log n)$.
- `FIND_MIN()` and `FIND_MAX()` - $O(\log n)$.
- `FIND_PREV(k)` and `FIND_NEXT(k)` - $O(\log n)$.

The performance of a binary search tree is dependent on the height of the tree, which is dependent on the way that the items in the tree are inserted. In order to avoid this we could reorder the tree to ensure that it is in the most optimal ordering, in which $h=\log n$.

## Balance factor
The tree should be re-balanced when the following condition is broken:
$$b(n)=h(n_{right})-h(n_{left})\in[-1,1]$$
$b(n)$ is called the balance factor of the sub-tree rooted at $n$.

This re-balancing is done by "rotating" individual nodes.