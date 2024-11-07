Yeah so I remember this from A-Level.

_Anyway_.

# Anomalies
Data in databases may contain redundancies caused by poor table design, this may cause so called _anomalies_ to arise from DBMS operations.

- Insertion anomalies
	- Duplication of data is enforced, which is a source of potential inconsistency.
	- Made impossible due to entity integrity.
- Deletion anomalies
	- Leads to undesired loss of data
	- Deleting one set of data deletes another related entities' data
- Modification anomalies
	- Need to modify several rows of data, which again is a source of potential inconsistency

# Functional Dependency
If $A$ and $B$ are attributes of a relation, $B$ is functionally dependent on $A$ if each value of $A$ is associated with exactly one value of $B$, each may consist of one or several attributes.

In this way functional dependency is a property of the meaning of the attributes in a relation, i.e. their semantics.

All attributes of a schema are functionally dependent on any key of the schema, these kind of dependencies are just on the level of one particular relation schema. $A\rightarrow B$ is short for a functional dependency of $B$ on $A$.

$A\rightarrow B$ is _full_, if $B$ does not functionally depend on any proper subset of $A$.

for example, if $\{clientNo, propNo\}\rightarrow startDate$, but neither $clientNo\rightarrow startDate$, or $propNo\rightarrow startDate$ are true, then this is a _full functional dependency_.