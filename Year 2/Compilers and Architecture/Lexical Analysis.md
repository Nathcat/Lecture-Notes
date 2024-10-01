How do we go from a string to an _Abstract Syntax Tree_?

To do this we start by _**Lexing**_ our source code. Which is turning our code into a series of tokens, which are primitives of our language.

## Regular expressions
The point of the lexical phases is to create a description of the lexical structure of the language, for this we make use or _**Regular Expressions**_.

This is done by a _**Lexer**_, which is an algorithm which can determine the token class of each lexical unit. Such an algorithm could be implemented with a _**Finite State Automata**_.

A _Regular expression_ is a way of precisely describing the set of _lexemes_ (strings) associated with each token.

Let us define the following in the context of _Regular expressions_:

- An _**Alphabet**_ is a usually finite set of characters.
- A _**String**_, or perhaps _**Word**_, over an alphabet $A$ is a finite sequence of elements from $A$.
- A _**Language**_ over an alphabet $A$ is a set of strings over $A$.

A _Finite_ language can be given by listing all the strings it defines, whereas this is not possible for an _Infinite_ language, an example of such a language is the set of all non-negative integers, as a language over $\{0,\ldots,9\}$.

Regular expressions are a mechanism to specify both finite and infinite languages. We use this and other ways of describing context free languages for program compilers since the set of all syntactically valid programs is infinite.


Let $A$ be an alphabet. There are 7 kinds of basic regular expressions over $A$:
- $\emptyset$ The empty set
- $\epsilon$ The empty string
- $c$, for any $c\in A$, i.e. any single 'letter'
- $R | S$, for any regular expression $R$ and $S$ over $A$.
- $RS$, for any regular expression $R$ and $S$ over $A$.
- $R^*$ for any regular expression $R$ over $A$.
- $(R)$ for any regular expression $R$ over $A$.

$\emptyset$ is a regular expression denoting the empty set, so we may write $\textrm{lang}(\emptyset)=\{\}=\emptyset$.

$\epsilon$ is a regular expression, we may write it as $\textrm{lang}(\epsilon)=\{\textrm{""}\}$.

_**Note that these are different**_.

$\textrm{lang}(c)=\{\textrm{"c"}\}$, this is a _singleton_ set.

If $R$ and $S$ are regular expressions over $A$, then $R | S$ is also a regular expression over $A$, denoting the langauge
$$
\textrm{lang}(R|S)=\textrm{lang}(R)\cup\textrm{lang}(S)
$$

We might also define $RS$, to say $R$ concatenated with $S$:
$$
\textrm{lang}(RS)=\{rs|r\in\textrm{lang}(R),s\in\textrm{lang}(S)\}
$$

These do not immediately define infinite languages.

The language $\textrm{lang}(R^*)$ does define an infinite language:
$$\displaystyle
\textrm{lang}(R^*)=\bigcup\limits_{n\geq0}\textrm{lang}(n\textrm{ times }R)
$$This defines an infinite number of concatenations of $R$, including $\epsilon$.

Brackets are used to manipulate the order of operations in defining the language described by a regular expression. For example:
$$(\textrm{'0'}|\textrm{'1'})^*$$
Effectively defines an infinite set of binary numbers, whereas
$$\textrm{'0'}|\textrm{'1'}^*$$ Defines:
$$
\{\textrm{'0'},\epsilon,\textrm{'1'},\textrm{'11'},\ldots\}
$$
### Abbreviations in regular expressions
- $R^+$ stands for $RR^*$, i.e. one or more of $R$.
- $R?$ stands for $R|\epsilon$, i.e. possible an $R$.
- If there is a well understood order on the alphabet, we may specify ranges, for example:
	- $[a-z]$
	- $[0-9]$.
	- Ranges may also be concatenated, for instance $[a-zA-Z]$ instead of $[a-z]|[A-Z]$.