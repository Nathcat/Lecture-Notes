>**Input:** A sorted array $A$, and an item $x$, $n=|A|$.
>**Output:** The index of $x$ in $A$, or `None` if $x\notin A$.

```
pL <- 1
pR <- n

while pL <= pR and A[(pL + pR) / 2] != x do
	if A[(pL + pR) / 2] < x then
		pL <- ((pL + pR) / 2) + 1
	else
		pR <- ((pL + pR) / 2) - 1

if pL > pR then
	return None
else
	return (pL + pR) / 2
```

Inserting into a sorted array is done using an algorithm which follows the same principle of a binary search, that it searches the array by eliminating half of the array at every iteration, and then inserting when it gets to a single element. I apologise for the vagueness of that description but I think it gets the point across.

|$\Omega(1)$|$\Theta(\log n)$|$O(\log n)$|
|---|---|---|
