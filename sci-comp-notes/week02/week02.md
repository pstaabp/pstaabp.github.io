


Week 2 Notes
=============

These are the notes for week 2 of Math 3001.  [Return to all notes](../index.html)


Rounding Errors and the Quadratic Formula
------------

The following example shows how a well-know formula (the quadratic formula) can lead to incorrect results due to rounding errors.  

Remember if you solve \\(a{x}^{2}+bx+c=0\\), the the quadratic formula finds the solution:
\\[ x=\frac{-b \pm \sqrt{{b}^{2}-4ac}} {2a}\\]

Next, let's consider the quadratic equation \\(12.242{x}^{2}+42.382x+0.0012=0\\)

We are going to solve this using the quadratic equation in julia

1. Write a function for the quadratic formula. 

	```
	 qSol = function(a,b,c)
	       d=sqrt(b^2-4*a*c)
	       return (-b+d)/(2*a),(-b-d)/(2*a)
	       end
	```

	(exercise)

	Use the quadratic formula to solve \\({x}^{2}-x-110=0\\).


2. Solve the equation above using 64-bit floating point.  

	```
	x1a,x1b = qSol(12.242,42.382,0.0012)
	```
	leads to
	```
	(-2.831413841486606e-5,-3.461987696317393)
	```

3. Find the solution if the coefficients are 16-bit floating points.

	```
	x2a,x2b = qSol(float16(12.242),float16(42.382),float16(0.0012))
	```
	leads to 
	```
	(0.0001448952f0,-3.4615362f0)
	```

4. Assume that the 64-bit answer is correct.  Find the absolute and relative errors for the two solutions. 

	The absolute errors are 
	```
	abs(x1a-x2a) = 0.00017320933367737267
	abs(x1b-x2b) = 0.0004515272652687585
	```

	and the relative errors are:
	```
	abs(x1a-x2a)/abs(x1a) = 6.117414951479887
	abs(x1b-x2b)/abs(x1b) = 0.00013044129635438729
	```

	This shows that the first answer is far off in relative terms.  



Be skeptical of numerical answers
--------------

Even though the example above was manufactured to produce bad results, you never know if a numerical solution is accurate or not.  


Can we ever be confident of answers?
--------------

It's crucial to have a good sense of the problem (whether it be mathematical or a scientific question).  Additionally, testing is an important part of the solution process.  


Let's reexamine the quadratic formula.  The problem arose due to roundoff.  


Let's change the quadratic formula
--------------

I'm going to assume that \\(b>0\\) and let \\(d=\sqrt{b^{2}-4ac}\\). The roundoff occurs when the value of \\(b\\) and \\(d\\) are close to each other.  In the case above, b=42.382 and \\(d=\sqrt{b^{2}-4ac}=42.38130675663505\\).  Notice that the other root (solution) was correct to many decimal places. 

To change the quadratic formula we are going to exchange the addition with a subtraction (however we will not have the catastrophic subtraction error we saw above).  "How can you do that you ask?" Here we go...

Start with the quadratic formula (only the + root):
\\[ x=\frac{-b + \sqrt{{b}^{2}-4ac}} {2a}\\] 

Multiply by a convenient form of 1
\\[ x=\frac{-b + \sqrt{{b}^{2}-4ac}} {2a} \cdot \frac{-b-\sqrt{b^{2}-4ac}}{-b-\sqrt{b^{2}-4ac}}\\] 


\\[ x = \frac{-b^{2}+b^{2}-4ac}{2a(-b-\sqrt{b^{2}-4ac})}\\] 


\\[ x = \frac{2c}{b+\sqrt{b^{2}-4ac}}\\] 

and there is a similar solution if the - root is taken above.  So an alternative quadratic formula is: 

```
qSol2 = function(a,b,c)
  d=sqrt(b^2-4*a*c)
  return 2*c/(b+d),(2*c)/(b-d)
end
```

(exercise)

* Use the new quadratic formula (`qSol2`) to find the roots of \\(x^{2}-x-110=0\\).  Do you get the same results as above?

*  Use the new quadratic formula to solve \\(12.242{x}^{2}+42.382x+0.0012=0\\).  Find the absolute an relative errors.  What results do you find?


Newton's Method
------------

Solving an equation is a very important part of mathematics and other scientific fields.  However, finding general solutions to equations is not very easy.  Consider a cubic equation like \\( cubic \\).    In the spirit of (but not very simple) the quadratic formula, there is a [cubic formula](https://en.wikipedia.org/wiki/Cubic_function#Roots_of_a_cubic_function).  Much of the wikipedia page spends time solving the cubic with all possibilities.  In short, it's not very easy. 

In lieu of using such a formula, a more robust approach is to solve it numerically.  Let's consider


\\[15{x}^{3}-143{x}^2+226x+280=0\\]

This cubic actually factors, but finding those factors is quite difficult to do in general.  We then look at using [Newton's method](https://en.wikipedia.org/wiki/Newton%27s_method) to solve this.

Newton's method starts with a "guess" at the root and then refines it.  Let \\(x_0\\) be the guess, then 
\\[x_1 = x_0 - \frac{f(x_0)}{f'(x_0)}\\]

Let's look at this in Julia for the function above.  

```
f(x)=15x^3-143x^2+226x+280
```

and we need the derivaitve so

```
df(x)=45x^2-286x+226
```

Let's say that x0=0 and find x1 using Newton's method:

```
x0=0
x1 = x0-f(x0)/df(x0)
```

returns `-1.238938053097345`.  If we then let x0=x1 and repeat we get a sequence that hopefully gets close to a root (solution). After a few iterations, you should get `-0.8` 

(exercise)

* Try to find the other two solutions to this function.  (Hint: try different values for x0)

* Write a function using the arguemnts f,df and x0 and returns the root.


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




