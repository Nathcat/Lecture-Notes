# How to find the area under a curve
## Introduction
Finding the area under a curve is often treated as a daunting mathematical challenge, but using this method you can _approximate_ the area under any curve with ease.

Note that I said _approximate_, this method will give you a good estimation of the area under a curve, but we must go further if we want to accurately find the area, we will talk about this in a bit more detail later on.

Before we begin, this guide assumes that you know about the following mathematical concepts:
- Functions
- Graphs
- Graphing functions
## Step 1: Graph your function
Lets say we are given the following function
$$f(x)=x^2$$
and asked to find the area between $x=-2$ and $x=2$ and the y axis, you might write this as an inequality on $x$
$$-2\leq x\leq 2, y\leq f(x)$$
Lets graph this out
![[x2graph.png]]
*(Desmos Studio PBC, 2024)*

The area shaded red is the area we will be finding.

## Step 2: Break the curve down into regular shapes
We cannot just straight away find this area, because it is not a regular shape, if it was a regular shape, like a rectangle, or a trapezium, we could find its area lot easier.

One thing we could do is break down the curve into a series of trapeziums of width 1

![[trapeziums.png]]
*(Desmos Studio PBC, 2024)*

If we find the total area of each of the trapeziums, this would give us an estimate for the area underneath the curve!

Note that this would be an over estimate, as you can see that the area covered by the trapeziums overlaps the entire area under the graph.

## Step 3: Find the area of the trapeziums
The formula for finding the area of a trapezium is:

$$A=\frac{(a+b)h}{2}$$

![[Area of a trapezium.png]]
*(Area of trapeziums - KS3 maths - BBC bitesize)*

Using this formula, we can find the area of each of the trapeziums we laid out before!

The values of $a$ and $b$ can be found by evaluating $f(x_a)$ and $f(x_b)$, where $x_a$ and $x_b$ are the x ordinates at the left right sides of each trapezium. For example the first trapezium would have $x_a=-2$ and $x_b=-1$.
### First trapezium
$h$ will be the width of the trapezium, which in this case is $1$.
$a$ is the height of the left side, which is $4$.
$b$ is the height of the right side, which is $1$.
So we have
$$h=1, a=4, b=1$$
$$\therefore A_1=\frac{(4+1)1}{2}=\frac{5}{2}$$
### Second trapezium
We must again measure the left and right side, and the width of this trapezium.

$$h=1, a=1, b=0$$
$$\therefore A_2=\frac{(1+0)1}{2}=\frac{1}{2}$$
### Third trapezium
$$h=1, a=0, b=1$$
$$\therefore A_3=\frac{(0+1)1}{2}=\frac{1}{2}$$
### Fourth trapezium
$$h=1, a=1, b=4$$
$$\therefore A_4=\frac{(1+4)1}{2}=\frac{5}{2}$$
## Step 4: Sum the areas of the trapeziums
So we now have the areas of the four trapeziums, we must find the sum of all of them to get our estimate for the area under the curve.
$$\begin{array}{c}
A=A_1+A_2+A_3+A_4 \\
\rightarrow A=\frac{5}{2}+\frac{1}{2}+\frac{1}{2}+\frac{5}{2} \\
\rightarrow A=\frac{10}{2}+1 \\
\rightarrow A=5+1=6 \\
\therefore A=6
\end{array}$$
So we have our estimate, the area $A$ under the curve $f(x)=x^2$ between $-2\leq x\leq 2$ is $A\approx 6$.

## General formula
This method is reliant on the _Trapezoidal rule_, a method of _numerical integration_ (_Trapezoidal rule_ 2023).

In a general form it may be written as:

$$
A\approx\sum^{N}_{n=0}\frac{1}{2}\cdot (f(x_n)+f(x_{n+1})\cdot h
$$
Where $N$ is the number of trapezoids we split the curve into.

Note that $h=\frac{b-a}{N}$.

If we increase $N$, i.e. split the curve into more trapezoids, then we will increase the accuracy of our estimate, we can see this in our original example:

![[more accurate trapeziums.png]]
*(Desmos Studio PBC, 2024)*

Here I have doubled the number of trapezoids, such that $h=\frac{1}{2}$, and you can clearly see that the area covered by the trapezoids fits more closely to the curve $f(x)=x^2$, so it follows that the estimation of $A$ increases in accuracy as $N$ increases (here $N=8$, while originally $N=4$). We could assume then, that with an infinite number of trapezoids, we would get the exact value of $A$. But this is not possible to calculate directly since that would mean that $h=0$, in which case our formula would not work.

So we must write this using [limits](https://en.wikipedia.org/wiki/Limit_(mathematics)),
$$
A=\lim_{N\to\infty}\sum^N_{n=0}\frac{1}{2}\cdot (f(x_n)+f(x_{n+1})\cdot h
$$
At which point we are edging into the realm of [integral calculus](https://en.wikipedia.org/wiki/Integral). To write this fully correctly:
$$
\int_b^af(x)dx=\lim_{N\to\infty}\sum^N_{n=0}\frac{1}{2}\cdot (f(x_n)+f(x_{n+1})\cdot h
$$
(_Trapezoidal rule_ 2023)


# References
_Area of trapeziums - KS3 maths - BBC bitesize_ (no date) _BBC News_. Available at: https://www.bbc.co.uk/bitesize/topics/zrf3cdm/articles/z37vqhv (Accessed: 09 February 2024).

_Trapezoidal rule_ (2023) _Wikipedia_. Available at: https://en.wikipedia.org/wiki/Trapezoidal_rule (Accessed: 09 February 2024).

_Desmos Studio PBC_ (2024). Available at: https://www.desmos.com/ (Accessed: 09 February 2024)