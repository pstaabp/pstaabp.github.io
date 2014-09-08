
Week 1 Notes
=============

These are the notes for week 1 of Math 3001.

Introduction to Scientific Computing
-------------

Scientific Computing is
* a field in which problem solving is done via writing programs (algorithms and code) to solve the problems. 
* Requires math or science knowledge to be effective.


Scientific Computing is not
* just writing code
* a substitute for math or science
* a magic bullet to solve any problem

Where is Scientific Computing Used
-------------
* making predictions (weather, stock market, traffic, etc.)
* by individuals testing ideas
* in production software 


Numeric Types
-------------

One of the first things that is important is a knowledge of how computers store numbers and other mathematical objects.  The following are links to wikipedia pages with further information:

* [wikipedia's page on integers](http://en.wikipedia.org/wiki/Integer_(computer_science\))
* [wikipedia's page on floating point numbers](http://en.wikipedia.org/wiki/Floating_point_numbers)


Julia's standard numbers and mathmatical objects
----------------

Julia has built-in number and other mathematical data types including those listed above in various sizes as well as rational numbers, matrices, and complex numbers.  The following is a 

* [julia doc for integers](http://docs.julialang.org/en/latest/manual/integers-and-floating-point-numbers/)
* [julia doc for floating point](http://docs.julialang.org/en/latest/manual/integers-and-floating-point-numbers/)
* [julia doc for rational numbers](http://docs.julialang.org/en/latest/manual/complex-and-rational-numbers/)
* [julia doc for complex numbers](http://docs.julialang.org/en/latest/manual/complex-and-rational-numbers/)
* [julila doc for arrays](http://docs.julialang.org/en/latest/manual/arrays/)


Rounding Errors and the Quadratic Formula
------------

The following example shows how a well-know formula (the quadratic formula) can lead to incorrect results due to rounding errors.  

Remember if you solve \\(a{x}^{2}+bx+c=0\\), the the quadratic formula finds the solution:
\\[ x=\frac{-b \pm \sqrt{{b}^{2}-4ac}} {2a}\\]

Use the quadratic formula to solve \\({x}^{2}-x-110=0\\).

Next, let's consider the quadratic equation \\(12.242{x}^{2}+42.382x+36.671=0\\)

We are going to solve this using the quadratic equation in julia

1. Write a function for the quadratic formula. 

	```
	 qSolution = function(a,b,c)
	       d=sqrt(b^2-4*a*c)
	       return (-b+d)/(2*a),(-b-d)/(2*a)
	       end
	```

2. Solve the equation above using 64-bit floating point.  

	```
	qSolution(12.242,42.382,36.671)
	```
	leads to
	```
	(-1.7013188808020496,-1.760697129653758)
	```

3. Find the solution if the coefficients are 16-bit floating points.

	```
	qSolution(float16(12.242),float16(42.382),float16(36.671))
	```
	leads to 
	```
	(-1.6900733f0,-1.771318f0)
	```

4. Assume that the 64-bit answer is correct.  Find the absolute and relative errors for the two solutions. 



Be skeptical of numerical answers
--------------

Even though the example above was manufactured to produce bad results, you never know if a numerical solution is accurate or not.  


Can we ever be confident of answers?
--------------

It's crucial to have a good sense of the problem (whether it be mathematical or a scientific question).  Additionally, testing is an important part of the solution process.  


Let's reexamine the quadratic formula.  The problem arose due to roundoff.  




<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>