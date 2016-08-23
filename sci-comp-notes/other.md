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


Finding the time of a function
----------------

Another important aspect of scientific computing is how long functions or programs take to run.  (When you run a program for hours on an expensive supercomputer, time is money).  Julia has some nice ways of running these.

Let's say we have a function that takes a little bit of time to run like:
```
function function_to_time()
  timedwait(()->false,5*rand())
end
```
which can take up to 5 seconds to run.

To determine the actual amount of time to run, try:
```
tic();function_to_time();toc()
```
and this will report the amount of time it runs.  

To test your code for timing information, try inserting some other code in the function called `function_to_time`.  

(Exercise)

Type in this code and run it a few times.  What results do you get?
