Appendix B: Numbers on a Digital Computer
======

Scientific Notation
------

Recall that any number written in decimal form with only a finite number of digits can be written in scientific notation that is in the form:

$$ a \times 10^{b} $$


where $1<|a|<10$ and $b$ is an integer.  For example $4003.23$ can be written as $4.00323 \times 10^{3}$, so $a=4.00323$ and $b=3$.

In this form the number $a$is often called the **significand** or **mantissa** and the number $b$ is **exponent**.  This example has the base 10, however other bases are common (generally base 2).   

One major advantage to using numbers in this form is the simple multiplication and division.  Consider multiplying $x=3.4 \times 10^{2}$ and $y=-4.7 \times 10^{-3}$.  Using properties of exponentials we get
$$	xy = (3.4)(-4.7) \times 10^{2-3} = -15.98 \times 10^{-1}$$
and typically we would like to put this back into scientific notation by shifting the exponent so $xy=-1.598 \times 10^{0}$.

Division can be done in a similar manner and perhaps surprisingly, addition and subtraction are more difficult due to the fact that the exponents of the two numbers need to be equal before adding and subtracting.

Binary Representation of integers
-------

Since ultimately all numbers are stored as binary, it may be helpful to know how that number is stored.  Maple will convert a number to a different base.  For example convert(13,binary) returns `1101`.  Recall that

$$ 1 \times 2^{3} + 1 \times 2^{2} + 0 \times 2^{1} + 1 \times 2^{0} = 13$$



Floating Point Numbers of a given size
-----

The reason for using floating point numbers in calculations is twofold.  First, there is a finite size of storage for a number and secondly, routines for performing operations on floating-point numbers are fast and usually encoded on a computer chip.  

Consider a floating point of a given size, say 64 bits generally called a *double precision floating point number*.  The first bit is generally used for the sign, the next 11 are the exponent and the final 52 bits store the mantissa.  A floating point number has two limitations and that is the precision (how many digits that can be stored) and the magnitude (the largest number).  Double precision numbers are store in binary and converted to decimal with the form:
$$
(-1)^{s} 2^{c-1023}(1+f)
$$
where $s$ is the sign $c$ is the exponent and $f$ stores the mantissa.  For example, consider the following number:
$$
0\;10000000101\;0111011010000000000000000000000000000000000000000000
$$
where spaces separate out $s$, $c$ and $f$.  Converting $c$ to decimal:
$$
c = 1 \cdot 2^{10} + 0 \cdot 2^{9} + \cdots + 1 \cdot 2^{2} + 0 \cdot 2^{1} + 1 \cdot 2^{0} = 1029
$$
The mantissa is calculated in the following way

$$
f = 0 \cdot \biggl(\frac{1}{2}\biggr)^{1} + 1 \cdot \biggl(\frac{1}{2}\biggr)^{2} + 1 \cdot \biggl(\frac{1}{2}\biggr)^{3} + 1 \cdot \biggl(\frac{1}{2}\biggr)^{4} + 0 \cdot \biggl(\frac{1}{2}\biggr)^{5} + 1 \cdot \biggl(\frac{1}{2}\biggr)^{6}  \\
\qquad + 1 \cdot \biggl(\frac{1}{2}\biggr)^{7} + 0 \cdot \biggl(\frac{1}{2}\biggr)^{8} + 1 \cdot \biggl(\frac{1}{2}\biggr)^{9} = \frac{237}{512}
$$
and thus the floating point number is:
$$
(-1)^{0} 2^{1029-1023} \biggl(1+\frac{237}{512}\biggr) = 93.625
$$

The double precision number system falls into a class of number systems that we can commonly call floating-point number systems.

Maple doesn't use the standard double-precision system as stated above, but still stores everything in binary.  To determine its internal store, if we type
```
convert(93.625,binary)
```

Maple returns $1.011101101 \times 10^{6}$, which is a strange  way to return the result.  It should either return $1.011101101 \times 2^{6}$ or $101110.1101$.  
