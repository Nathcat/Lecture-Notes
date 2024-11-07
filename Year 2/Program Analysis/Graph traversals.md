Visiting each node in a graph is a non-trivial problem since by their nature graphs are non-linear and non-hierarchical data structures, unlike trees.
## Breadth-first search
Nodes are visited in order of increasing distance $d_{\textrm{source}}(\textrm{node})$ from our source $s$.
- We first visit nodes $n$ with $d_s(n)$=1
- Then $d_s(n)=2$
- and so on until all nodes have been visited

To do this we but discovered and _unexplored_ nodes into a queue structure.

We must also keep a record of which nodes have been discovered, to do so we could construct a search tree that records the search.
$$\displaystyle\begin{array}{l}
BFS(G,s): \\
\textrm{Let }Q\textrm{ be a queue containing just the node } s \\
\textrm{Let discovered }=D(s)=\textrm{true or } 1 \\ 
\textrm{Let discovered }=D(v)=\textrm{false or 0 for all } v\in V-{s} \\
\textrm{Let }T=(v,\{\}) \\
\textrm{while }Q\textrm{ is not empty} \\
\hspace{20pt}\textrm{remove }v\textrm{ from the front of }Q \\
\hspace{20pt}\textrm{for each edge}\{v,w\}\textrm{ in E where not }D(w) \\
\hspace{40pt}\textrm{let }D(w)=1 \\
\hspace{40pt}\textrm{add }w\textrm{ to the back of }Q \\
\hspace{40pt}\textrm{add edge }\{v,w\}\textrm{ to edges in }T
\end{array}$$
### Components of Graphs
You might have one graph which contains multiple disjointed graphs, i.e. graphs which are not actually connected via any node.

In these cases you still have only one graph, but that graph contains multiple _components_.

A component of a graph is defined as $G=(V, E)$
- A subset of the vertices in $G$ and all associated edges from $G$.
- Must be connected, i.e. there must be a path between any pair of vertices.
- Must be maximal, i.e. the cannot be enlarged  and remain connected.
Given this, we may revise our _BFS_ algorithm:
$$\displaystyle\begin{array}{l}
BFS(G):
\textrm{Let }D(v)=0\textrm{ for all }v\in V \\
\textrm{Let }T=(V,\{\}) \\
\textrm{for each }v\in V \\
\hspace{20pt}\textrm{if not }D(v) \\
\hspace{40pt}BFS(G,v)
\end{array}$$
$$\displaystyle\begin{array}{l}
BFS(G,s): \\
\textrm{Let }Q\textrm{ be a queue containing just the node } s \\
\textrm{Let discovered }=D(s)=\textrm{true or } 1 \\ 
\textrm{while }Q\textrm{ is not empty} \\
\hspace{20pt}\textrm{remove }v\textrm{ from the front of }Q \\
\hspace{20pt}\textrm{for each edge}\{v,w\}\textrm{ in E where not }D(w) \\
\hspace{40pt}\textrm{let }D(w)=1 \\
\hspace{40pt}\textrm{add }w\textrm{ to the back of }Q \\
\hspace{40pt}\textrm{add edge }\{v,w\}\textrm{ to edges in }T
\end{array}$$
### BFS Forest
Therefore $T$ may consist of more than one tree, one for each component of $G$.

So we might call $T$ a _Breadth-first Search Forest_.

The number of edges in $T$ will be $n-k$, where $G$ contains $k$ components.
### Running time of BFS
The while loop will run $n$ times, once for each node in $G$, the inner loop will iterate as many times as $n$ has edges, if we say that $G$ contains $m$ edges, then we can say that the running time of $BFS(G,v)$ is $\Theta(n+m)$.
## Depth First Search
This is another approach for the systematic exploration of a graph which instead of using a queue to store unvisited nodes, uses a _Stack_.

A node is recorded as explored once it is pooped from the stack, and we kay only explore nodes taken from the stack that haven't already been explored.

We record edges in the search tree by remembering the latest parent of each node, which may change up until the point where that node is explored.

$$\displaystyle\begin{array}{l}
DFS(G,s): \\
\textrm{Let }S\textrm{ be a stack containing just the node }s \\
\textrm{Let explored }E(v)=0\textrm{ for all }v\in V \\
\textrm{while }S\textrm{ not empty}\\
\hspace{20pt}v=pop(S) \\
\hspace{20pt}\textrm{if not }E(v) \\
\hspace{40pt}\textrm{for each edge }\{v,w\}\textrm{ in } E \textrm{ where not }E(w) \\
\hspace{60pt}push(w\to S) \\
\hspace{60pt}\textrm{Let }parent(w)=v \\
\hspace{40pt}E(v)=true
\end{array}$$