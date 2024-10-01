The problem we are presented with here is to match up pairs of people from different groups.

A _**perfect match**_ is defined as a state where every item from one group is paired to one item from a different group, with no overlaps. Every item is paired to a single, different item from another group. This does not necessarily mean that they are _good_ matches.

In order to create a _good_ match we might use the idea of _preferences_:

Blue                     Red
A                          W
B                           X
C                           Y
D                           Z

Blue preferences:

| Item | 1st | 2nd | 3rd | 4th |
| ---- | --- | --- | --- | --- |
| A    | X   | Z   | W   | Y   |
| B    | X   | Y   | W   | Z   |
| C    | W   | X   | Y   | Z   |
| D    | Z   | X   | Y   | W   |

Red preferences:

| Item | 1st | 2nd | 3rd | 4th |
| ---- | --- | --- | --- | --- |
| W    | A   | B   | D   | C   |
| X    | C   | D   | B   | A   |
| Y    | A   | D   | B   | A   |
| Z    | D   | A   | B   | C   |

Propose the following matches:
A-Y
B-W
C-Z
C-X

This is a _**perfect match**_ state, however C and Z are both each other's last choice, which is not a _good_ match. Z and D however are better matches for each other than they're proposed matches, so they might _elope_ together. So this is not a good solution to our problem. We call this kind of solution an _**unstable**_ solution, despite the fact that it is a _**perfect match**_.

Note that the idea of an _elopement_ is based on both items involved having a stronger _mutual_ attraction to each other than their existing matches, i.e. C would prefer Y to Z, but Y prefers A over C, and is currently matched with A, so this is _not_ an instability.

## What is a problem?
A problem is:
- A specification of a relationship between inputs and outputs
- Usually a mapping, where there is one valid output for a given input.

A problem does not define a way of doing something, and is not procedural. The [[The Stable Match Problem]] is a fairly generic problem.

An _**Algorithm**_ therefore is a specification of a way to solve a problem. It can be abstract and make use of informal pseudo-code language. An _**Algorithm**_ is not the same as a _**Program**_, which is an implementation of an _**Algorithm**_.

## Specification of the sorting problem
Given a sequence of values $V$ and some description of an ordering (ascending, descending, etc...), produce a permutation of $V$ which orders items of $V$ in the order described by the ordering.

The _ordering_ here is called an _ordering relation_, which defines a way to determine the order of a pair of items. An example of this in Java is a _comparator_.

## Specification of the search problem
Given a set of values $V$ and a target item $T$, find the index $i$ where $V_i=T$.

## Specification of the stable match problem
### Input
Two sets of entities $A$ and $B$ and two sets of preferences for items in $B$ from $A$, and vice versa.
### Output
A set of pairs $S$ where the first item in the pair is from $A$ and the second is from $B$, such that $S$ is a _**perfect match**_ and $S$ is stable.

## Gale and Shapley (1962)
This is an algorithm intended to solve the stable match problem.
```
initialise each person to be free
while some blue person is free & has red people to propose to
	choose one available blue person A'
	let B' be the next best option  A''s preference list
	if B' is free
		assign A' and B' to be engaged
	else if B' prefers A' to B''s fiance A"
		assign A' to B' to be engaged, and A" to be free
	else
		B rejects A
```

Note that there might be multiple solutions to this problem, the specification of the problem gives no reason to prefer on solution over another as long as they are both _**Perfect and Stable matches**_. Which one this algorithm will find depends on which member of the set $A$ it chooses first.