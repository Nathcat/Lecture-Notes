# Definitions
An _**Event**_ has a set of outcomes, the probability of any one of these outcomes occurring is defined by a probability function:
$$\displaystyle\begin{array}{l}
\mathbb{P}:\textrm{events}\rightarrow[0,1] \\
0\leq\mathbb{P}(x)\leq1
\end{array}$$
Probability is inherently subjective, it is based on one's knowledge of the world, so it is not _correct probability_, it is the _best probability given my knowledge of the world_.

A _**Probability Space**_ contains three things:
$$
(\Omega, \mathcal{F}, \mathbb{P})
$$Our sample space $\Omega$ (the set containing all the possible outcomes), our event space $\mathcal{F}$ (the set containing all possible events / combinations of outcomes), and our probability function $\mathbb{P}$, which assigns a probability to every single event.

Remember our types of events:
- _**Mutually exclusive**_ - Should one event occur, the other cannot occur. $\mathbb{P}(X\cap Y)=0$.
- _**Independent**_ - The outcome of one event does not affect the probability that the other will occur

Note that by definition, two events which are independent _cannot_ be mutually exclusive, and vice versa.

A _**Random variable**_ is a quantitative question about an experiment, for example, if our outcomes define the number of unfilled seats in a lecture theatre, our random variable might be the number of unfilled seats. Our random variable taking a particular value qualifies as an event, because there is a defined probability that a random variable will take that particular value.
$$
\mathbb{P}\left[\{\omega\in\Omega:X(\omega)=4\}\right]
$$
Note that $\omega$ is a particular outcome from the sample space $\Omega$.

The _**Support of a Random Variable**_ is the set of _plausible_ values that a random variable can take. i.e. the smallest set $S$ of outcomes such that $\mathbb{P}[\{\omega\in\Omega:X(\omega)\in S\}]=1$.

Note that a support may be finite or infinite.

A _**Probability Mass Function**_ of a _discrete_ random variable maps the outcome of a random variable to the probability of that outcome occurring:
$$f_X:\mathbb{R}\rightarrow[0,1]$$
The probability of a continuous random function taking any particular value cannot be determined (remember normal distributions, the probability of any particular outcome is $0$).

There are certain types of random variables which appear frequently.

_**Bernoulli Random Variables**_ are binary questions (e.g. yes / no).
$$X\sim Bern(p)$$
$X$ is distributed as a Bernoulli random variable with probability $p$.
$$\displaystyle
f_Y=\left\{
\begin{array}{ll}
p&\textrm{if }x=1 \\
1-p&\textrm{if }x=0
\end{array}\right.$$
With a _**Uniform random variables**_, the probability of every outcome in the support $S$ is equal:
$$X\sim U(S)$$
$X$ is uniformly distributed on the set $S$.

For _**continuous random variables**_, we can use a _**probability density function**_, note that $\mathbb{P}[X=\textrm{anything}]=0$.

We should look for the probability that $X$ is _between_ values:
$$\mathbb{P}[a\leq X\leq b]=\ldots$$
$$\mathbb{P}[x\in(a,b)]=\int_a^bf_X(x)dx$$
