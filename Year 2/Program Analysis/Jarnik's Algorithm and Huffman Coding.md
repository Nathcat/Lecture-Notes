# Jarnik's Algorithm
- Grows the tree from an arbitrary starting point
- As the tree grows, it spans an increasing number of vertices
- Grows by one at each iteration
- Selects the edge the connects the closest vertex to the tree produced so far

Let $G=(V,E)$
And our spanning tree: $G'=(S,E')$ where $S\subseteq V$ and $E'\subseteq E$.

Note that we record the distance of $v\in V$ from our spanning tree $G'=(S,E')$ as $\delta(v)$.

The identity of a vertex $u\in S$ where $\delta(v)=w(v,u)$ with $\beta(v)$, i.e $u$ is the parent of $v$, and $\beta(v)=u$.

The values of $\delta$ for each vertex must be maintained as $E'$ grows:

> When adding $u$ into $S$, the algorithm must check all edges from $u$ to some vertices $v$ not yet in $S$ to see if $\delta(v)$ can be reduced.

Then as in Dijkstra's algorithm, we maintain a priority queue of vertices with lower $\delta$ values giving higher priority.

Hence we have _Jarnik's Algorithm_:
$$\displaystyle\begin{array}{l}
Jarnik(G,w):\\\\
\textrm{select some vertex }s\in V\textrm{ and let }\delta(s)=0 \\
E'=\emptyset \\
\textrm{for all }v\in V-\{s\}\textrm{ let }\delta(v)=\infty \\
\textrm{for all }v\in V\textrm{ let }\beta(v)=\bot \\
\textrm{let }Q\textrm{ be a priority queue containing elements of }V \\
\textrm{while }|E'|<|V|-1 \\
\hspace{20pt}\textrm{remove }u\textrm{ from the front of the priority queue }Q \\
\hspace{20pt}\textrm{if }\beta(u)\neq\bot\textrm{ then} \\
\hspace{40pt}\textrm{add }\{u,v\}\textrm{ to }E'\textrm{ where }\beta(u)=v \\
\hspace{20pt}\textrm{for each }\{u,x\}\in E\textrm{ where }x\textrm{ remains in }Q \\
\hspace{40pt}\textrm{if }\delta(x)>w(u,x)\textrm{ then} \\
\hspace{60pt}\textrm{let }\delta(x)=w(u,x) \\
\hspace{60pt}\textrm{let }\beta(x)=u \\
\textrm{return }E'
\end{array}$$
