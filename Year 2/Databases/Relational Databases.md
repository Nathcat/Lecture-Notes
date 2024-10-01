A _Relational Database Management System (RDBMS)_ comes with a:
- Data Definition Language
- Data Manipulation Language
	- Procedural
	- Non-procedural / Declarative
- Data Control Language

_DDL_ is low level, so we have a need for a higher-level description.

The Relational Model is based on Codd's Seminal paper of 1970.

## Relational Data Model
- _**Relation**_ - Table with columns and rows
- _**Attribute**_ - Named column
- _**Tuple**_ - A row of a relation
- _**Domain**_ - The set of allowable values for an attribute

### Properties of Relations
- _**Degree**_ - The number of attributes
- _**Cardinality**_ - The number of Tuples
- _**Relational database**_ - A collection of appropriate relations

- Name must be unique
- Attribute names are unique _only per relation_.
- Values of one attribute are of the same domain.
- Order of attributes has no significance.
- Order of tuples has no significance semantically, but may influence efficiency.
## Relation Schemas
A _**Relation Schema**_ is a named relation defined by a set of attributes, for example:
```
Branch(branchNo, street, city, postcode)
```

A _**Relational Database Schema**_ is a set of relation schemas with a distinct name.

A _**Relation Instance**_ is a tuple of a relation compliant with its schema, for example:
```
((branchNo, 5), (street, 22 Deer Rd), (city, London), (postcode, SW1 4EH))
```

## Relational Keys
- _**(Super) Key**_ - An attribute _or a set of attributes_ that uniquely identify a tuple within a relation.
- _**Candidate Key**_ - A super key such that no proper subset is a super key (minimal super key).
- _**Primary Key**_ - The Candidate key in use in a relation. In a relation schema it is usually underlined.
- _**Foreign Key**_ - An attribute or set of attributes within one relation that matches the candidate key of some other (or potentially the same) relation.
## Relational Integrity
When manipulating data we must make sure that data is accurate and consistent.

To ensure this the following integrity rules are in force:
- _**Domain constraints**_ - Data values must live in the specified domain
- _**Entity integrity**_ - Value of a primary key must not be null and must be unique for the table
- _**Referential integrity**_ - If there is a foreign key then its value must match to a primary key in the referenced relation or must be null
- _**Enterprise constraints**_ - These are additional rules specified by users or administrators

### Referential Integrity
Constraints are in place to enforce referential integrity.

There are several reactions to operations which violate referential integrity constraints:
- _**Restrict**_ - Do not perform operation
- _**Cascade**_ - Let changes flow through to keep integrity
- _**Nullify**_ - Make violating values null to keep integrity
- _**Triggers**_ - Specific user-defined action to keep integrity

