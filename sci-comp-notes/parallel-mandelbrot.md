Chapter 8: More on Functions
========

[Return to all notes](index.html)

This chapter covers a bit more on Functions...

We know how to define an argument with a type, but what if more information is needed for an argument. Recall our factorial function
```
function fact(n::Integer)
  if n==0
    return 1
  end
  n*fact(n-1)
end
```

but what happens if you put in a negative number?  Try it.

We can prevent it with the following:
```
function fact(n::Integer)
    n>=0 || throw(ArgumentError("The argument must be a nonnegative integer."))
  if n==0
    return 1
  end
  n*fact(n-1)
end
```

The first line of this evaluates `n>=0` if that is false, the second after the || is evaluated and an error is thrown.  

Optional arguments
------

Let's return to Newton's method, which we wrote before as

```
function newton(f::Function, df::Function,x0::Number)
    x1=x0
    x2=x0+1
    steps = 0
    while abs(x2-x1)>1e-6 && steps<100
        x1=x2
        x2=x1-f(x1)/df(x1)
        println(x2)
        steps += 1
    end
    x2
end
```

Notice that we hard-coded the stopping criteria and the max number of steps. Let's adapt this function to include the following:

1. Make the stopping condition and max steps as optional parameters.  
2. Check to make sure that they are valid.  
3. If the number of steps exceeds the maximum number of steps, then throw an `ErrorException` and a reasonable message.


Variable Number of arguments
-----

Recall that the geometric mean of a set of numbers \\(x_1,x_2, \ldots, x_n \\) is given by

\\[ \sqrt[n]{x_1x_2 \cdots x_n}\\]

It would be great to write a `geom_mean` function which computed the geometric mean for any number of elements.  
It would be unfortunate if we have to write different functions for different number of arguments.   We can write a variable number of arguments with a ... trailing the last argument.  The following is a generalized version of the geometric mean:

```
function geom_mean(x::Number...)
    prod(x)^(length(n))
end
```

and this allows the following:

```
geom_mean(1,2)
```

as well as
```
geom_mean(1,2,3,4)
```

See [The Julia documentation on Variable Arguments](http://docs.julialang.org/en/release-0.5/manual/functions/#varargs-functions) for more information on variable arguments.  

Multiple Dispatch
------

Generally each function that you write (or is built-in to Julia) has a signature which is the number and types of arguments.  For example, the function `newton` above has three arguments.  The first two are functions, and the second is a number.

Julia allows functions of the same name with different signatures.  The execution of this is called *multiple dispatch*.   The classic example is the `+` function.  If we only consider those with 2 arguments, then + can take 2 integers an integer and a float, two complex, a float and a complex, etc.  Each one of those functions have the same name with different signatures.  

To view all of the methods, use the `methods` command.  For example, typing `methods(+)` lists 163 methods and the signature of each.  

Example of Multiple dispatch
-----

Let's consider a function called `the_max` which return the maximum number of a whole bunch of possible arguments.  Let's start going through them:

* 2 numbers

    ```
    function the_max(x::Number,y::Number)

    end
    ```

* 3 numbers
    ```
    function the_max(x::Number,y::Number,z::Number)

    end
    ```

* variable number of numbers
    ```
    function the_max(x::Number...)

    end
    ```

* a 1-D array of numbers
    ```
    function the_max(arr::Array{Number,1})

    end
    ```

* a UnitRange
    ```
    function the_max(r::FloatRange)

    end
    ```
* A FloatRange

    ```
    function the_max(r::FloatRange)

    end
    ```



After we put these all in, type `methods(the_max)` to see the 5 different signatures of the function.  

###

Let's say that we wish to create a function that does basically the same thing for different types of arguments.  For example,  let's return to the example in which you calculate the mean of a set of numbers.  

It is probably of interest to return the same type as the input.  For example, if you enter Float32's then return Float32s.  From what we've seen above, it would be logical to define a different method with a different argument signature for each.  This, however, is a lot of work and unnecessary with what Julia calls [Parametric Method](http://docs.julialang.org/en/release-0.5/manual/methods/#parametric-methods).  

Consider finding the mean:

```
function the_mean(x::Number...)
    sum(x)/length(x)
end
```

which will compute the mean of any number of any subtype of number.


```
type Polynomial{T}
  coeffs::Vector{T}
end
```

```
poly=Polynomial([1,2,3])
```
