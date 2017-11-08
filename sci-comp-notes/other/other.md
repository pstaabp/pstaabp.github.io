

Packages in Julia
-------

As with most languages, you can add extra functionality to Julia via a package.  [A list of all of the packages](http://pkg.julialang.org) shows over 200 currently (Sept 2014).  To add a package, generally it's done with

```
Pkg.add(name)
```

where name is a string. If there are other packages that are dependencies, Julia takes care of those also.  Type

```
Pkg.update()
```

to update all packages, which is a good idea to do often as things are changing quickly in the Julia world. And to list all of the packages you have installed, type

```
Pkg.status()
```


For example, if you want to load in the Calculus package, type

```
Pkg.add("Calculus")
```

And now you will have some Calculus functionality. For example,

```
using Calculus
f(x)=x^2
f'(1)
```

returns close to 2.  (It doesn't calculate derivatives exactly.)  Note: the first line loads in the package.  (similar to the with statement in Maple).

Plots in Julia
--------

There are a number of plotting packages in Julia.  One of the simpler ones in called Winston and one of the more robust ones is called PyPlot.  We'll first look at some examples in Winston.  First, make sure the packages is added.

```
Pkg.add("Winston")
```

(this might take a while).  Then create two 1D arrays (vectors) for x and y and plot.

```
x=[-2:0.1:2]
y=map(a->a^2,x)
plot(x,y)
```

### Exercise

Try plotting some other functions, like \\(\sin x\\), \\(e^{x}\\), \\(\ln x\\) and play with the plotting domain (x values of the plot).


For additional documentation on Winston, you can find a link from the [Julia packages website](http://pkg.julialang.org)



Arrays
------

A fundamental data type of any language is that of an array or a rectangular grid of numbers (or mathematically a matrix). These are defined with [ ] and more information can be found in [Julia's manual on arrays](http://docs.julialang.org/en/release-0.3/manual/arrays/) Right now, we will just look at arrays to be entered by hand and using the : syntax.  
```
[1 2 3]
```
is an array with 1 row and 3 columns  (or a 1 by 3 array or mathematically a row vector).  An array with 3 rows and 1 column is
```
[1;2;3]
```

Creating Arrays
---------

There are many, many ways to create arrays in Julia depending on what you need to do.  Here's a few examples:
```
[1:10]
```
creates a 10 by 1 array with the numbers 1 to 10.
```
[1:2:9]
```
creates a 5 by 1 array with the odds less than 10.
```
[i^2 for i=1:10]
```
creates a 10 by 1 array with the squares up to 100.  




(Exercises)

* create an array of all even numbers up to 30
* create the following [4,9,14,19,24,....,99] without typing all of the numbers in


Note: we will see a lot more about arrays upcoming, but let's not get too overwhelmed.



Functions
----------

Functions play a huge role in both mathematics and programming.  Julia has a very robust function as we will see or you can investigate in [Julia's Manual on functions](http://docs.julialang.org/en/release-0.3/manual/functions/) .  To define a function use the `function` keyword as in the example:
```
function f(x,y)
  x+y
end
```

or the compact notation of

```
g(x,y)=x*y
```




Anonymous Functions
-----------

Another feature that is common to more modern languages is that of an anonymous function.  Although as the name suggests, these functions are not named, however, they are typically passed as arguments to other functions.  For example,
```
x->x^2
```
returns `anonymous function` and since it doesn't have a name it hard to do anything with it (although you can name it and then use it like a standard function).  Why is it useful then? If we take an array, do something to each element and get a new array from this.  (This is called a map)

For example, if we have the array (a list of numbers that we will see in depth later)
```
A=[i for i=1:10]
```

And we want to return an array in which every element is shifted by 1 number, we can do that with
```
map(x->x+1,A)
```
or if we want to return if each number is even (true) or odd (false):
```
map(isOdd,A)
```

where `isOdd` is the function created above.

Exercise
----



Packages in Julia
-------

As with most languages, you can add extra functionality to Julia via a package.  [A list of all of the packages](http://pkg.julialang.org) shows over 200 currently (Sept 2014).  To add a package, generally it's done with

```
Pkg.add(name)
```

where name is a string. If there are other packages that are dependencies, Julia takes care of those also.  Type

```
Pkg.update()
```

to update all packages, which is a good idea to do often as things are changing quickly in the Julia world. And to list all of the packages you have installed, type

```
Pkg.status()
```


For example, if you want to load in the Calculus package, type

```
Pkg.add("Calculus")
```

And now you will have some Calculus functionality. For example,

```
using Calculus
f(x)=x^2
f'(1)
```

returns close to 2.  (It doesn't calculate derivatives exactly.)  Note: the first line loads in the package.  (similar to the with statement in Maple).

Plots in Julia
--------

There are a number of plotting packages in Julia.  One of the simpler ones in called Winston and one of the more robust ones is called PyPlot.  We'll first look at some examples in Winston.  First, make sure the packages is added.

```
Pkg.add("Winston")
```

(this might take a while).  Then create two 1D arrays (vectors) for x and y and plot.

```
x=[-2:0.1:2]
y=map(a->a^2,x)
plot(x,y)
```

### Exercise

Try plotting some other functions, like \\(\sin x\\), \\(e^{x}\\), \\(\ln x\\) and play with the plotting domain (x values of the plot).


For additional documentation on Winston, you can find a link from the [Julia packages website](http://pkg.julialang.org)



* Produce a array of length 10 using map with the pattern [1,0,-1,0,1,0,-1,...].  Hint: you can generate a pattern using the sine or cosine of some numbers.  
Reducing and Folding
------------


Another wonderful example is that of reducing an array or folding it. This means that we want a single number that is found by performing some operation repeatedly.  More information about doing operations like this is found in the [Julia Manual on Iterable Collections](http://docs.julialang.org/en/release-0.3/stdlib/base/?highlight=reduce#iterable-collections).

A simple example of reducing a array is that of summing all of the elements of the array.  The function `reduce(op,vo,itr)` is what we will use, where `op` is the anonymous function, `vo` is the initial value and `itr` is the array.  If we use the array A given above, then
```
reduce(*,1,A)
```

or

```
reduce((x,y)->x*y,1,A)
```

returns 3628800, the product of the elements.  Without such functions like map and reduce, one usually needs to write for loops. For example:

```
p=1
for i=1:10
  p*=i;
end
p
```

and the answer is the same.  Since the product of numbers is important enough, julia has it built-in.  That is, if you type `prod(A)` you get the same result.

We will explore some differences between these different methods in the homework.

(Exercise)

Write a function that sums the reciprocals of the first 100 counting numbers using `reduce`.  



Newton's Method to find all the roots
------

Newton's method generally finds a single root based on an input (though this is not guaranteed).  What if we want to find all of the roots?   We could generate an array of initial points and apply Newton's method to every point. Here's one approach.  

Note: assume that we have a function called `newton` that given a function, its derivative and an initial point, returns the root.  (I will provide one soon).

Let's produce an array of initial values:

```
x0=[-10:1:10]
```

To find the point with that initial point, we can use the `map` function
```
x=map(a->newton(f,df,a),x0)
```

will return an array of the root that the function went to.  Now to get a more visual sense of where the points go:

```
plot(x0,x)
```

shows for each x value (the initial point) which root the function goes to.  
