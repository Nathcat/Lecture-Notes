Directed Graphs can be used to describe task dependencies _(Dependency Graphs)_, each node corresponds to a task, and edges encode constraints on the order in which tasks must be performed. Such a structure would need to avoid any cycles, since that would suggest there is no possible scheduling order which satisfies the given constraints.

## Topological sorting of Directed Graphs
A topological ordering of a directed graph $G=(V,E)$ is a permutation of the vertices in $V$ that is compatible with each edge in $E$, a permutation $(v_1,\ldots,v_n)$ is compatible with an edge $(v,w)$ if $v=v_i$, $w=v_j$, and $i<j$.

For a particular edge $A\rightarrow B$, $A$ must be completed before $B$, i.e. $B$ is dependent on $A$, $A$ is a dependency of $B$, etc...

So when performing a topological sort, we must start with a node which is not dependent on any other node.
![[Graph_Y2_PA_Lec4_toposort.png]]
In this graph both $E$ and $C$ are not dependent on any node, so we could start with either.

Suppose we start with $E$
$$V=\{E\}$$.We could then move to either $G$ or $C$, since $G$ is only dependent on $E$, which we have just scheduled.

Lets choose $G$.
$$V=\{E,G\}$$
$G$ is a dependency of $D$, but so is $F$, so we cannot continue with $D$, so lets choose $C$.
$$V=\{E,G,C\}$$
Looking at the nodes connected to $C$, we have $A$, $B$, and $F$, $B$ is dependent on $A$ and $E$ (we have scheduled $E$ but not $A$), leaving $F$ and $A$ as valid steps, lets choose $A$.
$$V=\{E,G,C,A\}$$
And so on, until $V$ contains all the nodes given.

A valid permutation of $V$ here might be $$V=\{E,G,C,A,B,F,D,H\}$$
If we had a cycle in the graph, we would not be able to schedule the tasks involved in the cycle properly. A task can be safely scheduled when everything that it depends on has already been scheduled.

Given this, we need to start with a node which has _no incoming edges_. As the algorithm progresses, we may remove the _outgoing edges_ of each node as they are scheduled, so that we may reduce the _incoming edge count_ of nodes which depend on that node we have just scheduled. Only when a node has an _incoming edge count_ of $0$ can it be scheduled.

This suggests the following algorithm to solve the Topological sort problem.
$$\displaystyle\begin{array}{l}
TopologicalSort(G): \\
\hspace{20pt}\textrm{Let }S\textrm{ be an empty stack} \\
\hspace{20pt}\textrm{for each vertex }v\in V \\
\hspace{40pt}\textrm{if }indegree(v)=0\textrm{ then push }v\rightarrow S \\
\hspace{20pt}\textrm{while }S\textrm{ is not empty} \\
\hspace{40pt}\textrm{pop }u\leftarrow S \\
\hspace{40pt}\textrm{schedule }u \\
\hspace{40pt}\textrm{for each }(u,w)\in E \\
\hspace{60pt}indegree(w)-1 \\
\hspace{60pt}\textrm{if }indegree(w)=0 \textrm{ then} \\
\hspace{80pt}\textrm{push }w\rightarrow S
\end{array}$$
We have a running time of $\Theta(n+m)$.

Note that this algorithm would work with both a stack and a queue, and in fact if you wanted to specify that one task is more important than the other then you should use a priority queue rather than a stack.