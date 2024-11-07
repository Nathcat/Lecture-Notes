A Context Free Grammar (CFG) is a [[Context Free Grammars#Formal Grammar|Formal Grammar]] containing _production rules_ which may be applied to some non-terminal symbol, regardless of its context.
## Formal Grammar
A formal grammar is effectively a set of _production rules_ which define how a string in the formal language they define should be formed. Therefore one may derive a _Formal Language_ from a _Formal Grammar_ by deriving the set of strings defined by these production rules.

A production rule takes the form:
$$A\rightarrow\alpha$$
Where $A$ is some non-terminal character, and $\alpha$ is a string of string of either terminal or non-terminal characters. $\alpha$ can also be empty $\epsilon$.

## Formal definition
A CFG $G$ is defined by a 4-tuple
$$G=(V,\Sigma,R,S)$$
1. $V$ is a finite set containing non-terminal characters $v\in V$. Each variable is intended to represent a different type of phrase or clause in a sentence, or syntactic category.
2. $\Sigma$ is a finite set of _terminals_, disjoint from $V$, which make up the actual content of the sentence. So while the members of $V$ define sections of the sentence, the members of $\Sigma$ define the actual characters which will make up this content.
3. $R$ is a finite relation in $V\times(V\cup\Sigma)^*$. The members of $R$ are the rules of production of the grammar (may also be symbolised as $P$).
4. $S$ is the start variable or symbol which is used to represent the whole sentence. $S\in V$ must be true.

### Production rule notation
A production rule $\in R$ is formalized as a pair $(\alpha, \beta)\in R$ where $\alpha\in V$ is a non-terminal, and $\beta\in(V\cup\Sigma)^*$ is a _string_ of variables or terminals. They are usually written using an arrow operator like so: $\alpha\rightarrow\beta$.

$\beta$ may be the _empty string_, in which case it should be written that $\alpha\rightarrow\epsilon$, which is called an $\epsilon$-production.

The rules
$$\displaystyle\begin{align}
\alpha\rightarrow\beta_1 \\
\alpha\rightarrow\beta_2
\end{align}$$
Can also be written as
$$\displaystyle\begin{align}
\alpha\rightarrow\beta_1|\beta_2
\end{align}$$

#### Rule application
Suppose we have two strings, $u,v\in(V\cup\Sigma)^*$, we say that $u$ directly yields $v$, written as $u\rightarrow v$ if $\exists(\alpha,\beta)\in R$ where $\alpha\in V$ and $u_1,u_2\in(V\cup\Sigma)^*$ such that $u=u_1\alpha u_2$ and $v=u_1\beta u_2$. Hence $v$ is the result of applying the rule $(\alpha,\beta)$ to $u$.
#### Repetitive rule application
With the same strings $u,v$, we say that $u$ yields $v$, or $v$ is derived from $u$, if there is a $k\in\mathbb{Z}^+$ and strings $u_1,\ldots u_k\in(V\cup\Sigma)^*$ such that $u=u_1\rightarrow u_2\rightarrow\ldots\rightarrow u_k=v$. This relation is denoted as $u\xrightarrow{*}v$. or sometimes as $u\rightarrow\rightarrow v$.

If $k\geq2$, $u\xrightarrow{+}v$ holds, i.e. these relations allow a string to yield itself.
## Context Free Language
The language of a grammar $G=(V,\Sigma,R,S)$ is the set
$$L(G)=\{w\in\Sigma^*:S\xrightarrow{*}w\}$$

[CFG Wiki](https://en.wikipedia.org/wiki/Context-free_grammar)