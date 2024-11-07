## Entity types
Entity types are defined by an entity schema, where their simple attributes are described as columns in a table, and composite attributes are decomposed into simple attributes. In the case of multiple-valued attributes, you should create a new relation schema where the primary key of the entity instance which owns the attribute is a foreign key, for example:
$$\displaystyle\begin{array}{l}
\textrm{Staff}(\underline{\textrm{staffNo}},\ldots) \\
\textrm{PhoneNumbers}(\underline{\textrm{number}},\underline{\textrm{staffNo}})
\end{array}$$
Derived attributes should not be included in the schema, but they should be noted in the documentation. They could be stored but you should weigh the cost of storing them against the cost of calculating them whenever they are needed.

Weak entity types should follow a similar structure to the implementation of multiple-valued attributes, the primary key of the parent entity should be stored as as primary key in the relation schema for the weak entity type.

## Relationships
### 1:M Relationships
- 1 side - parent
- M side - child
The child contains the primary key of the parent as a foreign key, again, a similar structure to multiple-valued attributes. Attributes of the relationship should be stored with the child.

1:1 relationships should be managed in a similar way.

These might also be represented in one of the following two ways:
- Cross-reference
	- A new table with foreign keys to the entities involved, similar to an M:N relationship
- Merged relation
	- This approach only works with total participation
	- Join involved entities and relationship attributes into one merged table
### M:N Relationships
Use a separate relation schema which contains the involved entities as foreign keys, along with any relationship attributes.
### Recursive Relationships
The entity involved in the relationship should contain a foreign key to itself.
### N-ary Relationships
This approach is used for Ternary relationships, that is, a relationship which involves more than 2 entities (a binary / recursive relationship).

A new relation schema should be created which includes the foreign keys linking to the involved entities along with any relationship attributes, again similar to the M:N approach.