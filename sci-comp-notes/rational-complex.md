Chapter XX: Rational and Complex Numbers

Rational Numbers
---------

Recall that a rational number in mathematics is a number which is an integer divided by another integer (that is not zero).  Alternatively, if we consider the set of all solutions of the equation \\(ax=b\\) where \\(a \neq 0\\), then the result is the set of all rational numbers.  

In julia, it is similarly a ratio of integers (as long as the bottom is not zero), but since integers have a defined minimum and maximum value, the set of rational numbers is not identical to the mathematical definition.  

To create a rational number in julia we use the `//` operator.  For example `1//2` is one-half. And if you do a `typeof(ans)` you see `Rational{Int64}` saying that the result is a rational with each element an integer.  

We can add, subtract, multiply and divide rationals and get a rational.  For example,

```
x=1//2
y=2//3
```

try `x+y,x-y,x*y,x/y` and see that they result in expected numbers.  

Rational numbers are also automatically reduced in julia.  Try `3//12`, `-2//-8`, `7//-1`

Complex Numbers
-----------

Last week we briefly saw complex numbers. A site called purplemath.com has a [nice overview of complex numbers](http://www.purplemath.com/modules/complex.htm).  Here's a few example using Julia to do complex arithmetic.

Entering the number \\(a+bi\\) is put in with `a+b*im`.  For example `-2+im` or `0.5*1.5im`.

Operations with complex numbers:
```
(-2+im)^2
(-2+im)*(7+4im)
(-2+im)/(7+4im)
```

Other operations/mathematical functions work as well
```
sqrt(-1+0im)
sin(-2+im)
e^(-5.42+32.3im)=exp(-5.42+32.3im)
```

however, these may not make sense (unless you seen some complex analysis).


Complex Solution to the quadratic equation
---------

Recall that we used the quadratic formula to solve \\(ax^{2}+bx+c=0\\)

```
 function qSol(a,b,c)
       d=sqrt(b^2-4*a*c)
       return (-b+d)/(2*a),(-b-d)/(2*a)
 end
```

which works great for quadratic equations with real solutions.  The solution to \\(x^{2}-x-110\\) is 11 and -10.  However, if there is no real solution, like \\(x^{2}+4=0\\), then the function gives:

```
qSol(1,0,4)
ERROR: DomainError
sqrt will only return a complex result if called with a complex argument.
try sqrt(complex(x))
in sqrt at math.jl:131
in anonymous at none:2
```

But if we put in complex coefficients:
```
qSol(1+0im,0im,4+0im)
```

we get
```
(0.0 + 2.0im,0.0 - 2.0im)
```

for the solution.  


Newton's Method with complex numbers
-----

Newton's method works great with complex numbers as well.  In short, we just need to start it with a complex number and it will iterate the same way.  

(Note: the interpretation of using the tangent line to estimate the root isn't quite the same as with real numbers, but it still converges to a root.)


Let's use this to solve \\(x^{2}+5=0\\), which should have the solution \\(x=\pm i\sqrt{5}\\).  First, define
```
f(x)=x^2+5
```

and
```
df(x)=2x
```

and if we do `newton(f,df,1.0)` then the result stays in the real number and we get `-11.659358758975838` but this isn't the solution.

However, if we type `newton(f,df,1im)`, the the solution 0.0 + 2.236067977499978im.  

###Exercise

The equation \\(x^{3}-1=0\\) has one real root and two complex ones.  Use newton's method to find all of them.  
