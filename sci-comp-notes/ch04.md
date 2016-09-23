Chapter 4: Number theory
========

[Return to all notes](index.html)

Number theory is in general the study of the integers and prime numbers are one of the most important pieces of this.  We will look at some of the computational study of number theory throughout this chapter, however, in short, this chapter shows a lot of interesting examples and how they are coded.  Later we will spend some time investigating the efficiency of the code here.

Prime Numbers
-----

Recall that a prime number is a positive integer whose only factors are 1 and itself.  Most languages have built-in versions of testing for primes, we will write some other versions.

Let's first start with a method that returns all of the factors of a given integer:

```
function all_factors(n::Integer)
    factors = [1]
    for i=2:n-1
        if mod(n,i)==0
            push!(factors,i)
        end
    end
    push!(factors,n)
end
```

This function starts with an array (list) consisting of only the number 1.  It then checks all numbers between 1 and n to see if each is a factor.  If it finds a factor, add it to the list with the `push` function.  


Exercise
-----

* Type in the function above and test it on various positive integers

* Use the function above to write a function `is_prime` that returns true or false depending on if the input is prime.  Hint: recall the definition of prime.   

  The template for the function should be
  ```
  function is_prime(n::Integer)

  end
  ```



Finding Primes
--------

We'll now try to find a prime number.  Many languages have a function called `next_prime` that takes a number as an input and returns a prime number greater than that.  Here's a code fragment that may work:
```
function next_prime(n::Integer)
   i=n+1
   # check if i is prime and if not increment by 1
   # once you find a prime, return it
 end
```

Exercise
-----

* Finish the code above.
* Try finding the next prime number for some known numbers to see if it is working.
* Write a function that produces the first `n` prime numbers.


Perfect Numbers
-------

A **perfect number** is a number, `n` which has the sum of the factors (except itself) equal to `n`.  For example, 28 is a perfect number because the factors are 1,2,4,7,14,28.  The sum of the number \\(1+2+4+7+14=28\\).  A nice function would be to check if a number is perfect.  Here's a shell:

```
function is_perfect(n::Integer)
   # find the factors of n and check the sum
end
```

Exercise
----

* Fill in the `is_perfect` function with working code and test it on some values.  Google perfect number for other examples.
* Write a `next_perfect` function which returns the next perfect number larger than the input.
* Find the first 3 ten perfect numbers.


Happy Numbers
-----


Here&#8217;s another fun example.  A number $n$ is called *happy* by the following
1. Take the digits of $n$ and square each one.
2. Sum the squares.  
3. if the sum is 1, then the number is happy, if not repeat these steps.

Note: it&#8217;s also helpful that if this process results in the number 4, then you can never result in a sequence that reaches 1.  You can call these number *unhappy*.  

For example, 13 is a happy number because $1^2+3^2=10$ and $1^2+0^2=1$, so the result ends in 1. The number 19 is also happy because $1^2+9^2=1+81=82$, then $8^2+2^2=64+4=68$, then $6^2+8^2=36+64=100$, then $1^2+0^2+0^2=1$.  

The number $4$ isn&#8217;t happy because $4^2=16$, then $1^2+6^2=1+36=37$, then $3^2+7^2=9+49=58$, then $5^2+8^2=25+64=89$, then $8^2+9^2=64+81=145$, then $1^2+4^2+5^2=1+16+25=42$, then $4^2+2^2=16+4=20$, then $2^2+0^2=4$ and since we have returned to 4, this will continue cycling, so we stop and say 4 is unhappy.  (It has been proven that any unhappy number will eventually hit this cycle.)

To write this in julia, first, it is helpful to have a procedure that splits any positive integer into its digits.  Here&#8217;s such a procedure:

```
function split_digits(n::Integer)
    list = []
    k = n
    while 9 < k
        push!(list,mod(k,10))
        k = div(k, 10)
   end
    push!(list,k)
end
```

Next, let's write a function called `is_happy` which determines if a number `n` is happy.  The function should be recursive and return true if it is 1, return false if it is 4 and do the steps above otherwise.  The template for the function should be

```
function is_happy(n::Integer)

end
```

#### Finding Happy numbers

One way to find happy numbers then is check a range of integers using the function you wrote above.  For example, you can type
```
[is_happy(n) for n=1:100]
```

which will return an array of true/false if the number is happy or not.

This isn't so helpful though if you look halfway down the list, what number is happy?  A better way to do this is to use julia's built-in function `filter`.  For example,
```
filter(is_happy, 1:100)
```

returns all integers between 1 and 100 that are happy.  


Speeding up `is_prime`
------

If you time the `is_prime` function as we wrote above, you'll notice how slow it is.  The reason why is it relies on the `all_factors` function which checks every every number between 2 and n if it is a factor.  This is very ineffeicient, so we will try some ways to speed things up.

* in `all_factors` stop at `n/2`
* in `all_factors` check prime numbers and products of previous factors.  
* don't use `all_factors` at all.  Check only odd numbers
* check only primes.  (How to do this?)



Primes can be big!!
------

If you do a quick google search on the largest prime number known, you'll see that primes are big.  As of early 2016, the largest prime had 22,338,618 digits.  Let's not go that big.  

Look at the number $2^{89}-1$, which is prime.  If we type this into julia, we get `-1`, does this mean that $2^{89}=0$?  A bit of a hint is to try to raise 2 the 60th power and higher.  What happens?  Remember that to store a number in a computer, it is typically done using binary.  You can use the function `bits` to see how the number is stored.  Try `bits(2^60)` and higher powers.  What's going on?   

Does this mean we're stuck trying to see if $2^{89}-1$ is prime.  Actually, there is a built-in data type called a `BigInt` that can handle any sized integer.  

Here's how we can get big integers.  Type `big(3)` to get a big integer with value 3.  Type `typeof(ans)` to show that.  If we try `big(2^89-1)`, you will get a big integer with value `-1`.  Why?  How can we use `big` to get that value.

Notice that I haven't recommended that you use `is_prime` to test $2^{89}-1$ or even $2^{60}-1$.  Try timing `is_prime(2^28-1)` and `is_prime(2^29-1)`.  Predict how long $2^{89}-1$ will take.  

We used a very bad method to determine primality and will reexamine it later.

Placing Functions in a Separate file
------

Note: this isn't really a topic in Number Theory, but a way to bundle a number of functions together.

Often, there are a number of related functions that you may need.  In this case, consider all of the related number theory functions in this chapter.  We will put all of these in the same file and load it when needed.  Here are the steps:

1. Open a new text file in JuliaBox or in Jupyter on your local machine.  To do this, under NEW (upper right corner of the main page), select *Text File*. Check under the main menu that your

2. Change the Language to Julia under the *Language* pull down menu.

2. Change the name of the file to `filename.jl`. where `filename` is appropriately named.

3. You can type all of the functions in this file like:
    ```
    function all_factors(n::Integer)
        factors = [1]
        for i=2:n
            if mod(n,i)==0
                push!(factors,i)
            end
        end
        factors
    end

    function is_prime(n::Integer)
        # fill in the details
    end

    function next_prime(n::Integer)
      # fill in the details
    end

    function is_perfect(n::Integer)
      # fill in the details
    end
    ```

4. To load in these files, type `include("filename.jl")` in the ipynb file.  

5. Note: if you change anything in the file, you will need to rerun the `include` command above.  
