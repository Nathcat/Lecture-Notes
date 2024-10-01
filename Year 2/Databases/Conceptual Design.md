This module will contain one assessment in week 11, a single in-class assessment which will take place in a lab in week 11.

_**Database**_ - "A shared collection of logically related data."

A database might have many simultaneous users, and contains structured data, joined together by logical relationships.

Some of the key features of databases are:
- Provide persistent storage
- Sharing data between systems / users
- Reducing and controlling redundancy
- Avoiding inconsistencies in the data
- Enforcing integrity constraints
- Providing support for data transactions
- Restricting unauthorised access to the database and the data it contains
- Providing multiple interfaces for users to access and visualise data through
- Providing facilities for backup and recovery in the case that data is lost

All of these features are provided by a _Database Management System_ (_DBMS_).

## Database standard
The _American National Standards Institute_ or _ANSI_, along with _SPARC_ proposed a standard to which database should be designed which consisted of three levels.

- External Level - This level is tailored to the user. i.e. how the data is shown to users.
- Conceptual Level - What data is stored and what relationships are there between the data.
- Internal Level - This describes how the data is physically stored.

### Independence
- Logical Data Independence
	- Users / applications should be immune to changes in the logical structure of the database.

- Physical Data Independence
	- Users / applications should be immune to changes in the way that the data is physically stored.

This kind of independence in the levels of the standard are brought about by the layered approach.

## Database design
Before we can design and implement a database we must define a data model for it. This is where we define the type of data that will be stored and managed by the database.

A _DBMS_ comes with a data definition language which is generally low-level, so there is a need for a high-level language here.

A _Conceptual Design_ then, is the process of constructing a model independent of the physical considerations of the storage of the data within the database.

## Entity-Relationship Modelling
This is a top-down approach to _Conceptual Design_. It consists of identifying:

- Entities and Entity types - Objects / types of interest
- Relationships - Links between Entities
- Attributes - Properties of Entities / Relationships
- Constraints on Entities / Relationships / Attributes

### Entities
- Represents uniquely identifiable data objects
- Can be physical
- Can be abstract
- Belongs to an entity type, a group of entities with the same properties.
- More formally called and "Entity occurrence"

Represented as a simple rectangle with a type name within on an E/R diagram.

### Relationships
- Are relations between two or more entities
- The _Degree_ of a relationship is the number of entity types involved

For example, if we were to have two types _Staff_ and _Branch_, we might say that the _Branch Employs Staff_, the relationship here is _Employs_, and has a degree of 2, since two entity types are involved in it.

### Kinds of Attributes
- Simple
	- Has a domain from which it's values can be taken
	- May be _Single-valued_ or _Multiple-valued_
	- May be a _Key attribute_
	- Represented by a simple oval containing the attribute name
- Composite
	- Consists of multiple attributes, which might be _Simple_ of _Composite_
	- Represented by a _thick-lined_ oval, with other attributes branching off it
- Derived
	- A value which can be derived from one or several other attributes.
	- For example, Age might be derived from someone's Date of Birth.
	- Represented by a oval with a _dotted-line_

#### Key Attributes
- Consist of just one attribute
- Uniquely identify a person or object
- Can also consist of several attributes
	- For example, a house may be identified by a combination of it's house number and postcode
- If there are several options to choose from for a key attribute, always choose the smallest one

## Convention
- Cannot mix special attribute types
	- For example an attribute cannot be both _Composite_ and _Multiple-valued_
- Entity types must be named with a _noun_, and start with a _capital letter_
- Relationship types must be named using _verbs_, starting with a _capital letter_
- Attributes must be named using _lower case_, or potentially _camel case_