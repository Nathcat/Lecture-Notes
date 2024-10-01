Graphs are mathematically represented as a set of vertices $V$ and a set of edges $E$:
$$G=(V,E)$$
Graphs can either be _Directed_ or _Undirected_, the difference between the two is found in the composition of their edges. In an undirected graph, edges are an unordered pair of two vertices:
$$u,v\in V,\space e=\{u,v\}\in E$$
In a directed graph, edges are an ordered pair of two vertices:
$$u,v\in V,\space e=(u,v)\in E$$
## Definitions
### Directed graph
_**Outgoing Neighbour set**_ - This is the set of all nodes $v$ which satisfy $(u,v)\in E$, $\therefore Adj^+(u)=\{v\in V\space|\space(u,v)\in E\}$.
_**Incoming Neighbour set**_ - This is the set of all nodes $v$ which satisfy $(u,v)\in E$, $\therefore Adj^-(u)=\{v\in V\space|\space(v,u)\in E\}$.
_**Outgoing degree**_ - $deg^+(u)=\|Adj^+(u)\|$.
_**Incoming degree**_ - $deg^-(u)=\|Adj^-(u)\|$.
### Undirected graph
_**Neighbour set**_ - $Adj(u)=\{v\in V\space|\space\{u, v\}\in E\}$.
_**Degree**_ - $deg(u)=\|Adj(u)\|$.
## Handshaking Lemma
>If $G=(V,E)$ is undirected, then $\displaystyle\sum_{v\in V}deg(v)=2\cdot\|E\|$.
>If $G=(V,E)$ is directed, then $\displaystyle\sum_{v\in V}deg^+(v)=\|E\|=\sum_{v\in V}deg^-(v)$.

## Maximum number of edges
The maximum number of edges in a directed graph is one edge from every node to every other node, so $\|V\|-1$ from every node, which gives 
$$\|E\|\leq\|V\|\cdot(\|V\|-1)$$
Conversely, the maximum number of edges in an undirected graph is half the number of edges in a directed graph, since the edges are bidirectional rather than unidirectional, giving
$$\displaystyle\|E\|\leq\frac{\|V\|\cdot(\|V\|-1)}{2}$$
So whether $G=(V,E)$ is directed or undirected, we have $\|E\|=\mathcal{O}(\|V\|^2)$.
## Static Graph interface
The problem solved by this interface is to store a graph $G=(V,E)$, either directed or undirected, which supports the following operations:
- `VERTICES()` - Return iterable of vertices in $G$.
- `EDGES()` - Return iterable of edges in $G$.
- `FIND_EDGE(u, v)` - Return an edge $(u,v)$ if it exists, otherwise return `None`.
- `DEGREE(u)` - Return $deg(u)$ if $G$ is undirected, $deg^+(u)$ otherwise.
- `ADJ(u)` - Return $Adj(u)$ if $G$ is undirected, $Adj^+(u)$ otherwise.
### Approaches
- Edge list
	- Store vertices in an unsorted dynamic array or linked list, and store the edges in a separate dynamic array or linked list.
- Adjacency list
	- For each vertex $u$, store a list (static array or linked list) $Adj(u)$ containing all adjacent vertices to $u$.
- Adjacency matrix
	- Uniquely label each vertex with a number in $\{0,\ldots,\|V\|-1\}$.
	- Store a matrix of size $\|V\|\times\|V\|$, such that
$$A_{i,j}=\begin{cases}1 & \text{if there is an edge from vertex }v_i\text{ to }v_j \\ 0 & \text{otherwise}\end{cases}$$
These approaches have the following performances:

| Approach         | `VERTICES()` | `EDGES()`     | `FIND_EDGE(u, v)` | `DEG(u)` | `ADJ(u)` | Space $\Theta()$ |
| ---------------- | ------------ | ------------- | ----------------- | -------- | -------- | ---------------- |
| Edge list        | $\|V\|$      | $\|E\|$       | $\|E\|$           | $\|E\|$  | $\|E\|$  | $\|V\|+\|E\|$    |
| Adjacency list   | $\|V\|$      | $\|V\|+\|E\|$ | $deg(u)$          | $1$      | $deg(u)$ | $\|V\|+\|E\|$    |
| Adjacency matrix | $\|V\|$      | $\|V\|^2$     | $1$               | $\|V\|$  | $\|V\|$  | $\|V\|^2$        |
Overall the adjacency list approach has the best performance, and therefore we will assume that all graphs are implemented using this approach.
## Paths in a graph
A _**Path**_ is defined as a sequence of vertices $\mathcal{p}=\langle v_0,\ldots,v_k\rangle$, with $k\geq0$, where $(v_i,v_{i+1})\in E$.

The length of a path is given by the $\|\mathcal{p}\|-1$, so the number of edges, or the number of vertices - 1.

For every vertex $v$, the sequence $\langle v\rangle$ is a path from $v$ to $v$ of length $0$.
### Simple paths and simple cycles
**Cycles in directed graphs** have the same starting and finishing vertex containing at least one edge.

**Cycles in undirected graphs** have the same starting and finishing vertex, but all edges must be distinct.
## Trees
An _**Acyclic graph**_ is a graph which has _no cycles_, a _**Tree**_ is a connected, acyclic, undirected graph, and a _**Forest**_ is an acyclic, undirected graph, so a collection of trees which are not connected.
## Reachability
A vertex $v$ is _**reachable**_ from vertex $u$ if there is a path from $u$ to $v$.

An undirected graph is _**connected**_ if every vertex is reachable from all other vertices.

A directed graph is _**Strongly connected**_ is every two vertices are reachable from each other.

### Single Pair Reachability problem
> _**Input**_ - $G=(V,E),\space s,t\in V$.
> _**Output**_ - True if $t$ is reachable from $s$.

### Single Source Reachability problem
> _**Input**_ - $G=(V,E),\space s\in V$.
> _**Output**_ - A list of all $v\in V$ which are reachable from $s$.

Single source reachability (SSR) is solved by depth first search.

## Distance between vertices
The function $\delta:u,v\in V\mapsto\mathbb{R}$ gives the shortest distance between the vertices $u$ and $v$.

This gives way to the Single Pair Shortest Path problem:
> _**Input**_ - $G=(V,E),\space s,t\in V$.
> _**Output**_ - The distance $\delta(s,t)$, and the path $\langle s,\ldots ,t\rangle$.

If SPSP can be solved, then SPR can be solved.
1. Run SPSP
2. If $\delta(s,t)\neq\infty$, return true, otherwise return false.
We have reduced the SPR problem to the SPSP problem, which makes SPSP at least as hard as SPR.

### Single Source Shortest Path problem
> _**Input**_ - $G=(V,E),\space s\in V$.
> _**Output**_ - A list of $\delta(s,v)$ for all $v\in V$, and a shortest path tree which contains the corresponding shortest paths from $s$ for every $v\in V$ reachable from $s$.

## Breadth First Search
> _**Input**_ - $G=(V,E),\space s\in V$.
> _**Output**_ - $G$ where each $v\in V$ stores its' distance from $s$ and its predecessor in a shortest path from $s$, if one exists.

```
Q <- BUILD_QUEUE()
Q.ENQUEUE(s)
while Q is not empty do
	u <- Q.DEQUEUE()
	for each vertex v adjacent to u (Adj(u)) do
		if v has not been visited then
			v.DIST <- u.DIST + 1
			v.PRED <- u
			Q.ENQUEUE(v)
```

The runtime analysis of BFS would be as follows.
The while loop will run once for every vertex in the graph, so it runs $\|V\|$ times.
The inner for loop will run $deg(u)$ many times, plus the 1 from the other line in the while loop, we have:

$$\displaystyle\mathcal{O}\left(\sum_{u\in V}1+\deg(u)\right)=\mathcal{O}(\|V\|+\|E\|)$$

If $G$ is implemented using the adjacency list approach.

It can also be proved that $\delta(s,v)=v_{dist}$ as calculated by BFS, for all $v\in V$.

## Depth First search
> _**Input**_ - $G=(V,E),\space s\in V$.
> _**Output**_ - $G$ where each $v\in V$ stores its' predecessor in a path from $s$, and an array $F$ storing vertices in the finished-visiting order.


```
F <- BUILD_DYNAMIC_ARRAY()
DFS(G, s)
return G, F
```

```
PROCEDURE DFS(G, u)
	for each vertex v in Adj(u) do
		if not v.VISITED then
			v.PRED <- u
			DFS(G, v)
	v.VISITED <- true
	F.INSERT_LAST(u)
```

Runtime analysis yields 