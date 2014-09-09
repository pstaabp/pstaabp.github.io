


Week 2 Notes
=============

These are the notes for week 2 of Math 3001.

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




